class Timer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :starts_at, presence: true

  def elapsed 
    (Time.now - self.starts_at).seconds
  end

  def self.available_durations
    [
      ['15 minutes', 15.minutes],
      ['20 minutes', 20.minutes],
      ['30 minutes', 30.minutes],
      ['45 minutes', 45.minutes],
      ['1 hour', 1.hour],
      ['1.5 hours', (1.5).hours],
      ['2 hours', 2.hours],
      ['4 hours', 4.hours]
    ]
  end

  def map_url
    return "" if self.coord_x.blank? || self.coord_y.blank?
    "https://ashescodex.com/map?x=#{self.coord_x}&y=#{self.coord_y}"
  end
end
