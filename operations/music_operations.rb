require_relative '../classes/music_album'
require_relative '../classes/genre'
require 'json'
class MusicOperations
  attr_accessor :music, :genres

  def initialize(music, genres)
    @music = music
    @genres = genres
  end

  # a method to add a music album
  def add_music_album
    puts 'Create a new music album'
    puts ''
    print 'Is the music album archived? Enter (true) or (false):'
    archived = gets.chomp
    puts ''
    print 'Is the music album on spotify? Enter (true) or (false):'
    on_spotify = gets.chomp
    puts ''
    puts 'Enter date of publishing the music album Format("YYYY-MM-DD)'
    publish_date = gets.chomp
    added_album = MusicAlbum.new(archived, publish_date, on_spotify)
    music.push({ id: added_album.id, archived: added_album.archived, publish_date: added_album.publish_date })
    save_json_data('music.json', music)
    puts 'music album added successfully'
  end

  # a method to list all music albums
  def list_all_music_albums
    puts 'Lists all music albums'
    if music.empty?
      puts 'No music albums yet'
      puts 'Choose option 5 to add a music album'
    else
      music.each do |item|
        puts "id:#{item['id'] || item[:id]}"
        puts "archived:#{item['archived'] || item[:archived]}"
        puts "published_date:#{item['publish_date'] || item[:publish_date]}"
        puts ''
      end
    end
  end

  # a method to create genre
  def create_genre
    puts 'Create a new genre'
    puts ''
    print 'Please enter the genre you want:'
    entered_genre = gets.chomp.to_s
    puts ''
    added_genre = Genre.new(entered_genre)
    genres.push({ id: added_genre.id, name: added_genre.name })
    save_json_data('genre.json', genres)
    puts ''
    puts 'Genre added successfully'
  end

  # a method to list all genres
  def list_all_genres
    puts 'Lists all genres'
    if genres.empty?
      puts 'No genre added yet'
      puts 'Choose option 7 to create a new genre'
    else
      genres.each { |item| puts " id:#{item['id'] || item[:id]} genre:#{item['name'] || item[:name]}" }
    end
  end

  # a method to save data to the json files
  def save_json_data(file_name, array_object)
    File.open(file_name, 'w') do |file|
      file.puts JSON.pretty_generate(array_object)
    end
  end
end
