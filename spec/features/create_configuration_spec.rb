require "rails_helper"

feature "Create configuration" do
  scenario "successfully" do
    user = create(:user)
    sign_in_as!(user)

    visit new_configuration_path
    fill_in "Primary Marketplace ID", with: "primarymarketplaceid"
    fill_in "Merchant ID", with: "merchantid"
    fill_in "Authorization Token", with: "authtoken"
    click_on "Create Configuration"

    expect(page).to have_content("Configuration was successfully created.")
  end
end
