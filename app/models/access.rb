class Access < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: [:guest, :member, :admin, :super_admin]
end
