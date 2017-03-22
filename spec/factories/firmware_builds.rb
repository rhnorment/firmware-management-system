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
    release_date        { Faker::Date.forward(3) }
    hardware_revision   { Faker::Number.decimal(2) }
    software_revision   { Faker::Number.decimal(2) }
    firmware_image      { File.new("#{Rails.root}/spec/support/fixtures/profile.jpg") }
  end

end
