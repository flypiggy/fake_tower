module Eventable
  extend ActiveSupport::Concern

  def create_event(user, action)
    events.create(user: user, action: action)
  end
end
