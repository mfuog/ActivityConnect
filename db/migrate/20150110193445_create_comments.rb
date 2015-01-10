class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commenter, index: true
      t.references :activity, index: true
      t.text :body
      t.timestamps null: false
    end
  end
end
