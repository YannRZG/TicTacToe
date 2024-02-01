require 'bundler'
Bundler.require

class Game
    attr_accessor :current_player, :status, :board, :players
  
    def initialize(player1_name, player2_name)
      @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
      @board = Board.new
      @status = :ongoing
      @current_player = @players[0]
    end    
  
    def turn
      board.play_turn(current_player)
      #display_board
      check_game_status
      switch_turn unless game_over?
            
    end
    
    def game_over?
        status == :win || status == :draw
        
    end
  
    def new_round
      @board = Board.new
      @status = :ongoing
      @current_player = @players[0]
    end
  
    def game_end
      puts "Partie terminée !"
      if status == :draw
        puts "Égalité !"
        else
            puts "#{current_player.name} gagne !"
        end
    end
        
            
            

  
    #private
  
    def display_board
      puts "  1 | 2 | 3 "
      puts "  ---------"
      puts "A #{board.cases['A1'].value} | #{board.cases['A2'].value} | #{board.cases['A3'].value} "
      puts "  ---------"
      puts "B #{board.cases['B1'].value} | #{board.cases['B2'].value} | #{board.cases['B3'].value} "
      puts "  ---------"
      puts "C #{board.cases['C1'].value} | #{board.cases['C2'].value} | #{board.cases['C3'].value} "
    end
  
    def check_game_status
      if board.victory?
        @status = :win
      elsif board_full?
        @status = :draw
      end
    end
  
    def board_full?
      
      board.cases.values.all? { |board_case| board_case.value != " " }
    end
  
    def switch_turn
      @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
    end
  end