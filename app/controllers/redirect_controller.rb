class RedirectController < ApplicationController
  def index
    redirect_to Link.find_by(hashid: params[:hashid]).uri
  end
end
