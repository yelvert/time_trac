Given /I have a user named (.+)/ do |username|
  User.create :name => username, :login => username, :email => "#{username}@timetrac.com", :password => "password", :password_confirmation => "password"
end

Given /(.+) is logged in/ do |username|
  User.find_by_name(username)
end