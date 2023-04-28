# frozen_string_literal: true

class Room < ApplicationRecord
  before_create :set_uniq_code

  has_many :items, dependent: :destroy

  private

  def set_uniq_code
    loop do
      code = SecureRandom.alphanumeric(6).upcase
      next if Room.exists?(code: code)

      self.code = code

      return
    end
  end
end
