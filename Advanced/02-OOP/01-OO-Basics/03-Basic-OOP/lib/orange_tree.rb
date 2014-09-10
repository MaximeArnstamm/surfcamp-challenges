class OrangeTree
  attr_reader :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @dead = false
    @fruits = 0
  end

  def one_year_passes!
    unless @dead
      @age += 1

      if (@height < 10)
        @height += 1
      end

      @dead = rand(50) > 100 - @age

      @fruits = 0
      if (@age > 5 && @age <= 10)
        @fruits = 100
      end
      if (@age > 10 && @age <= 15)
        @fruits = 200
      end
    end
  end

  def pick_a_fruit!
    @fruits -= 1
  end

  def dead?
    @dead
  end
end
