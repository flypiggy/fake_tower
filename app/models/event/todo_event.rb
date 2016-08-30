class TodoEvent < Event
  belongs_to :target, class: 'Todo'
end
