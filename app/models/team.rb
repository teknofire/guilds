class Team < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: true

    has_many :members, dependent: :destroy
    has_many :users, through: :members

    has_many :team_shares, dependent: :destroy
    has_many :timers, through: :team_shares, source: :shareable, source_type: "Timer"

    def to_s
        name
    end
end
