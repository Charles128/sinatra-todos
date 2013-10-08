require 'spec_helper'

feature "Guest completes todo" do
  scenario "Completing a todo removes it from the page" do
    call_mother = Todo.create(name: "Call mother")
    Todo.create(name: "Pet a dog")
    visit '/'

    click_on "Complete Call mother"

    expect(page).not_to have_content "Call mother"
    expect(page).to have_content "Pet a dog"
    # You'll want to create an instance method named `completed?` on the Todo class
    call_mother.reload!
    expect(call_mother).to be_completed
  end
end
