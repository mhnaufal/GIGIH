class Food < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: { message: 'duplicated field' },
            length: {
              minimum: 2,
              too_short: "name can't consist of less than 2 letters"
            }

  validates :description,
            presence: true

  validates :price,
            numericality: { greater_than_or_equal_to: 0.01 }

  has_one :category
  # validates_presence_of :category
  belongs_to :category, optional: true

  def self.by_letter(letter)
    where('name like ?', "#{letter}%").order(:name)
  end
end
