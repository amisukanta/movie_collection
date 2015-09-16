require "rails_helper"

feature "user log in" do
  scenario "allows an existing user to sing in" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit "users/sign_in"

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end
    click_button "Log in"
    expect(page).to have_content 'Signed in successfully.'
  end
end
