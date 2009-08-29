require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/new.html.erb" do
  include ProjectsHelper

  before(:each) do
    assigns[:project] = stub_model(Project,
      :new_record? => true,
      :owner_id => 1,
      :name => "value for name"
    )
  end

  it "renders new project form" do
    render

    response.should have_tag("form[action=?][method=post]", projects_path) do
      with_tag("input#project_owner_id[name=?]", "project[owner_id]")
      with_tag("input#project_name[name=?]", "project[name]")
    end
  end
end
