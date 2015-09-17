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
    fill_in "Director", with: "Test"
    fill_in "Stars", with: "test1, test2"
    click_on "Save changes"
    expect(page).to have_content("Movie successfully created.")

  end
end
feature "User updates movie" do
  scenario "successfully" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit root_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"
    movie = Movie.create( title: 'Narcos', director: 'suk', stars: 'Austin, Megan', summary: 'Its about marijuana')
    visit edit_movie_path(movie)
    #click_on "Add new movie"
    fill_in "Title", with: "Narcos"
    fill_in "Summary", with: "Its about marijuana"
    fill_in "Director", with: "suk"
    fill_in "Stars", with: "Austin, Megan"
    click_on "Save changes"
    expect(page).to have_content("Movie is successfully updated.")

  end
end
