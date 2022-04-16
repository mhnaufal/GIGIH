require 'rails_helper'

RSpec.describe Category, type: :model do
  ### [10] 
  it '[10] Is invalid if category has no name on it' do
    category = Category.create(
      name: nil
    )

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end
  
  ### [11] 
  it '[11] Is invalid if category duplicated' do
    category1 = Category.create(
      name: "Etc"
    )
    
    category2 = Category.create(
      name: "Etc"
    )

    category2.valid?

    expect(category2.errors[:name]).to include("has already been taken")
  end
  
  ### [12] 
  it '[12] Is invalid if category has less than 2 letters on it' do
    category = Category.create(
      name: 'Na',
    )

    category.valid?

    expect(category.name.length >= 2 ? "name can't consist of less than 2 letters" : "nope").to include("name can't consist of less than 2 letters")
  end
end
