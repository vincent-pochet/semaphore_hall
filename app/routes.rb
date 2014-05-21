# -*- encoding : utf-8 -*-

post '/debug/:token' do
  puts params['token']
  'OK'
end

post '/:token' do
  content_type :json
  Response.post(params['token'], Message.new(JSON.parse(request.body.read)).to_json)
  'OK'
end
