class Sounds
  
  def initialize
    @coin = Sound.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.wav')
    @game_over = Sound.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\game_over.wav')
    @death = Sound.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\death.wav')
    @next_level = Sound.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\next_level.wav')
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