class WinScreen

  attr_reader :background_assets, :coins

  def initialize
    @background_assets = [Image.new('./assets/win.png', z: 3, x: 150, y: 200),
      Image.new('./assets/trophy.png', z: 3, x: 555, y: 400),
      Image.new('./assets/trophy.png', z: 3, x: 20, y: 400),
      Text.new('Coins Collected', z: 4, color: 'red', size: 25, x: 360, y: 500 ),
      Text.new('Hit Enter to play again...', z: 4, color: 'red', size: 20, x:350, y: 600 )]
    @coins = [Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: 500, y: 450, height:40, width: 40, z: 10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: 440, y: 450, height:40, width: 40, z: 10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: 380, y: 450, height:40, width: 40, z: 10)]

  end

  def add_assets
    @background_assets.each do |asset|
      asset.add
    end

    @coins.each do |coin|
      coin.add
    end
  end

  def coin_animation
    @coins.each do |coin|
      coin.play
    end
  end

end