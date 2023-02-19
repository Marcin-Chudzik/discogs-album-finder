# frozen_string_literal: true

require 'faraday'

class JSONClient
  def initialize(root_url)
    @root_url = root_url
  end

  def get(path, params = {})
    response = connection.get path, params
    response.body
  end

  def authenticate(auth_type, auth_content)
    @authentication = [auth_type, auth_content]
  end

  private

  def connection
    @connection ||= Faraday.new(url: @root_url) do |f|
      f.request :json # encode req bodies as JSON and automatically set the Content-Type header
      f.request :url_encoded # form-encode POST params
      f.request :authorization, @authentication.first, @authentication.last if @authentication
      f.response :json # decode response bodies as JSON
      f.adapter :net_http # adds the adapter to the connection, defaults to `Faraday.default_adapter`
    end
  end
end
