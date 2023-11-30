require 'date'
require './classes/author'
require './classes/game'
require_relative 'operations/music_operations'
require 'json'

# a method to load data from the json files
def load_from_json(file_name)
  if File.exist?(file_name)
    json_data = File.read(file_name)
    JSON.parse(json_data)
  else
    []
  end
end

load_music_data_from_file = load_from_json('music.json')
load_genre_data_from_file = load_from_json('genre.json')
items = []
music = load_music_data_from_file
genres = load_genre_data_from_file

music_operations = MusicOperations.new(music, genres)

def list_authors(items)
  puts 'List of all authors:'
  authors = items.select { |item| item.is_a?(Game) }.map(&:author)
  puts 'Author list is empty, please add a game first.' if authors.empty?
  authors.each do |author|
    puts "Author ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
  end
end

def list_games(items)
  puts 'List of all games:'
  games = list_items(Game, items)
  puts 'List of games is empty, please add a new game.' if games.empty?
  games.each_with_index { |game, index| puts "Game ID: #{index + 1}, Title: #{game.title}" }
end

def add_game(items)
  puts 'Enter Game Title:'
  title = gets.chomp

  puts 'Is it Multiplayer? (true/false):'
  multiplayer = gets.chomp == 'true'

  puts 'Enter the Publish Date (YYYY-MM-DD):'
  publish_date = Date.parse(gets.chomp)

  puts 'Enter the Last Played Date (YYYY-MM-DD):'
  last_played_at = Date.parse(gets.chomp)

  puts 'Enter the Author First Name:'
  first_name = gets.chomp

  puts 'Enter the Author Last Name:'
  last_name = gets.chomp

  author = Author.new(items.size + 1, first_name, last_name)
  new_game = Game.new(title, publish_date, multiplayer, last_played_at, author)

  add_item(new_game, items)
end

puts 'Welcome to the Cataloge of my things'

def print_options
  puts 'Options:'
  puts '1. List of games'
  puts '2. List all authors'
  puts '3. Add a game'
  puts '4. List all music album'
  puts '5. Add music album'
  puts '6. List all genres'
  puts '7. Create a new genre'
  puts '8. Quit'
end

def exit_application
  puts ''
  puts 'Exiting the application,thank you!'
  puts ''
end

loop do
  print_options
  print 'Enter your choice: '
  choice = gets.chomp.to_i
  case choice
  when 1
    list_games(items)
  when 2
    list_authors(items)
  when 3
    add_game(items)
  when 4
    music_operations.list_all_music_albums
  when 5
    music_operations.add_music_album
  when 6
    music_operations.list_all_genres
  when 7
    music_operations.create_genre
  when 8
    exit_application
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
