class Todo < ApplicationRecord
  include Eventable

  belongs_to :team
  belongs_to :user
  belongs_to :project, counter_cache: true
  belongs_to :assigned_user, class_name: 'User'

  has_many :comments
  has_many :events, class_name: 'TodoEvent', foreign_key: 'target_id'
  enum status: [:todo, :doning, :finished]

  before_create :set_team

  acts_as_paranoid

  private

  def set_team
    self.team = project.team
  end
end
