class Sounds
  
  def initialize
    @coin = Sound.new('./assets/coin.wav')
    @game_over = Sound.new('./assets/game_over.wav')
    @death = Sound.new('./assets/death.wav')
    @next_level = Sound.new('./assets/next_level.wav')
  end

  def coin
    @coin.play
  end

  def game_over
    @game_over.play
  end

  def death
    @death.play
  end

  def next_level
    @next_level.play
  end

end