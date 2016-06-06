class AssignProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :project_and_project_members, only: [:assign_memeber, :create_project_members, :show_weeks]
  before_action :get_users, only: [:users, :assign_memeber, :create_project_members,
   :show_users_time_sheets, :approve_time_sheets, :reject_time_sheets]
  before_action :initialize_project_member, only: [:assign_memeber, :create_project_members]
  before_action :projects, only: [:users, :show_users_time_sheets, :approve_time_sheets, :reject_time_sheets]

  def index
    @assignproject = AssignProject.where("new_code ilike ?","%#{params[:search_text]}")
  end
  
  def time_entry
    @projects = []
    ProjectMember.where(:member_id => current_user.id).each do |pm|
      @projects << pm.project
    end
  end

  def users
    
  end

  def assign_memeber

  end

  def create_project_members
    @project.project_members.each { |pm| pm.destroy }
    unless params[:member].nil?
      params[:member].each do |member|
        ProjectMember.create(member_id: member.to_i, project_id: @project.id)
      end
    end
    redirect_to assign_memeber_path(:id => @project.id), notice: "Project Members assigned successfully."
  end

  def show_weeks
    time_entry = TimeEntryDetail.where(project_id: @project.id, user_id: current_user.id).order("id desc").first
    if time_entry.nil?
      @dates = Array(Date.today.beginning_of_week..Date.today.end_of_year).in_groups_of(7).first
    else
      @dates = Array(time_entry.end_date.next_day..time_entry.end_date+7.days)
    end
  end

  def save_time_entries
    TimeEntryDetail.create(start_date: params[:start_date], end_date: params[:end_date],
      project_id: params[:project_id], user_id: current_user.id, hours: params[:total_hours])
    @time_sheet_details = TimeEntryDetail.where(user_id: current_user.id)
    render action: "show_time_sheet_details", layout: true
  end

  def show_project_members
    @users = [] 
    ProjectMember.where(project_id: params[:project_id]).each do |pm|
      @users << pm.member
    end
  end

  def show_users_time_sheets
    if params[:member][:id].blank? && params[:project][:id].blank?
      @time_entries = TimeEntryDetail.all
    elsif params[:member][:id].present? && params[:project][:id].blank?
      @time_entries = TimeEntryDetail.where(user_id: params[:member][:id])
    elsif params[:member][:id].blank? && params[:project][:id].present?
      @time_entries = TimeEntryDetail.where(project_id: params[:project][:id])
    elsif params[:member][:id].present? && params[:project][:id].present?
      @time_entries = TimeEntryDetail.where(project_id: params[:project][:id], user_id: params[:member][:id])
    end

  end

  def approve_time_sheets
    TimeEntryDetail.find(params[:id]).update_attributes(is_approved: true)
    flash.now[:success] = "Time Sheet Approved successfully"
    render html: "", layout: true
  end

  def reject_time_sheets
    TimeEntryDetail.find(params[:id]).update_attributes(is_approved: false)
    flash.now[:success] = "Time Sheet Rejected successfully"
    render html: "", layout: true
  end

  private
  def project_and_project_members
    @project = Project.find(params[:id])
    @members = @project.project_members.pluck(:member_id)
  end

  def initialize_project_member
    @project_member = ProjectMember.new
  end

  def get_users
    @users = User.all
  end

  def projects
    @projects = Project.all
  end
end
