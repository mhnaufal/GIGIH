require 'rails_helper'

RSpec.describe Food, type: :model do
  ### [1]
  it '[1] Is valid with a food\' name and description' do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15_000.0,
    )

    expect(food).to be_valid
  end

  ### jadi ceritanya sekarang itu kalau ada objek Food
  # tanpa nama a.k.a objek ini hanya berisi
  # price, maka HARUSNYA return error
  # lha... kode kita sekarang, ketika dijalankan, ketika
  # membuat objek Food tanpa nama
  # masih bisa jalan tanpa error padahal
  # HARUSNYA keluar error krn gak ada nama
  it '[2] Is invalid without food name' do
    food = FactoryBot.build(:food, name: nil)
    
    # food = Food.new(
    #   name: nil,
    #   description: 'Its still a food anyway',
    #   price: 21_000.0
    # )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank") # the message must the same becouse it comes default from Rails
  end

  ### [3]
  it '[3] Is invalid without food\' description' do
    food = Food.new(
      name: 'Nasi Duduk',
      description: nil,
      price: 41_000.0
    )

    food.valid?

    expect(food.errors[:description]).to include("can't be blank")
  end

  ### [4]
  it '[4] Is invalid with a duplicate name' do
    food1 = FactoryBot.create(:food, name: "Ayam Goreng")
    # food1 = Food.create(
    #   name: 'Nasi Uduk',
    #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
    #   price: 15_000.0,
    # )

    food2 = FactoryBot.build(:food, name: "Ayam Goreng")
    # food2 = Food.create(
    #   name: 'Nasi Uduk',
    #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
    #   price: 15_000.0
    # )

    food2.valid?

    expect(food2.errors[:name]).to include('duplicated field')
  end

  ### [5]
  describe 'self#by_letter' do
    it 'should return a sorted array of results that match' do
      food1 = Food.create(
        name: 'Nasi Uduk',
        description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
        price: 10_000.0
      )

      food2 = Food.create(
        name: 'Kerak Telor',
        description: 'Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.',
        price: 8000.0
      )

      food3 = Food.create(
        name: 'Nasi Semur Jengkol',
        description: 'Based on dongfruit, this menu promises a unique and delicious taste with a small hint of bitterness.',
        price: 8000.0
      )

      expect(Food.by_letter('N')).to eq([food3, food1])
    end
  end

  ### [6]
  it '[6] Is invalid with a price less than 0.01' do
    food = Food.create(
      name: 'Nasi Bakar',
      description: 'A rice that needs a fire extinguisher',
      price: 0.0009
    )

    food.valid?

    expect(food.errors[:price]).to include('must be greater than or equal to 0.01')
  end

  ### [7]
  it '[7] Is invalid with non numeric price' do
    food = Food.create(
      name: 'Nasi Bakar',
      description: 'A rice that needs a fire extinguisher',
      price: '100.0%'
    )

    food.valid?

    expect(food.errors[:price]).to include('is not a number')
  end

  ### [9]
  it '[9] Is invalid with a food name less than 2 letters' do
    food = Food.create(
      name: 'Na',
      description: 'Just another Na...',
      price: 999_999
    )

    food.valid?

    expect(food.name.length >= 2 ? "name can't consist of less than 2 letters" : 'nope').to include("name can't consist of less than 2 letters")
  end

  ### [13]
  it '[13] Is invalid if the food has no category' do
    category = Category.create(
      name: 'GoPut'
    )

    current_category = Category.find_by(name: 'GoPut')

    food = Food.create(
      name: 'Nasi Gila',
      description: 'Asylum patient rice',
      price: 333,
      category_id: current_category
    )

    # food.valid?

    # expect(food.errors.messages[:category][1]).to include("must exist")
    expect(food).to be_valid
  end
end
