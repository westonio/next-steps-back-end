class Api::V0::SearchController < ApplicationController
  def index
    begin
      result_objects = TwoOneOneService.search(params[:keyword], params[:location])
      render json: DataSerializer.new(result_objects)
    rescue 
      # require 'pry'; binding.pry
      # render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 400
      render json: result_objects.errors, status: 400
    end
  end
end