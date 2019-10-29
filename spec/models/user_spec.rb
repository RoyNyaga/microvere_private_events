# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'User1', email: 'user1@example.com')
  end

  context 'Valid user' do
    it 'user should be valid' do
      expect(@user).to be_valid
    end

    it "name should be present" do
      @user.name = "     "
      expect(@user).not_to be_valid
    end

  end 

  
end
