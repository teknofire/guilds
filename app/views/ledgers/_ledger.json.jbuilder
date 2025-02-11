json.extract! ledger, :id, :player_id, :item_id, :qty, :rarity_id, :action, :modifier, :points, :created_at, :updated_at
json.url ledger_url(ledger, format: :json)
