class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :time_entry_details, dependent: :destroy
  has_many :project_members, dependent: :destroy, foreign_key: :member_id

  def admin?
  (:admin)
  end

end
