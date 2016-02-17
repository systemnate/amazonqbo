require "rails_helper"

feature "signing in" do
  scenario "visiting the site to sign in" do
    user = create(:user, email: "test@test.com", name: "Test User")

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("Test User")
  end
end

