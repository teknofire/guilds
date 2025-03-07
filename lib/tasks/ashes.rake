namespace :ashes do
    def import_ashes_api(uri, model)
        require 'json'
        require 'net/http'

        url = URI(uri)
        query = Rack::Utils.parse_query(url.query)
        query["page"] = 1
        url.query = query.to_query

        items = JSON.parse Net::HTTP.get(url)
        puts "Starting import for #{model.name} from #{url}"
        while items["data"].length > 0 do
            puts "Fetching #{url}"
            items["data"].each do |item|
                model.import(item)
            end
            
            query["page"] += 1
            url.query = query.to_query
            items = JSON.parse Net::HTTP.get(url)
        end

        puts "Finished import for #{model.name}: #{model.count}"
    end

    desc "Import all from AOC"
    task all: :environment do
        Rake::Task["ashes:items"].invoke
        Rake::Task["ashes:mobs"].invoke
    end

    desc "Import items from AOC"
    task items: :environment do
        import_ashes_api("https://api.ashescodex.com/items?page=1", AshesItem)
    end

    desc "Import mobs from AOC"
    task mobs: :environment do
        import_ashes_api("https://api.ashescodex.com/mobs?page=1", AshesMob)
    end 
end
