class Todo < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :project, counter_cache: true
  belongs_to :assigned_user, class_name: 'User'

  has_many :comments
  enum status: [:todo, :doning, :finished]

  before_create :set_team

  acts_as_paranoid

  private

  def set_team
    self.team = project.team
  end
end
