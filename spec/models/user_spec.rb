require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:events) }
    it { should have_many(:groups).through(:events) }
  end
  describe 'Validation' do
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name).with_message('User already exist.') }
  end

  it "#name" do
    user = User.new(first_name: 'ernestine', last_name: 'skiles')
    expect(user.name).to eq('Ernestine Skiles')
  end
end
