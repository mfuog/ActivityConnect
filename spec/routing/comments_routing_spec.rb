require "rails_helper"

RSpec.describe CommentsController, :type => :routing do
  describe "POST /comments" do
    it "routes to #create" do
      expect(:post => "/comments").to route_to("comments#create")
    end
  end

  describe "GET /activities/:id/comments" do
    it "routes to #index" do
      expect(:get => "activities/1/comments.json").to route_to(controller: "comments",
                                                                action: "index",
                                                                activity_id: "1",
                                                                format: "json")
    end
  end
end
