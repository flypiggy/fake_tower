class Team < ApplicationRecord
  has_many :accesses
  has_many :users, through: :accesses
  belongs_to :owner, class_name: 'User'

  after_create :grant_owner_access

  private

  def grant_owner_access
    accesses.create!(user: owner, role: :super_admin)
  end
end
