require "rails_helper"

RSpec.describe ActivitiesController, :type => :controller do

  describe "POST create" do
    before(:each) do
      @activity = FactoryGirl.create(:activity)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "with valid params" do
      before(:each) do
        post :create, activity: { author_id: @user.id,
                                  title: "New activity",
                                  description: "Let's go shopping!"}
      end

      it "returns a 302 found response" do
        expect(response).to have_http_status(302)
      end

      it "creates a new activity with the current user as author" do
        activity = Activity.find_by_title("New activity")
        expect(activity).to be_present
        expect(activity.author).to eq(@user)
      end

      it "redirects back to the associated activity" do
        activity = Activity.find_by_title("New activity")
        expect(response).to redirect_to(activity_path(activity.id))
      end
    end
  end
end
