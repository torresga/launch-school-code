# Meetup
#
# Typically meetups happen on the same day of the week.
#
# Examples are
#
#     the first Monday
#     the third Tuesday
#     the Wednesteenth
#     the last Thursday
#
# Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.
#
# Write code that calculates date of meetups.

# Creating a new class Meetup
#
# - initialize:
#   - Input: A month and a year
#   - Output: none
# - day:
#   - Input: day, frequency
#   -  where weekday is one of :monday, :tuesday, etc
#       and schedule is :first, :second, :third, :fourth, :last or :teenth.
#   - Output: A new Date containing month, day as number, year

# Or what we can do, to make it less fiddly.
# We can create an array of Date objects from 1 to month end.
# Then we can use a case statement to call the correct method depending on what the schedule is.

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @days = create_days
  end

  def day(selected_day, schedule)
    selected_day_to_method = (selected_day.to_s + "?").to_sym

    all_of_selected_day = @days.select do |day|
      day.method(selected_day_to_method).call
    end

    case schedule
    when :first
      all_of_selected_day.first
    when :second
      all_of_selected_day[1]
    when :third
      all_of_selected_day[2]
    when :fourth
      all_of_selected_day[3]
    when :last
      all_of_selected_day.last
    when :teenth
      all_of_selected_day.select {|day| (13..19).include?(day.mday)}.first
    end
  end

  def create_days
    month_end = case
    when @month == 2 && Date.leap?(@year)
      29
    when @month == 2 && !Date.leap?(@year)
      28
    when [9, 4, 6, 11].include?(@month)
      30
    else
      31
    end

    (1..month_end).map do |date|
      Date.new(@year, @month, date)
    end
  end
end
