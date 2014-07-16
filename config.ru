#\ -p 8000

# app will run on port 8000, alternatively you can use `set :port=> 8000`
require File.join(File.dirname(__FILE__), 'app')

set :run, false
set :environment, :production


FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application