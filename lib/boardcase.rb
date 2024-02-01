require 'bundler'
Bundler.require



class BoardCase
  attr_accessor :value, :id

  def initialize(id)
    @value = " "
    @id = id
  end
end