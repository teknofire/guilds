# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ [ "Common", 0.5 ], [ "Uncommon", 0.5 ], [ "Rare", 1 ], [ "Heroic", 3 ], [ "Epic", 6 ], [ "Legendary", 12 ] ].each do |rarity_name, value|
    Rarity.find_or_create_by!(name: rarity_name, modifier: value)
end

[
    { name: "Copper", value: 1 },
    { name: "Tin", value: 1 },
    { name: "Zinc", value: 1 },
    { name: "Ash Wood", value: 1 },
    { name: "Eastern Hemlock Wood", value: 1 },
    { name: "Oak Wood", value: 1 },
    { name: "Western Larch Wood", value: 1 },
    { name: "Weeping Willow Wood", value: 1 },
    { name: "Snowdrop", value: 1 },
    { name: "Daffodil", value: 1 },
    { name: "Giant Bluebell", value: 1 },
    { name: "Moonbell", value: 1 },
    { name: "Spider Cocoon", value: 1 },
    { name: "Arboreal Cocoon", value: 1 },
    { name: "Animal Fat", value: 1 },
    { name: "Slate", value: 1 },
    { name: "Ruby", value: 1 },
    { name: "Snar's Bone", value: 1 },
    { name: "Flax", value: 1 },
    { name: "Granite", value: 1 },
    { name: "Animal Corpse", value: 1 },
    { name: "Grem Skin", value: 1 },
    { name: 'Weeping Willow Caravan Carriage', value: 20 },
    { name: 'Weeping Willow Caravan Chassis', value: 20 }
].each do |item|
    Item.find_or_create_by!(name: item[:name]) do |i|
        i.modifier = item[:value]
    end
end

%w[ ashes ].each do |feature|
    Feature.find_or_create_by!(name: feature)
end
