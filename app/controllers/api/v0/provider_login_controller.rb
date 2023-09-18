class Api::V0::ProviderLoginController < ApplicationController
  
  def provider_login
    begin
      provider = Provider.find_by(username: params[:username])
      if provider.authenticate(params[:password])
        render json: DetailedProviderSerializer.new(provider), status: 200
      else
        render json: ErrorSerializer.format_errors("Invalid credentials"), status: 401
      end
    rescue StandardError => error
      require 'pry'; binding.pry
      render json: ErrorSerializer.format_errors(error.message), status: 401
    end
  end
end
