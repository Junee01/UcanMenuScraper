
set :environment, 'development'
#development 환경에서만 동작하며, 매주 월요일 새벽 2시에 동작합니다.
every :monday, :at => '2am' do
	rake "echo:request_task"
end
