require "rails_helper"

RSpec.describe GenesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/genes").to route_to("genes#index")
    end

    it "routes to #new" do
      expect(:get => "/genes/new").to route_to("genes#new")
    end

    it "routes to #show" do
      expect(:get => "/genes/1").to route_to("genes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/genes/1/edit").to route_to("genes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/genes").to route_to("genes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/genes/1").to route_to("genes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/genes/1").to route_to("genes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/genes/1").to route_to("genes#destroy", :id => "1")
    end

  end
end
