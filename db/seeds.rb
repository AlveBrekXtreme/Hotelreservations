NAMES = %w[ole dole doffen].freeze
CITIES = %w[Porsgrunn Porsgrunn Skien Skien Siljan].freeze

def generate_users
  User.create(email: "alve@rubynor.com", password: "admin123", admin_user: true)
  NAMES.each do |name|
    User.create(email: "#{name}@gmail.com", password: "test1234")
  end
end

def generate_hotels
  CITIES.each do |city|
    Hotel.create(
      name: Faker::Company.name,
      city: city,
      number_of_rooms: 60,
      price: rand(1000.0..2000.0).round(2)
    )
  end
end

def generate_reservations
  Hotel.all.each_with_index do |hotel, index|
    index += 1
    (1..6).each do |number|
      if number == 1 || number == 2 || number == 3
        generate_reservation(hotel, Date.today - 5.days, Date.today, 2 * index)
      else
        generate_reservation(hotel, Date.today - 10.days, Date.today - 6.days, 2 * index)
      end
    end
  end
end

def generate_reservation(hotel, arrival_date, depature_date, number_of_rooms)
  Reservation.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: "94#{rand(200000..900000)}",
    email: "#{Faker::Name.first_name}@gmail.com",
    hotel: hotel,
    arrival_date: arrival_date,
    depature_date: depature_date,
    number_of_rooms: number_of_rooms
  )
end

generate_users
generate_hotels
generate_reservations
