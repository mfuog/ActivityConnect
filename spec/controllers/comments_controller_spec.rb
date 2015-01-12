require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  describe "POST create" do
    before(:each) do
      @activity = FactoryGirl.create(:activity)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "with valid params" do
      before(:each) do
        post :create, comment: { commenter_id: @user.id,
                                  body: "This is a comment",
                                  activity_id: @activity.id }
      end

      it "returns a 302 found response" do
        expect(response).to have_http_status(302)
      end

      it "creates a new Comment with the current user as commenter" do
        comment = Comment.find_by_body("This is a comment")
        expect(comment).to be_present
        expect(comment.commenter).to eq(@user)
      end

      it "creates an activity reference for the new comment" do
        comment = Comment.find_by_body("This is a comment")
        expect(comment.activity).to eq(@activity)
      end

      it "redirects back to the associated activity" do
        expect(response).to redirect_to(activity_path(@activity.id))
      end
    end
  end
end
