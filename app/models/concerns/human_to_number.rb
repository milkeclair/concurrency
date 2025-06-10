module HumanToNumber
  extend ActiveSupport::Concern

  def human_to_number(humanized)
    case humanized
    when "one"
      1
    when "two"
      2
    when "three"
      3
    when "four"
      4
    when "five"
      5
    when "six"
      6
    when "seven"
      7
    when "eight"
      8
    when "nine"
      9
    when "ten"
      10
    else
      nil
    end
  end
end
