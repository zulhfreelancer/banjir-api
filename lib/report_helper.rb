class ReportHelper

    def self.add_record(array)
    	Report.destroy_all
        array.each {|item| Report.create(item)}
        Report.bump_batch_id
    end

end
