Rails.application.routes.draw do
  scope '/api' do
    resources :links
  end

  get '/*hashid', to: 'redirect#index', as: :shorter_url
end
