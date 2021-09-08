require 'ffaker'

FactoryBot.define do
  factory :post do
    association :user
    title { FFaker::Book.title }
    body { FFaker::Lorem.sentence }

    #image_data { Rack::Test::UploadedFile.new('spec/fixtures/pix.png') }

    #trait (:with_invalid_image) do
    #  image_data { Rack::Test::UploadedFile.new('spec/fixtures/pix.doc') }
    #end
  end
end
