require "rails_helper"

feature "edit configurations" do
  before do
    user   = create(:user)
    config = create(:configuration, user: user)

    sign_in_as!(user)
    visit user_configuration_path(user, config)

    click_on "Edit"
  end

  scenario "successfully" do
    fill_in "Primary Marketplace ID", with: "newprimarymarketplaceid"
    fill_in "Merchant ID", with: "newmerchantid"
    fill_in "Authorization Token", with: "newauthtoken"
    click_button "Update Configuration"

    expect(page).to have_content "newprimarymarketplaceid"
    expect(page).to have_content "newmerchantid"
    expect(page).to have_content "newauthtoken"
  end

  scenario "unsuccessfully" do
    fill_in "Primary Marketplace ID", with: "123"
    fill_in "Merchant ID", with: "123"
    fill_in "Authorization Token", with: ""
    click_button "Update Configuration"

    expect(page).to have_content("too short")
    expect(page).to have_content("can't be blank")
  end
end

