class Database
  # Import classes
  require 'User'
  require 'json'

  # Include Singleton
  include Singleton

  # Fields -> use of singleton pattern
  @database = Hash.new

  # Method to add a user
  def add_user(name, user)

    # Check type
    raise TypeError, "name must be a String" unless name.is_a?(String)
    raise TypeError, "user must be a User" unless name.is_a?(User)

    # Add new user
    if @database.has_key?(name)
      raise ArgumentError, "This name already exists"
    else
      @database.store(name, user)
    end

    # Final check
    return @database.has_key?(name) and @database[name] == user
  end

  # Method to remove a user
   def remove_user(name)

     # Check type
     raise TypeError, "name must be a String" unless name.is_a?(String)

     if @database.has_key?(name)
       @database.delete(name)
     else
       raise ArgumentError, "This name doesn't exists"
     end

     return !@database.has_key?(name)
   end

  # Method to retrieve a user
  def retrieve_user(name)

    # Check type
    raise TypeError, "name must be a String" unless name.is_a?(String)

    if @database.has_key?(name)
      return @database[name]
    else
      raise ArgumentError, "This name doesn't exists"
    end

  end

  # Method to retrieve all users
  def retrieve_all_users
    return @database.values
  end

  # Method to save database to file
  def save_database
    File.open("database.json", "w") do |f|
      f.write(@database.to_json)
    end
  end


    # Method to load database from file
  def load_database
    File.open("database.json") do |f|
      @database = JSON.parse(f.read)
    end
  end


end