require 'spec_helper'
require_relative '../../../../apps/api/controllers/speakers/list'

describe Api::Controllers::Speakers::List do
  let(:action) { Api::Controllers::Speakers::List.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
