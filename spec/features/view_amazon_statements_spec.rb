require "rails_helper"

feature "viewing amazon statements" do
  scenario "to see a list of current statements in db" do
    user = create(:user)
    settlement = create(:amazon_statement, period: "1/1/2016 - 1/14/2016", deposit_total: "9999.99", user: user)
    sign_in_as!(user)
  
    visit user_amazon_statements_path(user)
 
    expect(page).to have_css(".statements")
    within(".statements") do
      expect(page).to have_content(settlement.period)
      expect(page).to have_content(settlement.deposit_total)
    end
  end

  scenario "should not allow you to view another user's statements" do
    user = create(:user)
    settlement = create(:amazon_statement, user: user)
    user2 = create(:user, name: "Nate", email: "nate@itsridic.com")
    settlement2 = create(:amazon_statement, deposit_total: "123.45")
    sign_in_as!(user)

    visit user_amazon_statements_path(user2)
    expect(page).to have_content("Restricted.  You cannot view another user's data.")
  end
end
