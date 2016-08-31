class CommentEvent < Event
  belongs_to :target, class_name: 'Todo'
  belongs_to :comment

  before_validation :set_target_id

  private

  def set_target_id
    self.target = comment.todo
  end
end
