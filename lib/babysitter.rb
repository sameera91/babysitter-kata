class Babysitter

  MIDNIGHT = 12

  def start_to_bedtime(start_time, bedtime)
    start_time = start_time.match(/([^:]+)/)[0].to_i
    bedtime = bedtime.match(/([^:]+)/)[0].to_i
    hours = bedtime - start_time
    wage = 12 * hours
    return wage
  end

  def bedtime_to_midnight(bedtime)
    bedtime = bedtime.match(/([^:]+)/)[0].to_i
    hours = MIDNIGHT - bedtime
    wage = 8 * hours
    return wage
  end

end