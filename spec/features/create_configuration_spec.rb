require "rails_helper"

feature "Create configuration" do
  before do
    user = create(:user)
    sign_in_as!(user)
    visit new_user_configuration_path(user)
  end

  scenario "successfully" do
    fill_in "Primary Marketplace ID", with: "primarymarketplaceid"
    fill_in "Merchant ID", with: "merchantid"
    fill_in "Authorization Token", with: "authtoken"
    click_on "Create Configuration"

    expect(page).to have_content("Configuration was successfully created.")
  end

  scenario "unsuccessfully" do
    fill_in "Primary Marketplace ID", with: ""
    fill_in "Merchant ID", with: ""
    fill_in "Authorization Token", with: ""
    click_on "Create Configuration"

    within(".errors") do
      expect(page).to have_content("Primary Marketplace ID can't be blank")
      expect(page).to have_content("Merchant ID can't be blank")
      expect(page).to have_content("Authorization Token can't be blank")
    end
  end
end
