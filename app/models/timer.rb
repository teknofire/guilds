class Timer < ApplicationRecord
  belongs_to :user
  has_many :timer_logs, dependent: :destroy
  validates :name, presence: true
  validates :starts_at, presence: true

  acts_as_taggable_on :tags

  has_many :shares, as: :shareable, class_name: "TeamShare", dependent: :destroy
  has_many :teams, through: :shares, inverse_of: :timers
  accepts_nested_attributes_for :teams, allow_destroy: true

  def elapsed
    (Time.now - self.starts_at).seconds
  end

  def self.available_durations
    [
      [ "15 minutes", 15.minutes ],
      [ "20 minutes", 20.minutes ],
      [ "30 minutes", 30.minutes ],
      [ "45 minutes", 45.minutes ],
      [ "1 hour", 1.hour ],
      [ "1.5 hours", (1.5).hours ],
      [ "2 hours", 2.hours ],
      [ "4 hours", 4.hours ]
    ]
  end

  def self.filter_durations
    [
      [ "All", nil ],
      [ "< 24 hours", 24.hours ],
      [ "< 4 hours", 4.hours ],
      [ "< 2 hours", 2.hours ],
      [ "< 1.5 hours", (1.5).hours ],
      [ "< 1 hour", 1.hour ],
      [ "< 45 minutes", 45.minutes ],
      [ "< 30 minutes", 30.minutes ],
      [ "< 20 minutes", 20.minutes ],
      [ "< 15 minutes", 15.minutes ]
    ]
  end

  def tag_list_json
    tag_list.map { |tag| { value: tag } }.to_json
  end

  def map_url
    return "" if self.coord_x.blank? || self.coord_y.blank?
    "https://ashescodex.com/map?x=#{self.coord_x}&y=#{self.coord_y}"
  end
end
