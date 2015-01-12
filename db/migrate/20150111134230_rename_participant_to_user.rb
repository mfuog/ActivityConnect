class RenameParticipantToUser < ActiveRecord::Migration
  def change
    rename_column :signups, :participant_id, :user_id
  end
end
