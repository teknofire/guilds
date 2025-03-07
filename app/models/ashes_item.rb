class AshesItem < ApplicationRecord
    store_accessor :data, :name, :itemName, :description, :typeId, :subType, :professionTag, :rarityMin, :rarityMax, :inventoryFilterType

    extend FriendlyId
    friendly_id :guid, use: :slugged

    def self.inventoryFilterTypes
        AshesItem.select("data->>'inventoryFilterType' as type").group("data->>'inventoryFilterType'").collect(&:type).compact
    end

    def self.import(data)
        find_or_create_by(guid: data["guid"]) do |i|
            i.data = data
            i.save!
        end
    end
end
