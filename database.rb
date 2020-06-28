class Database
  USERS = {
    1 => { name: 'Jason', bike: 'Cannondale' },
    2 => { name: 'Coraline', bike: 'Trek' }
  }

  def self.users
    USERS
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
