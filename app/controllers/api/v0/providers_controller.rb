class Api::V0::ProvidersController < ApplicationController
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: @provider, status: :created
    else
      render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 422
    end
  end

  def show
    begin
      @provider = Provider.find(params[:id])
      render json: @provider, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.format_errors("Provider not found"), status: 404
    end
  end

  private
  def provider_params
    params.require(:provider).permit(:organization_name, :description, :address, :city, :state, :zip, :contact_phone, :fees, :schedule) 
  end
end
