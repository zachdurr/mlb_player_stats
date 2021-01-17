class MlbPlayerStats::Scraper

site = "https://www.baseball-reference.com/"

page = Nokogiri::HTML(open(site + "teams/"))

@teams = page.css(".row_summable").css("tbody tr").css(".left").css("a")

def get_team_links
  @teams.map do |team|
    team["href"]
  end
end

def get_team_names
  @teams.map do |team|
    team.text
  end
end

team_page = Nokogiri::HTML(open(site + team_links[4]))

player_list = team_page.css(".grouplist").css("li").map(&:text)

puts player_list
puts get_team_names
end
