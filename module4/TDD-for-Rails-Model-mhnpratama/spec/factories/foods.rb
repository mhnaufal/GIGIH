FactoryBot.define do
  factory :food do
    name { "Nasi Default" }
    description { "Nasi default dengan lauk default dan harga default" }
    price { 1000 }
  end
  
  factory :food_ayam do
    name { "Ayam Deefault" }
    description { "Ayam default dengan bumbu default" }
    price { 3000.0 }
  end
end
