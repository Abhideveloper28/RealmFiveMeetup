require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end

  describe '#role_name' do
    let(:event) { Event.new(role: 'organizer') }
    it 'should return the same value as event' do
      expect(event.role_name).to eq('Organizer')

      event.role = 'presenter'
      expect(event.role_name).to eq('Presenter')
    end
  end
end
