class Comment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :commenter, class_name: "User"
  validates :commenter, presence: true
  validates :body, presence: true
end
