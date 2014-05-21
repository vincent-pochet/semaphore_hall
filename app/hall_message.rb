# -*- encoding : utf-8 -*-

class HallMessage
  def initialize(token, semaphore)
    @token = token
    @semaphore = semaphore
  end

  def hall_url
    @hall_url ||= "https://hall.com/api/1/services/generic/#{@token}"
  end

  def post
    uri = URI(hall_url)
    req = Net::HTTP::Post.new(hall_url, {'Content-Type' =>'application/json'})
    req.body = @semaphore.to_json
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http| http.request(req) }
  end
end

