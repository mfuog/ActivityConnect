class RenameWhenToProposedTime < ActiveRecord::Migration
  def change
  	rename_column :activities, :when, :proposed_time
  end
end
