class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]

  def index
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    else
      @projects = Project.all.order('created_at DESC')
    end
  end

  def show
    @project = Project.find(params[:id])
    @back_users = []
    @project.users.each do |user|
      unless @back_users.include?(user)
        @back_users.push user
      end
    end
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

end
