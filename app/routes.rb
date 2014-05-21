# -*- encoding : utf-8 -*-

post '/debug' do
  puts JSON.parse(request.body.read)
  'OK'
end

post '/:token' do
  content_type :json
  Response.post(Message.new(JSON.parse(request.body.read)).to_json)
  'OK'
end
