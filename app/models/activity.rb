class Activity < ActiveRecord::Base
  default_scope { order('proposed_time ASC') }
  belongs_to :author, class_name: "User"
  has_many :comments 
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user

  validates :author, presence: true
  validates :title, presence: true
  validates :description, presence: true

  # Determine wether a user is a participant of the activity.
  #
  # user - The user to check for.
  # Returns true if the user is a participant, or false otherwise.
  def has_participant?(user)
    participants.any? { |p| p.id == user.id }
  end
end
