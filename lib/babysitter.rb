class Babysitter

  MIDNIGHT = 12

  def initialize
    @wage1 = 0
    @wage2 = 0
    @wage3 = 0
    @total_wage = 0
  end

  def enter_hours
    puts "Please enter start time between 5pm and 12am (e.g. 6:00)"
    start_time = gets.strip

    while !valid_time_format(start_time) ||  !valid_full_hour(start_time) || !valid_start_time(start_time)
      if !valid_time_format(start_time)
        puts "Must be a valid time format (e.g. 5:00). Try again."
      elsif !valid_full_hour(start_time)
        puts "Must be a full hour. Try again."
      elsif !valid_start_time(start_time)
        puts "Must be a time between 5pm and 12am. Try again."
      end
      start_time = gets.strip
    end


    puts "Please enter a bedtime between 6pm and 11pm"
    bed_time = gets.strip

    while !valid_time_format(bed_time) ||  !valid_full_hour(bed_time) || !valid_bed_time(bed_time)
      if !valid_time_format(bed_time)
        puts "Must be a valid time format (e.g. 7:00). Try again."
      elsif !valid_full_hour(bed_time)
        puts "Must be a full hour. Try again."
      elsif !valid_bed_time(bed_time)
        puts "Must be a time between 6pm and 11pm. Try again."
      end
      bed_time = gets.strip
    end

    puts "Please enter an endtime between 12am and 4pm"
    end_time = gets.strip

    while !valid_time_format(end_time) ||  !valid_full_hour(end_time) || !valid_end_time(end_time)
      if !valid_time_format(end_time)
        puts "Must be a valid time format (e.g. 1:00). Try again."
      elsif !valid_full_hour(end_time)
        puts "Must be a full hour. Try again."
      elsif !valid_end_time(end_time)
        puts "Must be a time between 12am and 4pm. Try again."
      end
      end_time = gets.strip
    end

    start_to_bedtime(start_time, bed_time)
    bedtime_to_midnight(bed_time)
    midnight_to_end(end_time)
    add_total

    puts "Your total wage is $" + @total_wage.to_s
  end

  def valid_time_format(time)
    valid = true
    if time.match('\:(.*)') === nil
      valid = false
    elsif time.match(/([^:]+)/)[0].to_i > 12 || time.match(/([^:]+)/)[0].to_i < 1
      valid = false
    end
    return valid
  end

  def valid_full_hour(time)
    minutes = time.match('\:(.*)')[1].to_i
    hour = time.match(/([^:]+)/)[0].to_i
    valid = true
    if minutes != 0 || hour > 12 || hour < 1
      valid = false
    end
    return valid
  end

  def valid_start_time(time)
    hour = time.match(/([^:]+)/)[0].to_i
    valid = true
    if hour < 5 || hour > 11
      valid = false
    end
    return valid
  end

  def valid_bed_time(time)
    hour = time.match(/([^:]+)/)[0].to_i
    valid = true
    if hour < 6 || hour > 11
      valid = false
    end
    return valid
  end

  def valid_end_time(time)
    hour = time.match(/([^:]+)/)[0].to_i
    valid = true
    if hour > 12 || (hour >= 5 && hour <= 11)
      valid = false
    end
    return valid
  end

  def start_to_bedtime(start_time, bedtime)
    start_time = start_time.match(/([^:]+)/)[0].to_i
    bedtime = bedtime.match(/([^:]+)/)[0].to_i
    hours = bedtime - start_time
    @wage1 = 12 * hours
    return @wage1
  end

  def bedtime_to_midnight(bedtime)
    bedtime = bedtime.match(/([^:]+)/)[0].to_i
    hours = MIDNIGHT - bedtime
    @wage2 = 8 * hours
    return @wage2
  end

  def midnight_to_end(endtime)
    endtime = endtime.match(/([^:]+)/)[0].to_i
    hours = endtime
    @wage3 = 16 * hours
    return @wage3
  end

  def add_total
    @total_wage = @wage1 + @wage2 + @wage3
    return @total_wage
  end
end