require "rails_helper"

feature "viewing configuration settings" do
  scenario "viewing your own configuration settings" do
    user   = create(:user)
    config = create(:configuration, user: user)
    sign_in_as!(user)
    visit user_configuration_path(user, config)

    expect(page).to have_content(config.primary_marketplace_id)
    expect(page).to have_content(config.merchant_id)
    expect(page).to have_content(config.auth_token)
  end

  scenario "cannot view another user's configuration settings" do
    user = create(:user)
    config = create(:configuration, user: user)
    user2 = create(:user, name: "Nate Dalo", email: "nate@itsridic.com")
    config2 = create(:configuration, user: user2)

    sign_in_as!(user)
    visit user_configuration_path(user2, config2)
    
    expect(page).to have_content("Restricted.  You cannot view another user's data.")
  end
end
   
