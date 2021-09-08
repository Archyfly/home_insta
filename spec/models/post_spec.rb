require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:photos) }


  it { is_expected.to validate_length_of(:title).is_at_most(30).with_short_message('is too long (maximum is 30 characters)') }
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  $logger.info "validate length of post title passed"

end
