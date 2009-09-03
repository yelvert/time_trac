class Project < ActiveRecord::Base
  has_many :user_projects
  has_many :users, :through =>:user_projects
  has_many :project_times
  
  validates_uniqueness_of :name
  
  def owner
    User.find(self.owner_id)
  end
  
  def total_time
    x = 0
    self.project_times.each {|pt| x += pt.elapsed_time}
    x
  end
  
  def total_time_for_user(user)
    x = 0
    self.project_times.by_user(self, user).each {|pt| x += pt.elapsed_time}
    x
  end
end