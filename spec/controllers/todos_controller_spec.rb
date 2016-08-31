require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let!(:user) { create(:user) }
  let(:project) { create(:project) }

  describe 'POST #create' do
    let(:todo) { build(:todo) }

    it 'should create todo' do
      post :create, params: { project_id: project.id, todo: todo.attributes }
      expect(Todo.count).to eq(1)
    end

    it 'should create todo_event' do
      post :create, params: { project_id: project.id, todo: todo.attributes }
      expect(TodoEvent.first.action).to eq('新建了任务')
    end
  end

  describe 'PATCH #update' do
    let(:todo) { create(:todo, due_date: nil) }

    it 'should create event when due_date changed' do
      patch :update, params: { project_id: project.id, id: todo.id, todo: { due_date: Date.parse('2016-08-31') } }
      expect(TodoEvent.first.action).to eq('从 没有截止日期 修改为 08月31日')
    end

    it 'should create event when assigned_user_id changed' do
      patch :update, params: { project_id: project.id, id: todo.id, todo: { assigned_user_id: user.id } }
      expect(TodoEvent.first.action).to eq("给 #{user.name} 指派了任务")
    end

    it 'should create 2 events when due_date and assigned_user_id both changed' do
      patch :update, params: { project_id: project.id,
                               id: todo.id,
                               todo: { assigned_user_id: user.id, due_date: Time.zone.today } }
      expect(TodoEvent.count).to eq(2)
    end
  end

  describe 'DELETE #destroy' do
    let(:todo) { create(:todo) }

    it 'should create event when deleted' do
      delete :destroy, params: { project_id: project.id, id: todo.id }
      expect(TodoEvent.first.action).to eq('删除了任务')
    end
  end

  describe 'POST #complate' do
    let(:todo) { create(:todo) }

    it 'should create event when deleted' do
      post :complete, params: { project_id: project.id, id: todo.id }
      expect(TodoEvent.first.action).to eq('完成了任务')
    end
  end
end
