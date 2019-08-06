# Clock
#
# Create a clock that is independent of date.
#
# You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.

# class Clock
#   - class method at
#     - Input: One or more operators
#     - Output: an integer
  # - to_s method - can we put this into a module?
  #   the module doesn't call the to_s method. We are calling the to_s method on that class.
  # Is there a better way to do this rather than monkeypatch Integer????

class Integer
  def to_s
    hours, minutes = self.divmod(60)
    hours = if hours > 23
      0
    elsif hours < 0
      24 + hours
    else
      hours
    end

    sprintf("%02d:%02d", hours, minutes)
  end
end

class Clock

  def self.at(*time)
    [time[0] * 60, time[1..-1]].flatten.sum
  end
end
