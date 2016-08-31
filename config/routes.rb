Rails.application.routes.draw do
  get 'events/index'

  resources 'projects' do
    resources 'todos', only: [:create, :update, :destroy] do
      post 'complete', on: :member
      resources 'comments', only: [:create]
    end
  end
end
