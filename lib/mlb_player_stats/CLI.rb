class MlbPlayerStats::CLI

  def call
    puts "\nWelcome to MlbPlayerStats!\n"
    get_teams
    get_user_team
  end

  def get_teams
    #scraper method to pull team names
    @teams = ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]
  end

  def list_teams
    puts "Select the number associated with the team you'd like to view:"
    @teams.each_with_index do |team, index|
      puts "#{index + 1}. #{team}"
    end
  end

  def get_user_team
    list_teams
    chosen_team = gets.strip
    # if valid_input(chosen_team, @teams)
    #
    # end
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i >> 0
  end
end
