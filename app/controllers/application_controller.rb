class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception

    def chopped_params
        params.except(:controller, :action, :format)
    end

    def key_passed?(array, key)
        array.include?(key)
    end

    def nil_or_empty?(object)
        object.nil? || object.empty?
    end

    def block_if_unpermitted(array)
        chopped_params.each{|k, v| render_unpermitted and return if !key_passed?(array, k)}
    end

    def warn_if_params_empty
        chopped_params.each{|k, v| warn_empty_param(k) and return if nil_or_empty?(v) }
    end

    def warn_empty_param(key)
        render :json => {error: "#{key} parameter value is empty"}, status: 400
    end

    def render_unpermitted
        render :json => {error: "Unpermitted parameters"}, status: 400
    end

    def render_no_result
        render :json => {data: [], message: "No results found", about: about}
    end

    def downcase_params
       params.each {|key, value| value.downcase!} 
    end

    def about
        {
            github:     "https://github.com/zulhfreelancer/banjir-api",
            source:     "http://bencanaalam.jkr.gov.my/v2/",
            created_by: "Zulhilmi Zainudin",
        }
    end

end
