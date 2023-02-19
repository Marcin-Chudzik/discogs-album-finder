# frozen_string_literal: true

class DiscogsClient
  def initialize
    @json_client = JSONClient.new 'https://api.discogs.com'
    @json_client.authenticate(:Discogs, 'key=XkuSCPnOxqkyyJjIDJQq, secret=czyyvHExoOwKhMpQNsXxfgpUOAlJtaEl')
  end

  def search(phrase)
    json = @json_client.get '/database/search', { query: phrase }
    results = json['results']
    results.find do |e|
      e['type'] == 'release' && e['format'].include?('CD') && e['format'].include?('Album')
    end
  end

  def find_album(album_url)
    @json_client.get(album_url)
  end
end
