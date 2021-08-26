require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it { is_expected.to validate_presence_of(:email) }
  $logger.info 'validate presence of email passed'
  it { is_expected.to validate_presence_of(:username) }
  $logger.info 'validate presence of username passed'
end
