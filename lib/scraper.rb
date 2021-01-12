require 'open-uri'
require 'nokogiri'

site = "https://www.baseball-reference.com/"

page = Nokogiri::HTML(URI.open(site + "teams/"))

@teams = page.css(".row_summable").css("tbody tr").css(".left").css("a")

def team_links
  @teams.map do |team|
    team["href"]
  end
end

def team_names
  @teams.map do |team|
    team.text
  end
end

team_page = Nokogiri::HTML(URI.open(site + team_links[4]))

player_list = team_page.css(".grouplist").css("li").map(&:text)

puts player_list
puts team_names
