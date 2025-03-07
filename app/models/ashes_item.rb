class AshesItem < ApplicationRecord
    store_accessor :data, :name, :itemName, :description, :typeId, :subType, :professionTag, :rarityMin, :rarityMax, :inventoryFilterType

    extend FriendlyId
    friendly_id :guid, use: :slugged
end
