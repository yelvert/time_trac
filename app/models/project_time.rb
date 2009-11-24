class ProjectTime < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  named_scope :by_user, lambda {|p,u| {:conditions => ["project_id = ? AND user_id = ?", p.id, u.id]}}
  named_scope :last_running, lambda {|u| {:conditions => ["user_id = ? AND end_time IS NULL", u.id], :order => "start_time DESC", :limit => 1}}
  
  def elapsed_time
    if self.end_time.nil?
      (DateTime.now.to_f.to_i - self.start_time.to_datetime.to_f.to_i).to_i
    else
      (self.end_time - self.start_time).to_i
    end
  end
end
