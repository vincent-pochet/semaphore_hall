# -*- encoding : utf-8 -*-

post '/:token' do
  content_type :json
  @semaphore = SemaphoreMessage.new(JSON.parse(request.body.read))
  HallMessage.new(params['token'], semaphore).post
  'OK'
end
