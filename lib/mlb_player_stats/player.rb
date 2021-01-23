class MlbPlayerStats::Player
  @@all = []

  attr_accessor :name, :team, :position, :stats

  def initialize(name, team)
    @name = name
    @team = MlbPlayerStats::Team.new(team) unless MlbPlayerStats::Team.all.include?(team)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def import_from_array(arr)
    arr.each do |a|
      @name = a
      save
    end
  end

  def add_to_team
    @team.players << self unless @team.players.include?(self)
  end


end
