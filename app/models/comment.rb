class Comment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :commenter, class_name: "User"
end
