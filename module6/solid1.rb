class ShapeCalculator
  def initialize
  end

  def calculate_area(shape)
    area = 0

    if shape.name == "rectangle"
      area = shape.width * shape.length
    elsif shape.name == "triangle"
      area = shape.base * shape.height * 0.5
    end

    area
  end
end

class Rectangle
  attr_accessor :name, :length, :width

  def initialize(name, length, width)
    @name = name
    @length = length
    @width = width
  end
end

class Triangle
  attr_accessor :name, :base, :height

  def initialize(name, base, height)
    @name = name
    @base = base
    @height = height
  end
end