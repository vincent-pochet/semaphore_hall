# -*- encoding : utf-8 -*-
require './spec/spec_helper'

describe HallMessage do
  describe "#hall_url" do
    let(:hall_message) { HallMessage.new('1234', {}) }
    it "returns url with token" do
      expect(hall_message.hall_url).to eq("https://hall.com/api/1/services/generic/1234")
    end
  end

  describe '#post' do
    let(:semaphore) { SemaphoreMessage.new({}) }
    let(:hall_message) { HallMessage.new('1234', semaphore) }
    it 'send post request to semaphore' do
      semaphore.stub(:to_json)
      Net::HTTP.should_receive(:start)
      hall_message.post
    end
  end
end
