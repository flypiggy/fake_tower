class TodoEvent < Event
  belongs_to :target, class_name: 'Todo'
end
