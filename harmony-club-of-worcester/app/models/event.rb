class Event < ApplicationRecord
  has_one_attached :photo
  validates :title, :eventstart, :eventend, presence: true
  enum occurence: { never: 0, weekly: 1, biweekly: 2, monthly: 3, annually: 4 }

  def schedule
    schedule = IceCube::Schedule.new(now = eventstart)
    case occurence
    when 'never'
      schedule = nil
    when 'weekly'
      schedule.add_recurrence_rule IceCube::Rule.weekly(1)
    when 'biweekly'
      schedule.add_recurrence_rule IceCube::Rule.weekly(2)
    when 'monthly'
      schedule.add_recurrence_rule IceCube::Rule.monthly(1)
    when 'yearly'
      schedule.add_recurrence_rule IceCube::Rule.yearly(1)
    end
    schedule
  end

  has_many :permissions, as: :permissible
end