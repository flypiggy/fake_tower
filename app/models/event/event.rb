class Event < ApplicationRecord
  belongs_to :team
  belongs_to :project
  belongs_to :user

  before_create :set_project_and_team

  def self.by_project(project)
    project.present? ? where(project: project) : all
  end

  private

  def set_project_and_team
    project = target.project
    self.project = project
    self.team = project.team
  end
end
