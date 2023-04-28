# frozen_string_literal: true

require 'test_helper'

class ShufflerTest < ActiveSupport::TestCase
  include WheelOfNames::Shuffler

  test 'should shuffle random number list' do
    shuffled_arr = fisher_yates_shuffle([1, 2, 3, 4, 5, 6, 7, 8, 9])

    assert_equal(9, shuffled_arr.length)
    assert_not(shuffled_arr == [1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  test 'should shuffle random string list' do
    shuffled_arr = fisher_yates_shuffle(%w[A B C D E F G H I])

    assert_equal(9, shuffled_arr.length)
    assert_not(shuffled_arr == %w[A B C D E F G H I])
  end
end
