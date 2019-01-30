class Genre

  attr_accessor :name, :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song
    @songs.uniq!
  if song.genre != nil
    song.genre
  else
  song.genre = self
  end
end

  def self.destroy_all
    @@all.clear
  end

end
