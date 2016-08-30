require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have many teams' do
    user = create(:access).user
    expect(user.teams).to exist
  end
end
