source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

### Rails 5 default gems
gem 'rails', '~> 5.1', '>= 5.1.5'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.11', '>= 3.11.3'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'uglifier', '~> 4.1', '>= 4.1.8'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'turbolinks', '~> 5.1'
gem 'jbuilder', '~> 2.7'
# gem 'therubyracer', '~> 0.12.3', platform: :ruby

group :development, :test do
  gem 'byebug', '~> 10.0', platform: :mri
end

group :development do
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end


### App-specific gems
gem 'annotate', '~> 2.7', '>= 2.7.2'
gem 'bootstrap', '~> 4.0'
gem 'paperclip', '~> 6.0'
gem 'simple_form', '~> 3.5', '>= 3.5.1'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'font-awesome-sass', '~> 5.0', '>= 5.0.6.2'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
source 'https://rails-assets.org' do
  gem 'rails-assets-adminlte', '~> 2.3', '>= 2.3.11'
  gem 'rails-assets-ionicons', '~> 4.0', '>= 4.0.0.18'
  gem 'rails-assets-iCheck', '~> 1.0', '>= 1.0.2'
  gem 'rails-assets-slimScroll', '~> 1.3', '>= 1.3.8'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'sprockets-rails', '~> 3.2', '>= 3.2.1', require: 'sprockets/railtie'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :development do
  gem 'capistrano', '~> 3.10', '>= 3.10.1', require: false
  gem 'capistrano-rvm', '~> 0.1.2', require: false
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1', require: false
  gem 'capistrano3-puma', '~> 3.1', '>= 3.1.1', require: false
  gem 'capistrano3-nginx', '~> 2.1', '>= 2.1.6', require: false
  gem 'capistrano-upload-config', '~> 0.8.2', require: false
  gem 'capistrano-locally', '~> 0.2.5', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'factory_girl_rails', '~> 4.9'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'cucumber-rails', '~> 1.5', require: false
  gem 'poltergeist', '~> 1.17'
  gem 'phantomjs', '~> 2.1', '>= 2.1.1.0', require: 'phantomjs/poltergeist'
end

### Optional gems
# gem 'redis'  # Use Redis adapter to run Action Cable in production
# gem 'bcrypt'  # Use ActiveModel has_secure_password
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
