require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns username and info for user' do
  #user = User.create(username: "Viktor Petlura", info: "White guardsman")
  user = User.create(username: "Alik", info: "Staut")
  expect(user.username).to eq "Alik"
  expect(user.info).to eq "Staut"

  end
end
