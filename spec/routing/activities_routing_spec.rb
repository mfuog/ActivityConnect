require "rails_helper"

RSpec.describe ActivitiesController, :type => :routing do

  describe "GET /activities/:id/participants" do
    it "routes to #participants" do
      expect(:get => "activities/1/participants.json").to route_to(controller: "activities",
                                                                action: "participants",
                                                                id: "1",
                                                                format: "json")
    end
  end
end
