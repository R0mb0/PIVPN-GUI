class User

  # Fields: name, start_date, end_date, is_always_allowed, is_disabled

  # Builder
  def initialize(name, start_date, end_date, is_always_allowed = false, is_disabled = false)

    # Check type
    raise TypeError, "name must be a String" unless name.is_a?(String) || name.nil?
    raise TypeError, "start_date must be a Date" unless start_date.is_a?(Date) || start_date.nil?
    raise TypeError, "end_date must be a Date" unless end_date.is_a?(Date) || end_date.nil?
    raise TypeError, "is_always_allowed must be a Boolean" unless !!is_always_allowed == is_always_allowed
    raise TypeError, "is_disabled must be a Boolean" unless !!is_disabled == is_disabled

    # Check spaces in name
    if !name.nil? and name.include? " "
      raise NameError, "Name must not contain spaces"
    end

    # Check dates consistency
    if is_always_allowed == false and start_date > end_date
      raise ArgumentError, "Start date must be after end date"
    end

    # Initialize fields
    $name = name
    $start_date = start_date
    $end_date = end_date
    $is_always_allowed = is_always_allowed
    $is_disabled = is_disabled

    # Access fields from out of class
    class << self
      attr_accessor :name, :start_date, :end_date, :is_always_allowed, :is_disabled
    end
  end

  def get_infos
    return "Name "+" Start date "+" End date "+" Is always allowed "+" Is disabled "+"\n"+
            $name.to_s+" "+$start_date.to_s+" "+$end_date.to_s+" "+$is_always_allowed.to_s+" "+$is_disabled.to_s
  end

end