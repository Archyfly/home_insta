require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { build(:photo) }

  it { is_expected.to validate_presence_of(:title) }

end
