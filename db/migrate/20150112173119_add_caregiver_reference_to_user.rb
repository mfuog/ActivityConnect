class AddCaregiverReferenceToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :caregiver, index: true
    end
  end
end
