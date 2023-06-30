# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :find_room, only: %i[create]
  def random
    array = params[:array].split(',')
    no_of_group = params[:no_of_group]&.to_i

    result = if no_of_group.present?
               { choices: RandomItemsService.new(array, no_of_group).call }
             else
               { choices: [[RandomItemService.new(array).call]] }
             end

    render json: result
  end

  def create
    item = @room.items.new(item_params)

    if item.save
      ActionCable.server.broadcast("room_#{@room.code}", item)

      render json: { room: @room, item: item }
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_room
    @room = Room.find_by(code: params[:room_code])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
