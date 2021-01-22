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

  def team_page(chosen_team)
    team_page = Nokogiri::HTML(open(@site + team_links[chosen_team]))

  end


  def run
    team_links
    player_list = team_page.css(".grouplist").css("li").map(&:text)
    puts 'hello'
    puts team_names
    puts player_list
  end

end
