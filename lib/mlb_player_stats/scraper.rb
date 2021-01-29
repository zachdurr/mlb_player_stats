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

  def repeat_team_names
    @teams.map.with_index(1) do |team, index|
      name = team.text
      puts "#{index}. #{name}"
    end
  end


  def scrape_players(team_link)
    doc = Nokogiri::HTML(open(@site + team_link))
    player_list = doc.css(".grouplist").css("li").map(&:text)
    team = MlbPlayerStats::Team.new(doc.css("span")[6].text)
    player_urls = doc.css(".grouplist").css("li").css("a").map {|x| x["href"]}
    add_players = team.add_players(player_list, player_urls)
    # team.add_players_url(player_urls)
    players = player_list.map do |player|
      name = player
    end
    team.players
    # binding.pry
  end

  def scrape_player_stats(player_link)
    doc = Nokogiri::HTML(open("https://www.baseball-reference.com/" + player_link))
    stat_categories = doc.css(".p1").css("h4").map(&:text)
    statistics = doc.css(".p1").css("p").map(&:text)
    current_year = doc.css(".stats_pullout").css("p").first.text
    position = doc.css(".players").css("p").first.text.strip.split("\n")[1].strip
    dob = doc.css(".players").css("p").map(&:text)[4].strip.split("\n")[2].strip
    puts "\nDate of Birth: #{dob}\n\n"
    puts "\nPosition: #{position}\n\n"
    puts "#{current_year} Statistics:"
    puts "-------------------"
    puts "#{stat_categories[0]} | #{stat_categories[1]} | #{stat_categories[2]} | #{stat_categories[3]}"
    puts "#{statistics[0]} | #{statistics[2]} | #{statistics[4]} | #{statistics[6]}"
    puts "Career Statistics:"
    puts "-------------------"
    puts "#{stat_categories[0]} | #{stat_categories[1]} | #{stat_categories[2]} | #{stat_categories[3]}"
    puts "#{statistics[1]} | #{statistics[3]} | #{statistics[5]} | #{statistics[7]}"
    # statistics are listed by year and career. the first item in the array will be the current year stats and the second will be the career stats
  end

end
