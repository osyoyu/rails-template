remove_file 'Gemfile'
create_file 'Gemfile'

# Gemfile
add_source 'https://rubygems.org'

gem 'rails', Rails::VERSION::STRING
gem 'turbolinks'
gem 'slim-rails'
gem 'sass-rails'

gem_group :development, :test do
  gem 'sqlite3'

  gem 'rspec-rails'

  gem 'byebug'
  gem 'pry-rails'
  gem 'pry-byebug'
end

gem_group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem_group :production do
  gem 'unicorn'
end
