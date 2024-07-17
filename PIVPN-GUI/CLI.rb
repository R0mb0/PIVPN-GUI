class CLI

  # Set sudo password to use this class in your system
  $sudo_password = ""
  # Set user home for retrieving files
  $user_home = ""

  # Add a user from CLI
  def self.add_user(user)
    # Check type
    raise TypeError, "user must be a String" unless user.is_a?(String)

    # Create a new user
    system("echo "+$sudo_password+" | sudo -S pivpn -a -n "+user)

    # Open configuration file
    File.open("/home/"+$user_home+"/configs/"+user+".config") do |f|
      f.puts
    end
  end

  # Remove a user from CLI
  def self.remove_user(user)
    # Check type
    raise TypeError, "user must be a String" unless user.is_a?(String)

    # Remove a user
    system("echo "+$sudo_password+" | sudo -S pivpn -r "+user)
  end

  # Get all users
  def self.get_all_users
    # This informations will be formated at some point
    system("echo "+$sudo_password+" | sudo -S pivpn -l ")
  end

  # Enable a user
  def self.enable_user(user)
    # Check type
    raise TypeError, "user must be a String" unless user.is_a?(String)

    system("echo "+$sudo_password+" | sudo -S pivpn -on "+user)
  end

  # Disable a user
   def self.disable_user(user)
       # Check type
       raise TypeError, "user must be a String" unless user.is_a?(String)

       system("echo "+$sudo_password+" | sudo -S pivpn -off "+user)
     end

end