require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  describe "update action" do
    before(:each) do
      @current_user = FactoryGirl.create(:user)
      sign_in @current_user
      @other_user = FactoryGirl.create(:user)
      #FIXME: why do tests fail without this line?
      @current_user.update!(role: "admin")
      put :update,
        id: @other_user.id,
        user: { role: "caregiver", caregiver_id: @current_user.id }
    end

    it "returns a 302 found response" do
      expect(response).to have_http_status(302)
    end

    it "modifies the user's attributes" do
      @other_user.reload
      expect(@other_user.role).to eq("caregiver")
      expect(@other_user.caregiver_id).to eq(@current_user.id)
    end
  end
end
