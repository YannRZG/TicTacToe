require_relative 'lib/boardcase'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'show'

require 'bundler'
Bundler.require



class App
  def perform
    puts "Bienvenue dans le jeu du MORPION !"
    puts ""

    # Demande le nom du Joueur 1
    puts "Joueur 1, entrez votre pseudo :"
    player1_name = gets.chomp

    # Demande le nom du Joueur 2
    puts "Joueur 2, entrez votre pseudo :"
    player2_name = gets.chomp

    # Crée les joueurs avec les noms fournis
    player1 = Player.new(player1_name, "X")
    player2 = Player.new(player2_name, "O")

    # Crée le jeu avec les joueurs
    game = Game.new(player1, player2)

    # Crée l'interface utilisateur
    show = Show.new
        

    while game.status == :ongoing # Affiche le tableau tant que la partie n'est pas terminée
        show.show_board(game.board) 
        game.turn        
    end
    show.show_board(game.board) # Montre le tableau de la victoire 
    game.game_end 
  end
end

App.new.perform
  