require "rails_helper"

feature "user visits homepage" do
  scenario "successfully" do
    login_as create(:user)
    visit root_path
    expect(page).to have_content( 'Movie Collections' )
  end
end
