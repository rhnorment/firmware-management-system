# == Schema Information
#
# Table name: email_recipients
#
#  id         :integer          not null, primary key
#  name       :string           default("")
#  email      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe EmailRecipient do
  let(:resource_class)  { 'EmailRecipient' }
  let(:all_resources)   { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)        { all_resources[resource_class] }

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }

  it { should have_db_index(:email) }

  it 'has a valid resource name' do
    expect(resource.resource_name).to eq('EmailRecipient')
  end

  it 'should display in the menu bar' do
    expect(resource).to be_include_in_menu
  end

  it 'has the default set of CRUD actions available to it' do
    expect(resource.defined_actions).to include(:index, :show, :new, :create, :edit, :update, :destroy)
  end

  it 'is valid with valid attributes' do
    expect(EmailRecipient.new(email_recipient)).to be_valid
  end

end
