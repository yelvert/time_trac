class AddNotesToProjectTime < ActiveRecord::Migration
  def self.up
    add_column :project_times, :notes, :text
  end

  def self.down
    remove_column :project_times, :notes
  end
end
