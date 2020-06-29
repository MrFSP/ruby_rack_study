class Database
  USERS = {
    1 => { id: 1, name: "Jason", bike: "Cannondale", api_key: "1234" },
    2 => { id: 2, name: "Coraline", bike: "Trek", api_key: "abcd" }
  }

  def self.users(user_id)
    USERS.select do |id, _|
      id == user_id
    end
  end

  def self.user_by_api_key(key)
    USERS.values.find do |user|
      user[:api_key] == key
    end
  end

  RIDES = {
    1 => { user_id: 1, title: 'Morning Commute', date: '2016-09-28' },
    2 => { user_id: 1, title: 'Evening Commute', date: '2016-09-28' }
  }

  def self.add_ride(ride)
    id = RIDES.keys.max + 1
    RIDES[id] = ride
  end

  def self.rides
    RIDES
  end
end
