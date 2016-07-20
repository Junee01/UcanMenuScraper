class Diet < ActiveRecord::Base
	#univ_id를 기준으로 name/date/time을 Unique Key로 보고 중복 구분을 합니다.
	validates :univ_id, :uniqueness => { :scope => [:name, :date, :time] }
end