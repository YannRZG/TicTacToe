require 'bundler'
Bundler.require



class Show
  def show_board(board) 
    puts "Voici le tableau de jeu :"  # Affiche le tableau 
    puts "  1 | 2 | 3 "
    puts "  ---------"
    puts "A #{board.cases['A1'].value} | #{board.cases['A2'].value} | #{board.cases['A3'].value} " #
    puts "  ---------"
    puts "B #{board.cases['B1'].value} | #{board.cases['B2'].value} | #{board.cases['B3'].value} " # Défini la position des cases
    puts "  ---------"
    puts "C #{board.cases['C1'].value} | #{board.cases['C2'].value} | #{board.cases['C3'].value} " #
  end
end
 