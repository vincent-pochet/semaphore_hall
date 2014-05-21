# -*- encoding : utf-8 -*-

class Response
  def self.post(data)
    uri = URI(Settings.hall_url)
    req = Net::HTTP::Post.new(Settings.hall_url, {'Content-Type' =>'application/json'})
    req.body = data
    Net::HTTP.new(uri.host, uri.port).start {|http| http.request(req) }
  end
end
