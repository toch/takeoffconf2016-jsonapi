# Require this file for feature tests on API
require_relative "./spec_helper"

require "rack/test"

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Hanami::Container.new
  end
end

