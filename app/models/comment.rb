class Comment < ApplicationRecord
  include Eventable

  belongs_to :user
  belongs_to :todo

  has_many :events, class_name: 'CommentEvent'
end
