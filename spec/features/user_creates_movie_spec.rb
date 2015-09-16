require "rails_helper"

feature "User creates movie" do
  scenario "successfully" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit root_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"
    visit new_movie_path
    #click_on "Add new movie"
    fill_in "Title", with: "Amerian Gangster"
    fill_in "Summary", with: "Lorem spam lorem spam"
    click_on "Save changes"
    expect(page).to have_content("Movie created successfully")
    expect(page).to have_content("Amerian Gangster")
  end
end
