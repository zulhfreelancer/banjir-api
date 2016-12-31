class Api::V1::ReportsController < ApplicationController
    def index
        @reports = Report.latest
        render :json => \
            {
                data:            @reports,
                last_updated_at: @reports.last.created_at,
                created_by:      "Zulhilmi Zainudin",
                github:          "https://github.com/zulhfreelancer/banjir-api",
                source:          "http://bencanaalam.jkr.gov.my/v2/"
            },
            except: [:created_at, :updated_at, :batch_id]
    end
end
