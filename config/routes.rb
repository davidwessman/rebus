Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources(:posts, only: :show) do
    resources(:questions, only: %i[show update], path: :q)
  end

  root(action: :root, controller: :presentation)
end
