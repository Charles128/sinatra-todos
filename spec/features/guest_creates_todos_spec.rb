require 'spec_helper'

feature 'Guest creates todo' do
  scenario "it creates the todo when they provide a name" do
    visit '/'
    fill_in "New Todo", with: "Take out the trash"

    click_on "Create Todo"

    expect(page).to have_content("Take out the trash")
  end

  # This is a STRETCH scenario. MOVE ON unless you've already pushed to heroku
  # and submitted a pull request
  xscenario "it does not create the todo if they don't provide a name" do
    visit '/'

    click_on "Create Todo"

    expect(page).to have_content("You must provide a name for your todo!")
  end
end
