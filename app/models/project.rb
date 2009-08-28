class Project < ActiveRecord::Base
  has_many :user_projects
  has_many :user, :through =>:user_projects
  
  def owner
    User.find(self.owner_id)
  end
end