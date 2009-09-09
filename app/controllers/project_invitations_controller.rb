class ProjectInvitationsController < ApplicationController
  # GET /project_invitations
  # GET /project_invitations.xml
  def index
    @project_invitations = ProjectInvitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_invitations }
    end
  end

  # GET /project_invitations/1
  # GET /project_invitations/1.xml
  def show
    @project_invitation = ProjectInvitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_invitation }
    end
  end

  # GET /project_invitations/new
  # GET /project_invitations/new.xml
  def new
    @project_invitation = ProjectInvitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_invitation }
    end
  end

  # GET /project_invitations/1/edit
  def edit
    @project_invitation = ProjectInvitation.find(params[:id])
  end

  # POST /project_invitations
  # POST /project_invitations.xml
  def create
    @project_invitation = ProjectInvitation.new(params[:project_invitation])

    respond_to do |format|
      if @project_invitation.save
        flash[:notice] = 'ProjectInvitation was successfully created.'
        format.html { redirect_to(@project_invitation) }
        format.xml  { render :xml => @project_invitation, :status => :created, :location => @project_invitation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_invitations/1
  # PUT /project_invitations/1.xml
  def update
    @project_invitation = ProjectInvitation.find(params[:id])

    respond_to do |format|
      if @project_invitation.update_attributes(params[:project_invitation])
        flash[:notice] = 'ProjectInvitation was successfully updated.'
        format.html { redirect_to(@project_invitation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_invitations/1
  # DELETE /project_invitations/1.xml
  def destroy
    @project_invitation = ProjectInvitation.find(params[:id])
    @project_invitation.destroy

    respond_to do |format|
      format.html { redirect_to(project_invitations_url) }
      format.xml  { head :ok }
    end
  end
end
