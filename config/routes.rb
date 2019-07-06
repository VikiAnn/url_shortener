Rails.application.routes.draw do
  scope '/api' do
    resources :links
  end
 
  # to disable the middleware, comment out the insert_after in config/application.rb
  # then:
  
  # to use the proc, uncomment these
  # get '/*hashid', as: :shorter_url, to: redirect do |params|
  #  link = Rails.cache.fetch(params[:hashid]) do
  #    Link.find_by!(hashid: params[:hashid])
  #  end
  #  link.uri
  #end
  
  # to use the Rails Controller, uncomment this
  # get '/*hashid', to: 'redirect#index', as: :shorter_url
end
