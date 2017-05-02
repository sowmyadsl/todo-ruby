require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("add a task", {:type => :feature}) do
  before() do
    Task.clear()
  end
  it("processes the user input and adds task to the list") do
    visit("/")
    fill_in("description", :with => "bathe the cat")
    click_button("Add Task")
    expect(page).to have_content(" The task has been successfully submitted !! Back")
  end
end
