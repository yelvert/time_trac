class CreateProjectTimes < ActiveRecord::Migration
  def self.up
    create_table :project_times do |t|
      t.integer :project_id
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :project_times
  end
end
