# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user creates event', type: :feature do
  scenario 'user creates event' do
    visit new_event_path
    expect(page).to have_current_path(new_user_path)
    fill_in 'Name', with: 'User'
    fill_in 'Email', with: 'user@example.com'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome'

    visit new_event_path
    expect(page).to have_current_path(new_event_path)
    fill_in 'Title', with: 'Event 1'
    fill_in 'Date', with: Date.today
    fill_in 'Description', with: 'Event 1'
    fill_in 'Location', with: 'Event 1'
    click_button 'Create Event'
    expect(page).to have_content 'Event 1'
  end
end
