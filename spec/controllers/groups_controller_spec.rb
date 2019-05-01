require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe "GET index" do
    it "assigns @groups" do
      group = FactoryBot.create(:group)
      get :index
      expect(assigns(:groups)).to eq([group])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET group#show" do
    it "should render groups#show template" do
      group = FactoryBot.create(:group)

      get :show, params: { id: group.id.to_s }

      expect(response).to render_template("show")
    end
  end
end
