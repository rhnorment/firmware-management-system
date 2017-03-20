# == Schema Information
#
# Table name: firmware_builds
#
#  id                :integer          not null, primary key
#  release_date      :date
#  hardware_revision :integer
#  software_revision :integer
#  image             :binary
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do

  factory :firmware_build do
    release_date        { Faker::Date.forward(3) }
    hardware_revision   { Faker::Number.decimal(2) }
    software_revision   { Faker::Number.decimal(2) }
    image               { Faker::File.file_name('path/to') }
  end

end
