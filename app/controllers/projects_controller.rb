class ProjectsController < ApplicationController
  before_filter :owns_project, :only => [:edit, :update, :destroy]
  before_filter :is_part_of_project, :only => [:show]
  # GET /projects
  # GET /projects.xml
  def index
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    #if params[:owner] && params[:name]
    #  @project = Project.find_by_owner_id_and_name(User.find_by_login(params[:owner]), params[:name])
    #else
      @project = Project.find(params[:id])
    #end
    #if @project.nil?
    #  respond_to do |format|
    #    flash[:error] = "This project does not exist."
    #    format.html { redirect_to projects_path }
    #    format.xml { redirect_to projects_path }
    #  end
    #else
      @last_running = @project.project_times.last_running(current_user)
      @last_running = @last_running.blank? ? nil : @last_running[0]
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @project }
      end
    #end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    params[:project][:owner_id] = current_user.id
    @project = Project.new(params[:project])
    @project.users << current_user
    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  
  def start
    @project = Project.find(params[:id])
    @project_time = ProjectTime.new(:user_id => current_user.id, :project_id => @project.id, :start_time => DateTime.now)
    @project_time.save
    render :action => "start.rjs"
  end
  
  def stop
    @project_time = ProjectTime.find(params[:id])
    @project_time.end_time = DateTime.now
    @project_time.notes = params[:notes]
    @project_time.save
    render :action => "stop.rjs"
  end
  
  def add_time
    @project = Project.find(params[:id])
    params[:project_time].merge! :user_id => current_user.id, :project_id => @project.id
    @project_time = ProjectTime.new(params[:project_time])
    @project_time.save
    render :action => "add_time.rjs"
  end
  
protected
  def owns_project
    unless current_user.owns_project(params[:id].to_i)
      flash[:error] = "You do not own this project"
      redirect_to project_path(params[:id].to_i)
    else
      true
    end
  end
  
  def is_part_of_project
    unless current_user.is_part_of_project(params[:id].to_i)
      flash[:error] = "You are not part of this project"
      redirect_to(projects_path)
    end
  end
end