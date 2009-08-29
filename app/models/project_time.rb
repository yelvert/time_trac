class ProjectTime < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  def elapsed_time
    if self.end_time.nil?
      nil
    else
      self.end_time - self.start_time
    end
  end
end
