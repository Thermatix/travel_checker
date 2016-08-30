require_dependency "city_mapper"
require 'json'
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  def calculate_travel
    client = CM_Client.new(ENV['CMAPPER_API_KEY'])
    @response = client.get_transit_time(params["srt_loc"],params["end_loc"],params.fetch("time",nil),params.fetch("type",:nil))
    respond_to do |format|
      format.json {render json: {travel_time: @response["travel_time_minutes"]}.to_json}
    end
  end
end
