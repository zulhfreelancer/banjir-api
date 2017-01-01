class Api::V1::ReportsController < ApplicationController
    
    before_action :check_params, :warn_if_params_empty, :downcase_params

    def index
        @reports = SearchReport.perform_search(params)
        render_result(@reports)
    end

    private

    def render_result(array)
        render_no_result and return if array.blank?
        render :json => \
            { last_updated_at: array.last.created_at, data: array, about: about },
            except: [:created_at, :updated_at, :batch_id]
    end

    def check_params
        block_if_unpermitted(['daerah', 'negeri'])
    end

end
