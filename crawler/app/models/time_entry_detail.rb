class TimeEntryDetail < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	validates :start_date, uniqueness: { scope: [:project_id, :user_id],
    message: "Can be max one timesheet for one week" }
end
