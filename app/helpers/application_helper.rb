module ApplicationHelper
    include Pagy::Frontend

    def flash_class(level)
        bootstrap_alert_class = {
            "success" => "alert-success",
            "error" => "alert-danger",
            "notice" => "alert-success",
            "alert" => "alert-danger",
            "warn" => "alert-warning"
        }
        bootstrap_alert_class[level]
    end

    def codex_map_url(x, y)
        "https://ashescodex.com/map/?x=#{x}&y=#{y}"
    end

    def is_int(value)
        true if Integer(value) rescue false
    end

    def rarity_class(rarity)
        case rarity.to_i
        when 1
        "common"
        when 2
        "uncommon"
        when 3
        "rare"
        when 4
        "heroic"
        when 5
        "legendary"
        when 6
        "artifact"
        else
        "common"
        end
    end
end
