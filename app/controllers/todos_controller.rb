class TodosController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    todo = project.todos.new(todo_params)
    todo.user = current_user
    todo.create_event(current_user, '新建了任务') if todo.save
  end

  def update
    @todo = Todo.find(params[:id])
    record_events if @todo.update(todo_params)
  end

  def destroy
  end

  def complete
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :describe, :assigned_user_id, :due_date)
  end

  def record_events
    generate_actions.each { |action| @todo.create_event(current_user, action) }
  end

  def generate_actions
    actions = []
    @todo.previous_changes.each do |attr, values|
      from, to = values
      case attr
      when 'assigned_user_id'
        actions << if from.blank?
                     "给 #{User.find(to).name} 指派了任务"
                   else
                     "把 #{User.find(from).name} 的任务指派给 #{User.find(to)}"
                   end
      when 'due_date'
        actions << "从 #{format_due_date(from)} 修改为 #{format_due_date(to)}"
      end
    end
    actions
  end

  def format_due_date(due_date)
    if due_date
      due_date.strftime('%m月%d日')
    else
      '没有截止日期'
    end
  end
end
