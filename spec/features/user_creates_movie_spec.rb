require "rails_helper"

feature "User creates movie" do
  scenario "successfully" do
    visit root_path
    click_on "Add new movie"
    fill_in "Title", with: "Amerian Gangster"
    fill_in "Summary", with: "Lorem spam lorem spam"
    click_on "Save changes"
    expect(page).to have_content("Movie created successfully")
    expect(page).to have_content("Amerian Gangster")
  end
end
