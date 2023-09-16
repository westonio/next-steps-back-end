class Api::V0::ProviderDetailsController < ApplicationController

  def show
    begin
      provider = ProvidersFacade.new(params[:id]).provider_details
      render json: DetailedProviderSerializer.new(provider)
    rescue StandardError => e
      require 'pry'; binding.pry
      render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 400
    end
  end
end