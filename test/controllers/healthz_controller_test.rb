# frozen_string_literal: true

require 'test_helper'

class HealthzControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get healthz_index_url
    assert_response :success
    assert_equal({ 'status' => 'OK' }, response.parsed_body)
  end
end
