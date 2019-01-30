class Song

  attr_accessor :name, :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if artist != nil
    artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != nil
    genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
        song
      end
    end
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name)
       song = self.find_by_name(name)
     else
    song = self.create(name)
    end
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
