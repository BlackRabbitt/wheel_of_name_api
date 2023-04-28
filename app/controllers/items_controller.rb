# frozen_string_literal: true

class ItemsController < ApplicationController
  def random
    array = params[:array].split(',')
    no_of_group = params[:no_of_group]&.to_i

    if no_of_group.present?
      render json: { choices: RandomItemsService.new(array, no_of_group).call }
    else
      render json: { choice: RandomItemService.new(array).call }
    end
  end
end
