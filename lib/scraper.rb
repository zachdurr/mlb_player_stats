require 'nokogiri'
require 'open-uri'

site = "https://www.baseball-reference.com/teams/"

page = Nokogiri::HTML(open(site))
# team_page = Nokogiri::HTML(open(site + team_links[index]))

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

puts team_links[2]
puts team_names[2]
