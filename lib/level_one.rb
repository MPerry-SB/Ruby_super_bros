class LevelOne

  attr_reader :platforms, :coins, :enemies, :goal, :portal

  def initialize
    @platforms = [Image.new('./assets/wood.png', x: 0, y: Window.height - 10, height: 10, z: 3, width: Window.width),
      Image.new('./assets/wood.png', x: (Window.width - 200) / 2, y: Window.height - 85, height: 10, z: 3, width: 200),
      Image.new('./assets/wood.png', x: 0, y: Window.height - 165, height: 10, z: 3, width: 350),
      Image.new('./assets/wood.png', x: Window.width - 350, y: Window.height - 175, height: 10, z: 3, width: 350),
      Image.new('./assets/wood.png', x: (Window.width - 200) / 2, y: Window.height - 250, height: 10, z: 3, width: 200),
      Image.new('./assets/wood.png', x: 300, y: Window.height - 325, height: 10, z: 3, width: 100),
      Image.new('./assets/wood.png', x: 150, y: Window.height - 400, height: 10, z: 3, width: 100),
      Image.new('./assets/wood.png', x: 0, y: Window.height - 475, height: 10, z: 3, width: 100)]
    @coins = [Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 250, y: Window.height - 285, height: 40, width: 40, z:10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 200, y: Window.height - 285, height: 40, width: 40, z:10),
      Sprite.new('./assets/coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 150, y: Window.height - 285, height: 40, width: 40, z:10)]
    @images = [Image.new('./assets/crab.png', x: Window.width - 350, y: (Window.height - 184) - 15, width: 50, height: 30, size: 20, z: 10)]
    @enemies = [Square.new(x: Window.width - 350, y: (Window.height - 174) - 15, size: 20, z: 0)]
    @goal = Triangle.new(x1: 25, x2: -15, x3: 65, y1: Window.height - 525, y2: Window.height - 475, y3: Window.height - 475, color: 'fuchsia', z: 0)
    @portal = Sprite.new('./assets/portal.png', clip_width: 32, clip_height: 48, height: 68, width: 52, time: 300, loop: true, x: 8, y: 165,  z: 10)
    @enemy_speed = 0
  end

  def add_assets
    @platforms.each do |platform|
      platform.add
    end

    @coins.each do |coin|
      coin.add
    end

    @images.each do |image|
      image.add
    end

    @enemies.each do |enemy|
      enemy.add
     end

    @goal.add

    @portal.add
  end

  def coin_animation
    @coins.each do |coin|
      coin.play
    end
  end

  def check_enemy_0_boundary
    if @enemies[0].x == Window.width - 14
      @enemy_speed = -2
    elsif @enemies[0].x == Window.width - 350
      @enemy_speed = 2
    end
  end

  def enemy_movement
    @enemies[0].x += @enemy_speed
    @images[0].x += @enemy_speed
  end

end
