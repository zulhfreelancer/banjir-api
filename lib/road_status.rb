class RoadStatus

    # get middle cell under 'Status Jalan'
    # THE MOST BOTTOM IS THE LATEST RESULT
    def self.get(url_path)
        puts "**** start scraping #{url_path} ****"
        url  = "http://bencanaalam.jkr.gov.my/v2/" + url_path
        page = Nokogiri::HTML(open(url))
        get_status(page)
    end

    # only return recent IF it's present and contains "kenderaan" word
    def self.get_status(page)
        recent  = get_recent(page)
        history = get_history(page)
        return recent if recent && recent.include?("kenderaan")   
        history.include?("kenderaan") ? history : nil
    end

    # previous record / not most recent / top in table UI
    def self.get_history(page)
        row    = page.css('.print table table tr:nth-child(2) td:nth-child(2)')
        # remove leading and ending empty spaces from it
        Sanitize.fragment(row).squish.split("-")[1].squish
    end

    # most recent / bottom in table UI
    def self.get_recent(page)
        begin
            row     = page.css('.print table table tr:nth-child(3) td:nth-child(2)')
            # remove leading and ending empty spaces from it
            Sanitize.fragment(row).squish.split("-")[1].squish
        rescue Exception
            return nil
        end
    end

end
