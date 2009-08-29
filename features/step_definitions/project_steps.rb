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
  this_user = User.find_by_login(user.downcase)
  this_users_friend = user = User.create!(:login => "#{user.downcase}s_friend", :password => "testing", :password_confirmation => "testing", :name => "#{user}'s Friend", :email => "#{user.downcase}s_friend@test.com")
  projects.split(', ').each do |project|
    p = Project.create!(:name => project, :owner_id => this_users_friend.id)
    p.users = [this_user, this_users_friend]
  end
end

Given /^\w+ does not own and is not a part of projects? (.+)$/ do |projects|
  user = User.create!(:login => "some_user", :password => "testing", :password_confirmation => "testing", :name => "Some User", :email => "some_user@test.com")
  projects.split(', ').each do |project|
    user.projects << Project.create!(:name => project, :owner_id => user.id)
  end
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
