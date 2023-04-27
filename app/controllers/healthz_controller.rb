# frozen_string_literal: true

class HealthzController < ApplicationController
  def index
    render json: { status: 'OK' }
  end
end
