Rails.application.routes.draw do

    root to: redirect('/api/v1/reports.json')

    namespace :api do
        namespace :v1 do
            resources :reports, only: [:index]
        end
    end
end
