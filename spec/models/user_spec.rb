require "rails_helper"

describe User do
  it { should have_many(:authored_activities) }
  it { should have_many(:joint_activities) }
  #FIXME
  #it { should have_many(:comments)}#.with_foreign_key('commenter_id') }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :role }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should define_enum_for(:role).with([:admin, :caretaker, :user]) }

  describe "role" do
    it "is 'user' by default" do
      user = FactoryGirl.create(:user)
      expect(user.role).to eq('user')
    end
  end
end

