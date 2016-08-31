class TodoEvent < Event
  belongs_to :target, -> { with_deleted }, class_name: 'Todo'
end
