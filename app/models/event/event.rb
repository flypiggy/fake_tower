class Event < ApplicationRecord
  belongs_to :team
  belongs_to :project
  belongs_to :user
end
