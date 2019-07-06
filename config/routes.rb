Rails.application.routes.draw do
  scope '/api' do
    resources :links
  end

  # get '/*hashid', to: Redirect, as: :shorter_url
end
