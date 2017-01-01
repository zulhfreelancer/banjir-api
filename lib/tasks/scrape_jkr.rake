task :scrape_jkr => :environment do
    puts "********** START SCRAPING **********"

    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'sanitize'
    require 'uri'

    warning = "Penduduk di kawasan yang terlibat dan di kawasan sekitar diminta berjaga-jaga dan mengutamakan keselamatan."
    url     = "http://bencanaalam.jkr.gov.my/v2/index.php?page=map&code=99&types=banjir&tahun="
    page    = Nokogiri::HTML(open(url))
    rows    = page.css('div#content_left > div > table > tr')
    array   = []

    rows.each do |row|
        next if row.css('td').count != 4 # hr tag in single td
        next if row.css('td')[1].text == "Maklumat Bencana"
        hash         = {}
        negeri       = ""
        dikemaskini  = Sanitize.fragment(row.css('td')[3]).squish
        raw_data     = row.css('td')[1]

        # get URL in 'onclick' element of '[Peta lokasi]'
        status_page = raw_data.to_s.match(/'([^']+)/).to_s.delete("'")
        status      = RoadStatus.get(status_page)

        # return Array
        cleaned_data = Sanitize.fragment(raw_data, elements: ["br"])\
                       .gsub(": Banjir", "")\
                       .gsub("- (Paras Air", "Paras Air")\
                       .gsub("Meter)", "")\
                       .gsub("Masa", "<br>Masa")\
                       .gsub(warning, "")\
                       .split("<br>")\
                       .map(&:squish).reject!(&:empty?)

        # remove `[Peta lokasi] Tiada paparan laluan alternatif`
        # return Array
        cleaned_array = cleaned_data - Array.new.push(cleaned_data.last)

        cleaned_array.each do |c|
            data              = c.split(":").map(&:squish)
            daerah_and_negeri = data[1] if data[0] == "Daerah"
            data[1]           = daerah_and_negeri.split("-").first.squish if data[0] == "Daerah"
            negeri            = daerah_and_negeri.split("-").last.squish  if data[0] == "Daerah"
            next if data.include?("Masa") || data.include?("Tarikh Kejadian")
            hash.merge!({data[0] => data[1]})
        end

        hash.merge!({
                        "Negeri"      => negeri,
                        "Dikemaskini" => dikemaskini,
                        "Status"      => status
                    })
        snakecased = hash.transform_keys{|key| key.parameterize.underscore}
        array << snakecased
    end
    ReportHelper.add_record(array)
    # ap array
    # puts "\n-----------------------------\n"
    puts "********** FINISH SCRAPING **********"
end
