require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'after created' do
    let(:todo) { create(:todo) }

    it 'should auto associated with team' do
      expect(todo.team).to eq(todo.project.team)
    end

    it 'should have default status todo' do
      expect(todo.status).to eq('todo')
    end

    it 'should change project todos count' do
      project = todo.project
      expect(project.todos_count).to eq(1)
    end
  end
end
