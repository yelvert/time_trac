class CreateProjectInvitations < ActiveRecord::Migration
  def self.up
    create_table :project_invitations do |t|
      t.integer :project_id
      t.string :invite_code
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :project_invitations
  end
end
