require 'rails_helper'

RSpec.describe Feedback do
  describe 'main restriction' do
    it 'should create a feedback' do
      Feedback.create(url: 'example.com', nickname: 'test_nickname', text: 'test_text')
      expect(Feedback.last.url).to eq('example.com')
      expect(Feedback.last.nickname).to eq('test_nickname')
      expect(Feedback.last.text).to eq('test_text')
    end

    it 'should not create feedback without url' do
      expect(Feedback.create(nickname: 'test_nickname', text: 'test_text')).to be_invalid
    end

    it 'should not create feedback without nickname' do
      expect(Feedback.create(url: 'example.com', text: 'test_text')).to be_invalid
    end

    it 'should not create feedback without text' do
      expect(Feedback.create(url: 'example.com', nickname: 'test_nickname')).to be_invalid
    end

    it 'should not create more than 20 feedback on url' do; end
    it 'should update old feedback' do; end
  end
end