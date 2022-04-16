class Category < ApplicationRecord
  validates :name,
      presence: true,
      uniqueness: true,
      length: {
        minimum: 1,
        too_short: "name can't consist of less than 2 letters"
      }
      # uniqueness: { message: 'duplicated field' }
  has_one :food
end
