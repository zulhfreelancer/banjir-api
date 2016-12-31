class Api::V1::ReportsController < ApplicationController
    def index
        render :json => \
            {
                data: Report.latest,
                created_by: "Zulhilmi Zainudin",
                github:     "https://github.com/zulhfreelancer/banjir-api",
                source:     "http://bencanaalam.jkr.gov.my/v2/"
            },
            except: [:created_at, :updated_at, :batch_id]
    end
end
