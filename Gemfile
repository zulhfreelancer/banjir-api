source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',     '~> 5.0.1'
gem 'pg',        '~> 0.18'
gem 'puma',      '~> 3.0'
gem 'uglifier',  '>= 1.3.0'
gem 'nokogiri',  '~> 1.7'
gem 'sanitize',  '~> 4.4'
gem 'rack-cors', '~> 0.4.0'

group :development do
  gem 'byebug',                platform: :mri
  gem 'listen',                '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print',         '~> 1.7'
end
