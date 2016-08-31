require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:todo) { create(:todo) }

    it 'should create comment event' do
      post :create, params: { project_id: todo.project.id, todo_id: todo.id, comment: { content: 'test' } }
      expect(CommentEvent.first.action).to eq('回复了任务')
      expect(CommentEvent.first.comment).to eq(Comment.first)
    end
  end
end
