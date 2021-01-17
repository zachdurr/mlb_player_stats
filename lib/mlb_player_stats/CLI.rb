class MlbPlayerStats::CLI

  def call
    puts "Welcome to MlbPlayerStats!"
    get_teams
    get_user_team
  end

  def get_teams
    @teams = ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]
  end

  def get_user_team
    @teams.each_with_index do |team, index|
      puts "#{index + 1}. #{team}"
    end
  end

end
