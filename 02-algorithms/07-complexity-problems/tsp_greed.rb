class City
  attr_accessor :name
  attr_accessor :visited

  def initialize(name)
    @name = name
    @visited = false
  end
end

city_one = City.new('San Francisco')
city_two = City.new('Seattle')
city_three = City.new('Denver')
city_four = City.new('Boston')
city_five = City.new('New York')
cities = [city_one, city_two, city_three, city_four, city_five]

class Trip
  attr_accessor :start_city
  attr_accessor :next_city
  attr_accessor :distance

  def initialize(start_city, next_city, distance)
    @start_city = start_city
    @next_city = next_city
    @distance = distance
  end
end

trip_one = Trip.new(city_one, city_two, 808)
trip_two = Trip.new(city_one, city_three, 1254)
trip_three = Trip.new(city_one, city_four, 3100)
trip_four = Trip.new(city_one, city_five, 2906)
trip_five = Trip.new(city_two, city_one, 808)
trip_six = Trip.new(city_two, city_three, 1309)
trip_seven = Trip.new(city_two, city_four, 3046)
trip_eight = Trip.new(city_two, city_five, 2852)
trip_nine = Trip.new(city_three, city_one, 1254)
trip_ten = Trip.new(city_three, city_two, 1309)
trip_eleven = Trip.new(city_three, city_four, 1972)
trip_twelve = Trip.new(city_three, city_five, 1778)
trip_thirteen = Trip.new(city_four, city_one, 3100)
trip_fourteen = Trip.new(city_four, city_two, 3046)
trip_fifteen = Trip.new(city_four, city_three, 1972)
trip_sixteen = Trip.new(city_four, city_five, 215)
trip_seventeen = Trip.new(city_five, city_one, 2906)
trip_eighteen = Trip.new(city_five, city_two, 2852)
trip_nineteen = Trip.new(city_five, city_three, 1778)
trip_twenty = Trip.new(city_five, city_four, 215)
trips = [trip_one, trip_two, trip_three, trip_four, trip_five, trip_six, trip_seven, trip_eight, trip_nine, trip_ten, trip_eleven, trip_twelve, trip_thirteen, trip_fourteen, trip_fifteen, trip_sixteen, trip_seventeen, trip_eighteen, trip_nineteen, trip_twenty]


def nearest_neighbor(cities, current_city, trips)
  best_neighbor = nil
  best_path = []
  trips.each do |trip|
    if trip.start_city.name == current_city.name
      if best_neighbor == nil && trip.next_city.visited == false
        best_neighbor = trip
      end
    end
  end
  best_path << best_neighbor
  puts "The trip from #{best_neighbor.start_city.name} to #{best_neighbor.next_city.name} is #{best_neighbor.distance} miles."
  current_city.visited = true
  if best_neighbor.start_city.name == current_city.name
    new_city = best_neighbor.next_city
  else
    new_city = best_neighbor.start_city
  end
  until best_path.length == cities.length - 1
    nearest_neighbor(cities, new_city, trips)
  end
end

nearest_neighbor(cities, city_one, trips)
