class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    triangle_sides = [@side1, @side2, @side3]
    valid_triangle = triangle_sides.all?(&:positive?) &&
                     @side1 + @side2 > @side3 &&
                     @side2 + @side3 > @side1 &&
                     @side1 + @side3 > @side2

    raise TriangleError unless valid_triangle
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle"
    end
  end
end
