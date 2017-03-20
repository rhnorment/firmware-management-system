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

require 'rails_helper'

RSpec.describe FirmwareBuild, type: :model do

  it { should have_db_column(:id).of_type(:integer) }
  it { should have_db_column(:release_date).of_type(:date) }
  it { should have_db_column(:hardware_revision).of_type(:integer) }
  it { should have_db_column(:software_revision).of_type(:integer) }
  it { should have_db_column(:image).of_type(:binary) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should validate_presence_of(:release_date) }
  it { should validate_presence_of(:hardware_revision) }
  it { should validate_presence_of(:image) }

end
