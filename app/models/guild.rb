class Guild < ApplicationRecord
  belongs_to :parent_guild, class_name: "Guild", optional: true
  has_many :child_guilds, class_name: "Guild", dependent: :destroy, foreign_key: "parent_guild_id"

  has_many :players
end
