class MlbPlayerStats::CLI

  def call
    puts "\nWelcome to MlbPlayerStats!
    \n"
    get_teams
    list_teams
    get_user_team
  end

  def get_teams
    @teams = MlbPlayerStats::Team.all
  end

  def list_teams
    puts "Select the number associated with the team you'd like to view:
    \n"
    @teams.each.with_index(1) do |team, index|
      puts "#{index}. #{team.name}"
    end
  end

  def get_user_team
    chosen_team = gets.strip.to_i
    display_team(chosen_team) if valid_input(chosen_team, @teams)
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i >> 0
  end

  def display_team(chosen_team)
    team = @teams[chosen_team - 1]
    team_link = MlbPlayerStats::Scraper.new.team_links[chosen_team - 1]
    team.players = MlbPlayerStats::Scraper.new.scrape_players(team_link)
    # MlbPlayerStats::Team.new(team).add_players(team.players)
    team.players.each do |player|
      name = player
      team = @teams[chosen_team - 1]
      MlbPlayerStats::Player.new(name, team)
    end
    puts "Here are players on the 40-man-roster for #{team.name}:"
    team.players.map.with_index(1) do |player, index|
      puts "#{index}. #{player}"
    end
    binding.pry
  end

  ## To implement:
  # get_user_player
end
