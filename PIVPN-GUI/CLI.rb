
require "open3"
class CLI

  # Set sudo password to use this class in your system
  $sudo_password = ""
  # Set user home for retrieving files
  $user_home = ""
  # Where put last certificate
  $folder = ""

  # Add a user from CLI
  def self.add_user(user)

    # Check type
    raise TypeError, "user must be a String" unless user.is_a?(String)

    # Create a new user
    system("echo "+$sudo_password+" | sudo -S pivpn -a -n "+user)

    # Open configuration file
    File.open("/home/"+$user_home+"/configs/"+user+".conf") do |f|
      f.each_line do |line|
        puts line
      end
    end

    # Copy file in a better position
    system("mkdir -p /home/"+$user_home+"/"+$folder+"/Certificates")
    # For a reason that i don't know the certificate is deleted when the user is deleted
    #system("echo "+$sudo_password+" | sudo -S rm -r /home/"+$user_home+"/"+$folder+"/Certificates/*")
    #system("rm -r /home/"+$user_home+"/"+$folder+"/Certificates/*")
    system("cp /home/"+$user_home+"/configs/"+user+".conf /home/"+$user_home+"/"+$folder+"/Certificates/"+user+".conf")

  end

  # Remove a user from CLI
  def self.remove_user(user)
    # Check type
    raise TypeError, "user must be a String" unless user.is_a?(String)

    # Remove a user
    system("echo "+$sudo_password+" | sudo -S echo ' ' > /dev/null") # what a cringe
    Open3.popen3("sudo pivpn -r "+user) do |stdin, stdout, stderr, wait_thr|
      stdin.puts 'y'
      stdin.close

      puts stdout.read
    end
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

    system("echo "+$sudo_password+" | sudo -S echo ' ' > /dev/null") # what a cringe
    # Verify if is possible work with the user
    Open3.popen3("pivpn -l") do |stdin, stdout, stderr, wait_thr|
      stdout.each_line do |line|
        if(line.include? user)

          # Make the action
          Open3.popen3("pivpn -on "+user) do |stdin, stdout, stderr, wait_thr|
            stdin.puts 'y'
            stdin.close

            puts stdout.read
            return
          end

        end
      end
    end

    raise ArgumentError, "user does not exist"

  end

  # Disable a user
   def self.disable_user(user)
       # Check type
       raise TypeError, "user must be a String" unless user.is_a?(String)

       system("echo "+$sudo_password+" | sudo -S echo ' ' > /dev/null") # what a cringe
       # Verify if is possible work with the user
       Open3.popen3("pivpn -l") do |stdin, stdout, stderr, wait_thr|
         stdout.each_line do |line|
           if(line.include? user)

             # Make the action
             Open3.popen3("pivpn -off "+user) do |stdin, stdout, stderr, wait_thr|
               stdin.puts 'y'
               stdin.close

               puts stdout.read
               return
             end

           end
         end
       end

       raise ArgumentError, "user does not exist"
   end

end