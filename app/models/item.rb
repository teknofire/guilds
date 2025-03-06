class Item < ApplicationRecord
    has_many :ledgers

    def to_s
        name
    end

    def quantity
        @qty = ledgers.where(item: self, action: "deposit").sum(:qty)
        @qty -= ledgers.where(item: self, action: "withdraw").sum(:qty)
        @qty
    end
end
