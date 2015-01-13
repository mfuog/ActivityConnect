class Activity < ActiveRecord::Base
  default_scope { order('proposed_time ASC') }
  belongs_to :author, class_name: "User"
  has_many :comments 
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user

  before_validation :fill_in_defaults
  validates :author, presence: true
  validates :title, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed? # auto-fetch coordinates

  # Determine wether a user is a participant of the activity.
  #
  # user - The user to check for.
  # Returns true if the user is a participant, or false otherwise.
  def has_participant?(user)
    participants.any? { |p| p.id == user.id }
  end

  private

  def fill_in_defaults
    self.address ||= author.address
  end
end
