# File to test other classes

#require 'User.rb'
require_relative 'User'
require 'date'

@user = User.new("Rombo", Date.new(2010, 6, 20), Date.new(2010, 6, 30), true, false)

puts @user.name
puts @user.start_date
puts @user.end_date
puts @user.is_always_allowed
puts @user.is_disabled
