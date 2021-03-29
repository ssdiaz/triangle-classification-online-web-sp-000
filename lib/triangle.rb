class Triangle

  attr_accessor :a, :b, :c

  def initialize (a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle
      if a == b && a == c
          :equilateral
      elsif a == b || a == c || b == c
        :isosceles
      else
        :scalene
      end
  end

  def valid_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      real_triangle << false if side <= 0
      raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
