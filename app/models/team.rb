class Team < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: true

    has_many :members, dependent: :destroy
    has_many :users, through: :members

    def to_s
        name
    end
end
