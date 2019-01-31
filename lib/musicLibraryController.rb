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
    artists_names = Artist.all.map { |artist| artist.name}
    artists_names.sort.uniq.each_with_index do |a, index|
      puts "#{index + 1}. #{a}"

    end
  end

  def list_genres
    genres = Genre.all.map { |genre| genre.name}
    genres.sort.uniq.each_with_index do |g, index|
      puts "#{index + 1}. #{g}"
    end
  end

  def list_songs_by_artist
  puts  "Please enter the name of an artist:"
  input = gets.chomp
  artist_found = Artist.find_by_name(input)
  # binding.pry
  songs = Song.all.sort_by {|s| s.name}
  artist_songs = []
  songs.each do |song|
  if song.artist == artist_found
    artist_songs << song

    sorted_songs = artist_songs.sort_by {|s| s.name}
  end
    sorted_songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        
      end
    end
  end


end
