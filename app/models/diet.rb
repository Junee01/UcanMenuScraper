class Diet < ActiveRecord::Base
	validates :univ_id, :uniqueness => { :scope => [:name, :date, :time, :diet] }
end
