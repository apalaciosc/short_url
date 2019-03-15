class Api::V1::UrlsController < ApplicationController

  def save_short_url
    url          = params[:url]
    custom_alias = params[:custom_alias]
    short_url    = Url.get_short_url url, custom_alias
    @response    = Url.save_url(url, short_url)? "Url: #{short_url} generada correctamente, expirará en 2 horas!" : 'Ocurrió un error' if url.present?
    render json: @response 
  end
end