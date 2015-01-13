require "rails_helper"

describe User do
  it { should belong_to(:caregiver) }
  it { should have_many(:care_recipients) }
  it { should have_many(:authored_activities) }
  it { should have_many(:joined_activities) }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :role }
  it { should validate_presence_of :address }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should define_enum_for(:gender).with([:male, :female]) }
  it { should define_enum_for(:role).with([:admin, :caregiver, :care_recipient]) }

  describe "role" do
    it "is 'care_recipient' by default" do
      user = FactoryGirl.create(:user)
      expect(user.role).to eq("care_recipient")
    end
  end
end

