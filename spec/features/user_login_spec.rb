require "rails_helper"

feature "user log in" do
  scenario "allows an existing user to sing in" do
    password = "123456789"
    user = build( :user, password: password, password_confirmation: password )
    visit "users/sign_in"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end
