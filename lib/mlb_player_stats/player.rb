class MlbPlayerStats::Player
  @@all = []

  attr_accessor :name, :team, :url, :position, :dob, :war, :ab, :h, :hr, :w, :l, :era

  def initialize(name, team)
    @name = name
    @team = team
    save
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
