class Project < ActiveRecord::Base
	validates :name, presence:true, uniqueness: true
	has_many :project_members, dependent: :destroy
	has_many :time_entry_details, dependent: :destroy
end
