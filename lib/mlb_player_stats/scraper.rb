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

  def scrape_teams
    @teams.map do |team|
      team.text
    end
  end

  def team_page
    team_page = Nokogiri::HTML(open(@site + team_links[4]))
  end


  def run
    team_links
    player_list = team_page.css(".grouplist").css("li").map(&:text)
    puts 'hello'
    puts scrape_teams
    puts player_list
  end
end
