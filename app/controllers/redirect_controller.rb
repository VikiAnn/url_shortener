class RedirectController < ApplicationController
  def index
    link = Rails.cache.fetch(params[:hashid]) do
      Link.find_by!(hashid: params[:hashid])
    end
    redirect_to link.uri
  end
end
