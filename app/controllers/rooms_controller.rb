# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :find_room, only: %i[show result]
  def show
    render json: { room: @room, items: @room.items }
  end

  def create
    room = Room.new(room_params)

    if room.save
      render json: { room: room }
    else
      render json: { errors: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def result
    array = @room.items.map(&:name)
    no_of_group = @room.no_of_group

    result = if @room.multiple
               { choices: RandomItemsService.new(array, no_of_group).call }
             else
               { choices: [[RandomItemService.new(array).call]] }
             end

    ActionCable.server.broadcast("result_#{@room.code}", result)

    render json: result
  end

  private

  def room_params
    params.require(:room).permit(:name, :multiple, :no_of_group)
  end

  def find_room
    @room = Room.find params[:id]
  end
end
