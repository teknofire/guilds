class TeamShare < ApplicationRecord
  belongs_to :team
  belongs_to :shareable, polymorphic: true
end
