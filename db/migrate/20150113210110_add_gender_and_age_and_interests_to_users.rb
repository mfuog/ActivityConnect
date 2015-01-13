class AddGenderAndAgeAndInterestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :integer
    add_column :users, :age, :integer
    add_column :users, :interests, :text
  end
end
