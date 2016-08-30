class CommentEvent < Event
  belongs_to :target, class: 'Todo'
  belongs_to :comment
end
