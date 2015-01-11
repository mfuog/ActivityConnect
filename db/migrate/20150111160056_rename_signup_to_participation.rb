class RenameSignupToParticipation < ActiveRecord::Migration
  def change
    rename_table :signups, :participations
  end
end
