require 'bundler'
Bundler.require


class Player # Création de l'objet player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def to_s
    @name
  end
end