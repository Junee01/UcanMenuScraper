# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

#실제로 일어날 일을 적어둡니다.
namespace :echo do
	task :request_task do
		Net::HTTP.get(URI('http://0.0.0.0:3000/diets'))
	end
end