require "rails_helper"

feature "View user profile" do
  scenario "successfully" do
    user = create(:user)
    visit user_path(user)
    
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end
