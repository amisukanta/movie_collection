require "rails_helper"

describe MoviesController do
  describe "#index" do
    it "should get home" do
      login_with create( :user )
      get :index
      expect(response).to be_success
      expect(response).to render_template('index')
    end
    describe "anonymous user" do
      before :each do
        login_with nil
      end
      it "should redirect users to signin" do
        get :index
        expect(response).to redirect_to( new_user_session_path )
      end
    end
  end
end
