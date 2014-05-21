# -*- encoding : utf-8 -*-
require './spec/spec_helper'

describe "Routes" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "POST /:token" do
    it 'Format response and post it to semaphore' do
      HallMessage.any_instance.should_receive(:post)
      post '/1234', '{}'
      expect(last_response).to be_ok
    end
  end
end
