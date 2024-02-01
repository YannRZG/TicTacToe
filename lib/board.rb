require 'bundler'
Bundler.require



class Board
  attr_accessor :cases

  def initialize
    @cases = create_board
  end

  def play_turn(player) # Indique si joueur 1 ou joueur 2 doit jouer 
    puts "#{player.name}, Où voulez-vous jouer ? (A1, B2, C3, etc.)"
    choice = gets.chomp.upcase

    if valid_move?(choice) 
      @cases[choice].value = player.symbol #si la case visée est libre
    else
      puts "Choisissez une case vide !" # si la case visée est déja prise 
      play_turn(player)
    end
  end

  
    def victory?
        victory_combinations = [
          [0, 1, 2], [3, 4, 5], [6, 7, 8],
          [0, 3, 6], [1, 4, 7], [2, 5, 8],
          [6, 4, 2], [0, 4, 8]
        ]
    
        victory_combinations.each do |combo|
          values = combo.map { |index| @cases[@cases.keys[index]].value }
          return true if values.uniq.length == 1 && values[0] != " "
        end
    
        false
    end
    

  #private

  def create_board
    board = {}
    ('A'..'C').each do |col|
      (1..3).each do |row|
        position = "#{col}#{row}"
        board[position] = BoardCase.new(position)
      end
    end
    board
  end

  def valid_move?(choice)
    @cases[choice].value == " "
  end
end