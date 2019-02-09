require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }

  it "should set default role to 'standard'" do
  		expect(user).to have_attributes(role: 'standard')
  end
end
