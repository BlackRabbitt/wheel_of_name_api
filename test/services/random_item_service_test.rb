# frozen_string_literal: true

require 'test_helper'

class RandomItemTest < ActiveSupport::TestCase
  test 'should get random number' do
    random = RandomItemService.new([1, 2, 3, 4, 5, 6, 7, 8, 9]).call

    assert(random >= 1 && random <= 9)
  end

  test 'should get random string' do
    arr = %w[A B C D E F G H I]
    random = RandomItemService.new(arr).call

    assert(arr.include?(random))
  end
end
