class MlbPlayerStats::Player
  @@all = []

  attr_accessor :name, :team, :position, :stats

  def initialize(name, team)
    @name = name
    @team = team
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


end
