class Project < ActiveRecord::Base
  has_many :user_projects
  has_many :users, :through =>:user_projects
  has_many :project_times
  
  validates_uniqueness_of :name
  
  def owner
    User.find(self.owner_id)
  end
end