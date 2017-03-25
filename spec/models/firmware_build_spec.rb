# == Schema Information
#
# Table name: firmware_builds
#
#  id                :integer          not null, primary key
#  release_date      :date
#  hardware_revision :integer
#  software_revision :integer
#  firmware_image    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe FirmwareBuild, type: :model do

  it { should have_db_column(:id).of_type(:integer) }
  it { should have_db_column(:release_date).of_type(:date) }
  it { should have_db_column(:hardware_revision).of_type(:integer) }
  it { should have_db_column(:software_revision).of_type(:integer) }
  it { should have_db_column(:firmware_image).of_type(:string) }

  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  let(:resource_class)  { 'FirmwareBuild' }
  let(:all_resources)   { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)        { all_resources[resource_class] }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eq('FirmwareBuild')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'has a valid factory' do
    expect(FirmwareBuild.new(firmware_build_attributes)).to be_valid
  end

  it 'it stops an invalid factory' do
    expect(FirmwareBuild.new(firmware_build_attributes(release_date: nil))).to_not be_valid
  end

  it { should validate_presence_of(:release_date) }
  it { should validate_presence_of(:hardware_revision) }
  it { should validate_presence_of(:software_revision) }
  it { should validate_presence_of(:firmware_image) }

end
