Sinatra Base Template


features

* log
* environment
* erb templates
* bundler/Gemfile
* guard for reloading app on change
* public folder
* lib folder
* use rack test to test app




usage

git clone https://github.com/senthilnayagam/sinatra-base-template.git

bundle install

bundle exec guard

 now the app will be running on port 8000
 
 http://127.0.0.1:8000/


if you modify any file the app will restart itself


running test

ruby app_test.rb