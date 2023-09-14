class Api::V0::SearchController < ApplicationController
  def index
    # begin
      result_objects = TwoOneOneService.search(params[:keyword], params[:location])
      render json: ErrorSerializer.new(result_objects)
      # render json: DataSerializer.new(result_objects)
    # rescue 
      # require 'pry'; binding.pry
      # render json: ErrorSerializer.format_errors("Invalid Parameters: #{params[:keyword]}, #{params[:location]}"), status: 400
      # render json: ActiveRecord::errors
    # end
  end
end