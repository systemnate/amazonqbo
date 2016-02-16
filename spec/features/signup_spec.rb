require "rails_helper"

feature "signing up" do
  scenario "visiting the site to sign up" do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("signed up successfully")
  end
end

