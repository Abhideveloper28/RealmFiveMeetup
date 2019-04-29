require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Associations' do
    it { should have_many(:events) }
    it { should have_many(:users).through(:events) }
  end
  describe 'Validation' do
    it { should validate_uniqueness_of(:name) }
  end

  it "#group_name" do
    group = Group.new(name: 'education group')
    expect(group.group_name).to eq('Education Group')
  end
end
