class Project < ApplicationRecord
  belongs_to :team
  has_many :todos
  has_many :events
end
