source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

### Rails 5 default gems
gem 'rails', '~> 5.0', '>= 5.0.1'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'uglifier', '~> 3.0', '>= 3.0.4'
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
gem 'jquery-rails', '~> 4.2', '>= 4.2.2'
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
gem 'jbuilder', '~> 2.6', '>= 2.6.1'
# gem 'therubyracer', '~> 0.12.3', platform: :ruby

group :development, :test do
  gem 'byebug', '~> 9.0', '>= 9.0.6', platform: :mri
end

group :development do
  gem 'web-console', '~> 3.4'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end


### App-specific gems
gem 'annotate', '~> 2.7', '>= 2.7.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'paperclip', '~> 5.1'
gem 'simple_form', '~> 3.4'

group :development, :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'sprockets-rails', '~> 3.2', '>= 3.2.0', require: 'sprockets/railtie'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'faker', '~> 1.7', '>= 1.7.3'
  gem 'cucumber-rails', '~> 1.4', '>= 1.4.5', require: false
  gem 'poltergeist', '~> 1.13'
  gem 'phantomjs', '~> 2.1', '>= 2.1.1.0', require: 'phantomjs/poltergeist'
end

### Optional gems
# gem 'redis'  # Use Redis adapter to run Action Cable in production
# gem 'bcrypt'  # Use ActiveModel has_secure_password
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem