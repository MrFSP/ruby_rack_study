class Database
  def initialize
    @users = {
      1 => { id: 1, name: "Jason", bike: "Cannondale", api_key: "1234" },
      2 => { id: 2, name: "Coraline", bike: "Trek", api_key: "abcd" }
    }

    @rides = {
      1 => { user_id: 1, title: "Morning Commute", date: "2016-09-28" },
      2 => { user_id: 1, title: "Evening Commute", date: "2016-09-28" }
    }
  end

  def users(user_id)
    @users.select do |id, _|
      id == user_id
    end
  end

  def user_by_api_key(key)
    @users.values.find do |user|
      user[:api_key] == key
    end
  end

  def add_ride(ride)
   id = @rides.keys.max + 1
   @rides[id] = ride
  end

  def rides(user_id)
    @rides.select do |_, ride|
      (ride["user_id"] || ride[:user_id]) == user_id
    end
  end
end
