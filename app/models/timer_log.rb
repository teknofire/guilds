class TimerLog < ApplicationRecord
  belongs_to :timer
  belongs_to :updated_by, class_name: "User"
end
