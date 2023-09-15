module Api
  module V0
    class ProvidersController < ApplicationController
      
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

      private
      def provider_params
        params.require(:provider).permit(:organization_name, :description, :address, :city, :state, :zip, :contact_phone, :fees, :schedule) 
      end
    end
  end
end
