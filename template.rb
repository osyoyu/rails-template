# Guess or just ask the user's preferred database
case File.read('Gemfile')
when /'mysql2'/
  ar_adapter = 'mysql2'
when /'pg'/
  ar_adapter = 'pg'
else
  ar_adapter ||= ask("Which database adapter do you wish to use?", limited_to: ['sqlite3', 'mysql2', 'pg'])
end


# Gemfile
remove_file 'Gemfile'
create_file 'Gemfile'

add_source 'https://rubygems.org'

gem 'rails', Rails::VERSION::STRING
gem 'slim-rails'

case ar_adapter
when 'sqlite3'
  gem 'sqlite3'
when 'mysql2'
  gem 'mysql2', '>= 0.3.13', '< 0.5'
when 'pg'
  gem 'pg'
end

gem_group :development, :test do
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


# Replace application.html.erb
remove_file 'app/views/layouts/application.html.erb'
if File.exists?(File.join(File.dirname(__FILE__), 'application.html.slim'))
  copy_file File.join(File.dirname(__FILE__), 'application.html.slim'), 'app/views/layouts/application.html.slim'
else
  get 'https://raw.githubusercontent.com/osyoyu/rails-template/master/application.html.slim', 'app/views/layouts/application.html.slim'
end
gsub_file 'app/views/layouts/application.html.slim', /APP_CONST_BASE/, @app_const_base


if no?('Do you plan to use Sprockets? (say no if you plan to use Browserify)')
  say "OK, I'll comment all Sprockets-style requires in application.{js,css}. You might want to require your Browserify output."
  gsub_file 'app/assets/javascripts/application.js', %r{//=}, '//'
  gsub_file 'app/assets/stylesheets/application.css', %r{\*=}, '*'
end
