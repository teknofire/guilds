class Player < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :guild
  has_many :ledgers

  def points
    @points = self.ledgers.where(action: 'deposit').sum(:points)
    @points -= self.ledgers.where(action: 'withdraw').sum(:points)
    @points
  end

  def to_s 
    name
  end
end
