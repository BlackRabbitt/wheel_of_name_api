# frozen_string_literal: true

class RandomItemService
  include WheelOfNames::Shuffler

  def initialize(arr = [])
    @arr = arr
  end

  def call
    shuffled_array = fisher_yates_shuffle(@arr)

    shuffled_array.sample
  end
end
