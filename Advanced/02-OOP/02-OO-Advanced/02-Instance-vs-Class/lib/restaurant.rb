class Restaurant

  #TODO add relevant accessors if necessary
  attr_accessor :city, :name

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @total_rate = 0
    @nb_rates = 0
  end

  def rate(rate)
    @nb_rates += 1
    @total_rate += rate
  end

  def average_rating
    @total_rate / @nb_rates.to_f
  end

  #TODO: implement #filter_by_city and #rate methods
  def self.filter_by_city(list, city)
    list.select { |resto| resto.name if (resto.city == city) }
  end
end
