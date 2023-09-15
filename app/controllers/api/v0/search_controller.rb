class Api::V0::SearchController < ApplicationController
  def index
    begin
      result_objects = SearchFacade.new.search(params[:keyword], params[:location])
      render json: DataSerializer.new(result_objects)
    rescue 
      render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 400
    end
  end
end
