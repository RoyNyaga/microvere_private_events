# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before :each do
    @user = User.create(name: 'roy', email: 'roy@gmail.com')
    @event = @user.events.create(title: 'football match', 
      description: 'Played with the legs', 
      date: Date.today, 
      location: 'Uganda')
    @attendance = Attendance.new(attendee: @user, attended_event: @event)
  end

  context 'attendance associations' do
    it 'associations should be valid' do
      expect(@attendance).to be_valid
    end
  end
  

end
