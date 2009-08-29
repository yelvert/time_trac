Given /^I have a user named (\w+)$/ do |user|
  User.create!(:login => user.downcase, :password => "testing", :password_confirmation => "testing", :name => user, :email => "#{user.downcase}@test.com")
end

Given /^(\w+) owns projects? (.+)$/ do |user, projects|
  user = User.find_by_login(user.downcase)
  projects.split(', ').each do |project|
    user.projects << Project.create!(:name => project, :owner_id => user.id)
  end
end

Given /^(\w+) is a part of projects? (.+)$/ do |user, projects|
  user = User.find_by_login(user.downcase)
  projects.split(', ').each do |project|
    p = Project.find_by_name(project) || Project.create!(:name => project, :owner_id => user.id)
    p.users << user
    p.save
  end
end

When /^I create a new project named (.+) with (.+)$/ do |project, name|
  visit new_project_path
  fill_in "Name", :with => project
  click_button "Create"
end

When /^I change the name of project "([^\"]*)" to "([^\"]*)"$/ do |oldName, newName|
  visit edit_project_path(Project.find_by_name(oldName))
  fill_in "Name", :with => newName
  click_button "Update"
end



Then /^I should see edit and destroy for (.+)$/ do |projects|
  projects.split(', ').each do |project|
    p = Project.find_by_name(project).id
    response.should have_selector("td#project_#{p}_edit")
    response.should have_selector("td#project_#{p}_destroy")
  end
end

Then /^I should not see edit and destroy for (.+)$/ do |projects|
  projects.split(', ').each do |project|
    p = Project.find_by_name(project).id
    response.should_not have_selector("td#project_#{p}_edit")
    response.should_not have_selector("td#project_#{p}_destroy")
  end
end
