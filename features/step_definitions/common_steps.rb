Given /I have a user named (.+)/ do |username|
  User.create :name => username, :login => username, :email => "#{username}@timetrac.com", :password => "password", :confirm_password => "password"
end

Given /(.+) is logged in/ do |username|
  User.find_by_name(username)
end