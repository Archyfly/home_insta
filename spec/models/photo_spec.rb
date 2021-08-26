require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { build(:photo) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }


  #TODO it { is_expected.to validate_presence_of(:body) }

end