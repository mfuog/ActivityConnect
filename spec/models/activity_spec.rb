require "rails_helper"

describe Activity do
  it { should belong_to(:author) }
  it { should have_many(:comments) }
  it { should have_many(:participants) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :address }

  describe "activity address" do
    it "is the author's address by default" do
      activity = FactoryGirl.create(:activity, address: nil)
      expect(activity.address).to eq(activity.author.address)
    end
  end

  describe "#has_participants?" do
    before(:each) do
      @activity = FactoryGirl.create(:activity)
      @user = FactoryGirl.create(:user)
    end

    it "returns false if an activity has no participants" do
      expect(@activity).to_not have_participant(@user)
    end

    context "if an activity has one participant" do
      before(:each) do
        @activity.participants << @user 
      end

      it "returns true for that user" do
        expect(@activity).to have_participant(@user)
      end

      it "returns false another user" do
        other_user = FactoryGirl.create(:user)
        expect(@activity).to_not have_participant(other_user)
      end
    end
  end
end

