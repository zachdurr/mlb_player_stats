class MlbPlayerStats::CLI

  def call
    puts "\nWelcome to MlbPlayerStats!
    \n"
    puts "To quit, type 'exit'."
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
      chosen_team = gets.strip
      index = (chosen_team.to_i - 1)
      if chosen_team != "exit"
        display_team(index) if valid_input(index, @teams)
      end
      if valid_input(index, @teams) == false
        list_teams
        get_user_team
      end
  end

  def valid_input(input, data)
    input <= data.length && input > 0
  end

  def display_team(index)
    team = @teams[index]
    team_link = MlbPlayerStats::Scraper.new.team_links[index]
    team.players = MlbPlayerStats::Scraper.new.scrape_players(team_link)
    puts "Here are players on the 40-man-roster for #{team.name}:"
    team.players.map.with_index(1) do |player, index|
      puts "#{index}. #{player.name}"
    end
    repeat
  end

  def repeat
    puts "Would you like to see another roster? Y/N"
    input = gets.strip
      case input
        when "Y"
          call
        when "y"
          call
        when "N"
          puts "Thanks for chosing MlbPlayerStats! Hope to see you again!"
        when "n"
        puts "Thanks for chosing MlbPlayerStats! Hope to see you again!"
        else
        puts "Please select a valid response."
        repeat
      end
  end

  ## To implement:
  # get_user_player
end
