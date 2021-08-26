require 'ffaker'

FactoryBot.define do
  factory :comment do
    association :post
      body { FFaker::Lorem.sentence }
   # image { Rack::Test::UploadedFile.new('spec/fixtures/pix.png') }
   # trait (:with_invalid_image) do
   # image { Rack::Test::UploadedFile.new('spec/fixtures/pix.doc') }

  end
end