require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)



describe('adding a new list', {:type => :feature})  do
  it 'allows a user to click a list to see the tasks and details for it' do
    visit '/'
    fill_in 'name', :with => 'Epicodus Work'
    # click_button 'Add list'
    # expect(page).to have_content('Success!')
  end
end



describe('viewing all of the lists', {:type => :feature}) do
  it 'allows a user to see all the lists that have been created' do
    list = List.new({:name => 'Epicodus Homework', :id => nil})
    list.save
    visit '/'
    click_link 'View All Lists'
    expect(page).to have_content(list.name)
  end
end

describe 'seeing details for a single list', {:type => :feature} do

  it 'allows a user to click a list to see the tasks and details for it' do
    test_list = List.new({:name => "School stuff", :id => nil})
    test_list.save
    test_task = Task.new({:description => "learn SQL", :list_id => test_list.id})
    test_task.save
    visit '/lists'
    click_link(test_list.name)
    expect(page).to have_content(test_task.description)
  end
end
