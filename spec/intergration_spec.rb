require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist',{:type => :feature}) do
  it('allows a salon to add a new stylist') do
    visit('/teams/new')
    fill_in('stylist_name', :with => 'Hope')
    click_button('Add Stylist')
    expect(page).to have_content('Success')
  end
end
