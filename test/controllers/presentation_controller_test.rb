# frozen_string_literal: true

require 'test_helper'

class PresentationControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get(root_url)
    assert_response(:success)
  end
end