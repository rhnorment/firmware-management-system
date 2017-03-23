# == Schema Information
#
# Table name: firmware_builds
#
#  id                       :integer          not null, primary key
#  release_date             :date
#  hardware_revision        :integer
#  software_revision        :integer
#  firmware_image_file_name :string
#  firmware_image           :binary(10485760)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryGirl.define do

  factory :firmware_build do
    hardware_revision   { Faker::Number.decimal(2) }
    software_revision   { Faker::Number.decimal(2) }

    sequence(:firmware_image) { |n| File.new("#{Rails.root}/spec/support/fixtures/profile#{n}.jpg") }
    firmware_image_file_name { File.basename firmware_image }

    trait :valid_release_date do
      release_date { Faker::Date.forward(3) }
    end

    trait :invalid_release_date do
      release_date { Faker::Date.backward(3) }
    end

    factory :valid_firmware_build, traits: [:valid_release_date]
    factory :invalid_firmware_build, traits: [:invalid_release_date]
  end

end
