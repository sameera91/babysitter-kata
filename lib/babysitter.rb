class Babysitter

  MIDNIGHT = 12

  def initialize
    @wage1 = 0
    @wage2 = 0
    @wage3 = 0
    @total_wage = 0
  end

  def enter_hours
    puts "Please enter start time between 5pm and 12am"
    start_time = gets.strip
    puts "Please enter a bedtime between 6pm and 11pm"
    bedtime = gets.strip
    puts "Please enter an endtime between 12am and 4pm"
    endtime = gets.strip

    start_to_bedtime(start_time, bedtime)
    bedtime_to_midnight(bedtime)
    midnight_to_end(endtime)
    add_total

    puts "Your total wage is $" + @total_wage.to_s
  end

  def valid_time(time)
    minutes = time.match('\:(.*)')[1].to_i
    hour = time.match(/([^:]+)/)[0].to_i
    valid = true
    if minutes != 00 || hour > 12 || hour < 1
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
    if hour > 12 || (hour >= 5 && hour < 11)
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