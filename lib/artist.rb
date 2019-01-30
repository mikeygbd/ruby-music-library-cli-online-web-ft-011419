require 'pry'
class Artist

  attr_accessor :name, :songs

@@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @genres = []
  end
  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song
    @songs.uniq!
  if song.artist != nil
    song.artist
  else
  song.artist = self
  end
end

  # def genres
  #   g = Song.genre
  #   if g != nil
  #     @genres << g
  #     @genres
  #   end


  # end

  def self.destroy_all
    @@all.clear
  end

end
