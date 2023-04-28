# frozen_string_literal: true

module WheelOfNames
  module Shuffler
    def fisher_yates_shuffle(arr = [])
      (arr.length - 1).downto(1) do |i|
        j = rand(i + 1)

        arr[i], arr[j] = arr[j], arr[i]
      end

      arr
    end
  end
end
