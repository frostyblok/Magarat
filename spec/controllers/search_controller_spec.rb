require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {query: '#meee'}
      expect(response).to have_http_status(:success)
    end
  end

end
