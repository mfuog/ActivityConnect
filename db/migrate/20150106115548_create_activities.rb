class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.datetime :when
      t.references :author, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :authors
  end
end
