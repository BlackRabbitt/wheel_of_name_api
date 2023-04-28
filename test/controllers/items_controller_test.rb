# frozen_string_literal: true

require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'GET /random multiple: false (default)' do
    RandomItemService.stub_any_instance(:call, 'a') do
      get random_items_url(array: 'a,b,c')
      assert_response :success
      assert_equal 'application/json; charset=utf-8', response.content_type
      assert_equal 'a', response.parsed_body['choice']
    end
  end
end
