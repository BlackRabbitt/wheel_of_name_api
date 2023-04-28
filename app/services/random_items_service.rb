# frozen_string_literal: true

class RandomItemsService
  include WheelOfNames::Shuffler

  def initialize(arr = [], no_of_group = 1)
    @arr = arr
    @no_of_group = no_of_group
    # determine size of each group
    @group_size = (@arr.length.to_f / @no_of_group).ceil
  end

  def call
    groups = shuffle_groups(fisher_yates_shuffle(@arr))
    # make sure atleast `no_of_group` groups are returned and merge last group if size is smaller than `@group_size`
    merge_and_pop(groups) if groups.length > @no_of_group && groups.last.length < @group_size && groups.length > 1

    groups
  end

  private

  def shuffle_groups(shuffled_array) # rubocop:disable Metrics/MethodLength
    groups = []

    until shuffled_array.empty?
      group = []
      @group_size.times do
        choice = shuffled_array.sample
        group << choice
        shuffled_array.delete(choice)
      end

      groups << group.compact
    end

    groups
  end

  def merge_and_pop(groups)
    groups[-2] += groups[-1]
    groups.pop
  end
end
