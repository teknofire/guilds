class AshesMob < ApplicationRecord
    extend FriendlyId
    friendly_id :slug, use: :slugged


    validates :slug, presence: true, uniqueness: true

    store_accessor :data, :_displayName
    alias_method :name, :_displayName
    store_accessor :data, :_levelRange
    alias_method :level_range, :_levelRange
    store_accessor :data, :populationInstances
    alias_method :population_instances, :populationInstances

    def self.import(data)
        find_or_create_by(slug: data["_slug"]) do |m|
            m.data = data
            m.save!
        end
    end
end
