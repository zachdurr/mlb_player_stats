require 'pry'
require 'nokogiri'
require 'open-uri'

class MlbPlayerStats::Scraper

  def initialize
  @site = "https://www.baseball-reference.com/"
  page = Nokogiri::HTML(open(@site + "teams/"))
  @teams = page.css(".row_summable").css("tbody tr").css(".left").css("a")
  end

  def team_links
    @teams.map do |team|
      team["href"]
    end
  end

  def team_names
    @teams.map.with_index(1) do |team|
      name = team.text
    MlbPlayerStats::Team.new(name)
    end
  end

  def scrape_players(team_link)
    doc = Nokogiri::HTML(open(@site + team_link))
    player_list = doc.css(".grouplist").css("li").map(&:text)
    team = MlbPlayerStats::Team.new(doc.css("span")[6].text)
    players = player_list.map do |player|
      name = player
      MlbPlayerStats::Player.new(name, team)
    end
  end

end
