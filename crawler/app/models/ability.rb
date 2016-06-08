class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    else
      can :time_entry, :AssignProjects
      can :projects,   :Projects
    end

  end
    
 
end
