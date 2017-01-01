source 'https://rubygems.org'
ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',     '~> 5.0.1'
gem 'pg',        '~> 0.19.0'
gem 'puma',      '~> 3.0'
gem 'uglifier',  '>= 1.3.0'
gem 'nokogiri',  '~> 1.7'
gem 'sanitize',  '~> 4.4'
gem 'rack-cors', '~> 0.4.0'
gem 'geocoder',  '~> 1.4', '>= 1.4.1'

group :development do
  gem 'byebug',                '~> 9.0', '>= 9.0.6', platform: :mri
  gem 'listen',                '~> 3.0.5'
  gem 'spring',                '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print',         '~> 1.7'
end

group :production do
    gem 'rails_12factor',      '~> 0.0.3'
end
