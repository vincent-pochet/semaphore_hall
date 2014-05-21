# -*- encoding : utf-8 -*-

class Response
  def self.post(token, data)
    hall_url = "https://hall.com/api/1/services/generic/#{token}"
    uri = URI(hall_url)
    req = Net::HTTP::Post.new(hall_url, {'Content-Type' =>'application/json'})
    req.body = data.to_s
    Net::HTTP.new(uri.host, uri.port, :use_ssl => true).start {|http| http.request(req) }
  end
end

