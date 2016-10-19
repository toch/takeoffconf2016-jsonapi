require 'api_helper'

describe 'Listing speakers' do
  before do
    SpeakerRepository.clear
  end
  it 'is successful' do
    header 'Content-Type', 'application/json;'
    get '/api/speakers'
    expect(last_response).must_be :ok?
    expect(last_response.content_type).must_equal "application/json; charset=utf-8"
  end

  it 'returns empty array by default' do
    header 'Content-Type', 'application/json;'
    get '/api/speakers'
    expect(last_response.body).must_equal '[]'
  end

  describe 'When speakers are recorded' do
    before do
      SpeakerRepository.clear

      SpeakerRepository.create(Speaker.new(name: 'Christophe Philemotte', twitter: '_toch', talk: 'Build a Web API with Hanami'))
    end
    it 'returns an array of those speakers' do
      header 'Content-Type', 'application/json;'
      get '/api/speakers'
      expect(last_response.body).must_include "\"name\":\"Christophe Philemotte\",\"twitter\":\"_toch\",\"talk\":\"Build a Web API with Hanami\""
    end
  end
end
