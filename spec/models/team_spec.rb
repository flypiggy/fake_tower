require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    let(:team) { create(:access).team }

    it 'shoud have many users' do
      expect(team.users).to exist
    end

    it 'should have owner' do
      expect(team.owner).to be_instance_of(User)
    end
  end

  context 'create team' do
    let(:team) { create(:team) }

    it 'should grant access after create' do
      expect(team.accesses).to exist
    end

    it 'should grant superadmin role' do
      access = team.accesses.find_by(user: team.owner)
      expect(access.role).to eq('super_admin')
    end
  end
end
