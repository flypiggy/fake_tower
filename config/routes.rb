Rails.application.routes.draw do
  resources 'projects' do
    resources 'todos', only: [:create, :update, :destroy] do
      post 'complete', on: :member
    end
  end
end
