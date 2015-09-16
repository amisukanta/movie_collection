require "rails_helper"

describe MoviesController do
  describe "#index" do
    it "should get home" do
      login_with create( :user )
      get :index
      expect(response).to be_success
      expect(response).to render_template('index')
      
    end
  end
end
