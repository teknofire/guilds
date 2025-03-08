class Ledger < ApplicationRecord
  belongs_to :player
  belongs_to :item
  belongs_to :rarity
  belongs_to :created_by, class_name: 'User'

  before_save :update_modifer_and_points

  def update_modifer_and_points
    self.modifier = item.modifier * rarity.modifier
    self.points = (self.qty * self.modifier).ceil
  end

  def self.action_options
    %w[deposit withdraw]
  end
end
