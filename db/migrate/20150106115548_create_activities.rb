class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.datetime :when
      t.belongs_to :author, index: true
      t.timestamps null: false
    end
  end
end
