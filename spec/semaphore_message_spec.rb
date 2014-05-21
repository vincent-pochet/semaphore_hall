# -*- encoding : utf-8 -*-
require './spec/spec_helper'

describe SemaphoreMessage do

  describe '#to_json' do
    subject do
      SemaphoreMessage.new({
        'result' => 'passed',
        'project_name' => 'foo',
        'branch_name' => 'bar',
        'commit' => {'message' => 'OK', 'author_name' => 'john doe'},
        'build_url' => 'http://test.com'
      })
    end
    its(:to_json) { should eq '{"title":"Semaphore","message":":sparkle: [foo/bar] Passed: OK - john doe (<a href=\\"http://test.com\\">http://test.com</a>)","picture":"https://semaphoreapp.com/docs/assets/img/design/logo-docs.png"}' }
  end

  describe "#status_icon" do
    context 'with passed status' do
      let(:semaphore) { SemaphoreMessage.new({'result' => 'passed'}) }
      it "returns icon of succeful test" do
        expect(semaphore.status_icon).to eq(":sparkle:")
      end
    end

    context 'with failed status' do
      let(:semaphore) { SemaphoreMessage.new({'result' => 'failed'}) }
      it "returns icon of failed test" do
        expect(semaphore.status_icon).to eq(":bangbang:")
      end
    end
  end

  describe '#branch_name' do
    let(:semaphore) { SemaphoreMessage.new({'project_name' => 'foo', 'branch_name' => 'bar'}) }
    it 'returns branch name' do
      expect(semaphore.branch_name).to eq('foo/bar')
    end
  end

  describe '#build_result' do
    let(:semaphore) { SemaphoreMessage.new({'result' => 'passed'}) }
    it 'capitalize build result' do
      expect(semaphore.build_result).to eq('Passed')
    end
  end

  describe '#commit_message' do
    let(:semaphore) { SemaphoreMessage.new({'commit' => {'message' => 'foo bar'}}) }
    it 'returns commit message' do
      expect(semaphore.commit_message).to eq('foo bar')
    end
  end

  describe '#author_name' do
    let(:semaphore) { SemaphoreMessage.new({'commit' => {'author_name' => 'john doe'}}) }
    it 'returns commit message' do
      expect(semaphore.author_name).to eq('john doe')
    end
  end

  describe '#build_url' do
    let(:semaphore) { SemaphoreMessage.new({'build_url' => 'http://test.com'}) }
    it 'returns commit message' do
      expect(semaphore.build_url).to eq('http://test.com')
    end
  end
end
