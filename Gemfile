source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

### Rails 5 default gems
gem 'rails', '~> 5.1', '>= 5.1.1'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.8', '>= 3.8.2'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'uglifier', '~> 3.2'
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
gem 'jbuilder', '~> 2.6', '>= 2.6.4'
# gem 'therubyracer', '~> 0.12.3', platform: :ruby

group :development, :test do
  gem 'byebug', '~> 9.0', '>= 9.0.6', platform: :mri
end

group :development do
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end


### App-specific gems
gem 'annotate', '~> 2.7', '>= 2.7.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'paperclip', '~> 5.1'
gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.3'
gem 'font-awesome-sass', '~> 4.7'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
source 'https://rails-assets.org' do
  gem 'rails-assets-adminlte', '~> 2.3', '>= 2.3.11'
  gem 'rails-assets-ionicons', '~> 2.0', '>= 2.0.1'
  gem 'rails-assets-iCheck', '~> 1.0', '>= 1.0.2'
  gem 'rails-assets-slimScroll', '~> 1.3', '>= 1.3.8'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'sprockets-rails', '~> 3.2', '>= 3.2.0', require: 'sprockets/railtie'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :development do
  gem 'capistrano', '~> 3.8', '>= 3.8.1', require: false
  gem 'capistrano-rvm', '~> 0.1.2', require: false
  gem 'capistrano-rails', '~> 1.2', '>= 1.2.3', require: false
  gem 'capistrano3-puma', '~> 3.1', require: false
  gem 'capistrano3-nginx', '~> 2.1', '>= 2.1.6', require: false
  gem 'capistrano-upload-config', '~> 0.7.0', require: false
  gem 'capistrano-locally', '~> 0.2.4', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'faker', '~> 1.7', '>= 1.7.3'
  gem 'cucumber-rails', '~> 1.5', require: false
  gem 'poltergeist', '~> 1.15'
  gem 'phantomjs', '~> 2.1', '>= 2.1.1.0', require: 'phantomjs/poltergeist'
end

### Optional gems
# gem 'redis'  # Use Redis adapter to run Action Cable in production
# gem 'bcrypt'  # Use ActiveModel has_secure_password
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem