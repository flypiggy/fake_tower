class User < ApplicationRecord
  has_many :accesses
  has_many :teams, through: :accesses
  has_many :events
end
