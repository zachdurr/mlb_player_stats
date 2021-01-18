require_relative "./mlb_player_stats/version"
require_relative "./mlb_player_stats/scraper"
require_relative "./mlb_player_stats/CLI"
require_relative "./mlb_player_stats/player"
require_relative "./mlb_player_stats/team"

require 'pry'
require 'nokogiri'
require 'open-uri'

module MlbPlayerStats
  class Error < StandardError; end
  # Your code goes here...
end
