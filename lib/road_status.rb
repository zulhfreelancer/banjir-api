class RoadStatus

    # get middle cell under 'Status Jalan'
    # THE MOST BOTTOM IS THE LATEST RESULT
    def self.get(url_path)
        puts "---- start scraping #{url_path} ----"
        url  = "http://bencanaalam.jkr.gov.my/v2/" + url_path
        page = Nokogiri::HTML(open(url))
        get_status(page)
    end

    # only return recent IF it's present and contains "kenderaan" word
    def self.get_status(page)
        recent  = get_recent(page)
        history = get_history(page)
        recent.present? ? recent : history
    end

    # previous record / not most recent / top in table UI
    def self.get_history(page)
        begin
            row = page.css('.print table table tr:nth-child(2) td:nth-child(2)')
            extract_cell(row) 
        rescue Exception
            return nil
        end
    end

    # most recent / bottom in table UI
    def self.get_recent(page)
        begin
            row = page.css('.print table table tr:nth-child(3) td:nth-child(2)')
            extract_cell(row)
        rescue Exception
            return nil
        end
    end

    # extract table td and remove leading and ending empty spaces from it
    # return the first line if the line contains "kenderaan" in it
    def self.extract_cell(row)
        status = Sanitize.fragment(row).squish.split("-")[1].squish
        status.include?("kenderaan") ? status : nil
    end

end
