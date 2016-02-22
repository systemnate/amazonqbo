require "rails_helper"

feature "view amazon statements" do
  scenario "to see a list of current statements in db" do
    user = create(:user)
    settlement = create(:amazon_statement, beginning_balance: 9.99, deposit_total: 1000)
    sign_in_as!(user)

    visit user_amazon_statements_path(user)
    expect(page).to have_css(".statements")
    within(".statements") do
      expect(page).to have_content(settlement.beginning_balance)
      expect(page).to have_content(settlement.deposit_total)
    end
  end
end
