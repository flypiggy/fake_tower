require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }

  describe 'TodoEvent' do
    let(:todo) { create(:todo) }
    let(:event) { todo.create_event(user, 'test') }

    it 'should auto associated with project' do
      expect(event.project).to eq(todo.project)
      expect(event.team).to eq(todo.team)
    end

    it 'should be a instance of TodoEvent' do
      expect(event).to be_instance_of(TodoEvent)
    end
  end

  describe 'CommentEvent' do
    let(:comment) { create(:comment) }
    let(:event) { comment.create_event(user, 'test') }

    it 'should auto associated with project' do
      todo = comment.todo
      expect(event.project).to eq(todo.project)
      expect(event.team).to eq(todo.team)
    end

    it 'should be a instance of TodoEvent' do
      expect(event).to be_instance_of(CommentEvent)
    end
  end
end
