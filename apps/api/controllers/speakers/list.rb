module Api::Controllers::Speakers
  class List
    include Api::Action
    accept :json

    expose :speakers

    def call(params)
      @speakers = SpeakerRepository.all
    end
  end
end
