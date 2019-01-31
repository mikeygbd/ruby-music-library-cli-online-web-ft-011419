require 'pry'
class MusicLibraryController



  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    triggers
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
     puts "Please enter the name of an artist:"
     artist_name = gets
     artist = Artist.all.select { |artist| artist.name == artist_name }.first
     if artist != nil
     sorted_songs = artist.songs.sort_by {|song| song.name}
     sorted_songs.each_with_index do |song, index|
       puts "#{index + 1}. #{song.name} - #{song.genre.name}"
     end
   end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.all.select { |genre| genre.name == genre_name }.first
    if genre != nil
    sorted_songs = genre.songs.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end
end

  # def play_song
  #   song_array = []
  #    list_songs.each do |song|
  #      song_array << song
  #   puts "Which song number would you like to play?"
  #   input = gets.chomp.to_i
  #   if input > 0 && input <= song_array.size
  #     song_choice = song_list[input - 1]
  #     end
  #   end
  # end


    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i
      if (1..Song.all.length).include?(input)
        song = Song.all.sort_by {|song| song.name}[input-1]
      end
      if song
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end

    def triggers
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end









end
