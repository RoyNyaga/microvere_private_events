# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = User.create(name: 'User1', email: 'user1@example.com')
    @event = @user.events.new(title: 'Event 1', description: 'First event',
                              location: 'Event 1 location', date: Date.today)
  end

  context 'Event model' do
    it "Event must be valid" do
       expect(@event).to be_valid
    end

  end

    it "description must be present" do
         @event.description = "  "
         expect(@event).not_to be_valid
    end

    it "description should not be more than 200 words" do
        @event.description = "a" * 201
        expect(@event).not_to be_valid
    end

    it "date must be present" do
        @event.date = "  "
        expect(@event).not_to be_valid
    end 
end
