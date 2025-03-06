class AshesItem < ApplicationRecord
    store_accessor :data, :name, :itemName, :description, :typeId, :subType, :professionTag, :rarityMin, :rarityMax, :inventoryFilterType
end
