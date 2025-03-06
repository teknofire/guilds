namespace :import_items do
    desc "Import items from JSON URL"
    task ashes: :environment do
        require 'json'
        require 'net/http'

        url = URI("https://api.ashescodex.com/items?page=1")
        query = Rack::Utils.parse_query(url.query)
        query["page"] = 1
        url.query = query.to_query

        items = JSON.parse Net::HTTP.get(url)

        while items["data"].length > 0 do
            puts "Fetching page #{query["page"]}"
            items["data"].each do |item|
                item = AshesItem.find_or_create_by(guid: item["guid"]) do |i|
                    i.data = item
                    i.save!
                end
            end
            
            query["page"] += 1
            url.query = query.to_query
            items = JSON.parse Net::HTTP.get(url)
        end

    end

end
