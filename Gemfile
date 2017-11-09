source 'https://rubygems.org'

ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'dotenv-rails'

gem 'activeadmin'
gem 'agent_orange'
gem 'carrierwave'
gem 'chartkick'
gem 'devise'
gem 'fog-aws'
gem 'groupdate'
gem 'rack-attack'
gem 'rails', '~> 5.0.2'
gem 'sendgrid-ruby'


group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :staging, :production do
  gem 'newrelic_rpm'
  gem 'pg'
  gem 'puma', '~> 3.0'
  gem 'rack-timeout'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
