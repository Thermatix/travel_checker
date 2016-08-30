require 'json'
require "http_client"
class CM_Client
  attr_reader :key
  include Curb_DSL

  def initialize key
    @key = key
    @base_uri = "https://developer.citymapper.com/api/1"
  end

  def get_transit_time s,e,t=nil,ty=nil
    p = {key: @key}
    p.merge!(startcoord: s,endcoord: e)
    p.merge!(time: t) if t
    p.merge!(type: ty) if ty
    set_uri "#{@base_uri}/traveltime/?#{Curl::postalize(p)}"
    get
    if status_code == 200
      JSON.parse(body)
    else
      false
    end
  end


end

