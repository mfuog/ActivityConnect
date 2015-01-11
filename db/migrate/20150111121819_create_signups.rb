class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :participant, index: true
      t.timestamps null: false
    end
  end
end
