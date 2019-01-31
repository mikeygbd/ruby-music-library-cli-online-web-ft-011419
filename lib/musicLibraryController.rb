require 'pry'
class MusicLibraryController



  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    4.times do
    gets.chomp
    end
  end

  def list_songs
      songs = Song.all.sort_by {|song| song.name}
      songs.each_with_index do |s, index|
        puts "#{index + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    songs = Song.all.sort_by {|song| song.artist.name}
    songs.each_with_index do |s, index|
      puts "#{index + 1}. #{s.artist.name}"
      # binding.pry
    end
  end

  def list_genres
    songs = Song.all.sort_by {|song| song.genre.name}
    songs.each_with_index do |s, index|
      puts "#{index + 1}. #{s.genre.name}"
    end
  end

  def list_songs_by_artist(name)
    Song.all.collect do |song|
      if song.artist.name == name
        song.each_with_index do |s, index|
          puts "#{index +1}. #{s}"

        end
      end
    end
  end

end
