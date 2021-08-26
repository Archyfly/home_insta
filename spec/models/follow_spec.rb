require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { build(:follow) }

  it { is_expected.to belong_to(:post) }

  #TODO it { is_expected.to  }

end