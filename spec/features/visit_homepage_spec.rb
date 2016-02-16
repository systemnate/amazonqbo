require "rails_helper"

feature "Visit homepage" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_content("Welcome")
  end
end
