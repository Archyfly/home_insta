require 'ffaker'

FactoryBot.define do
  factory :photo do
    association :post
    title { FFaker::Book.title }
    image_data { Rack::Test::UploadedFile.new('spec/fixtures/pix.png') }
    # image {  }
    # trait (:with_invalid_image) do
    # image { Rack::Test::UploadedFile.new('spec/fixtures/pix.doc') }

  end
end