require 'ffaker'

FactoryBot.define do
  factory :user do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    info { FFaker::Job.title }
    password { 'password' }
    password_confirmation { 'password' }

  end
end
