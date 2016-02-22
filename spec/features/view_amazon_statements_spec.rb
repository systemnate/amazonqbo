require "rails_helper"

feature "view amazon statements" do
  scenario "to see a list of current statements in db" do
    user = create(:user)
    settlement = create(:amazon_statement, period: "1/1/2016 - 1/14/2016", deposit_total: "9999.99")
    sign_in_as!(user)

    visit user_amazon_statements_path(user)
    expect(page).to have_css(".statements")
    within(".statements") do
      expect(page).to have_content(settlement.period)
      expect(page).to have_content(settlement.deposit_total)
    end
  end
end
