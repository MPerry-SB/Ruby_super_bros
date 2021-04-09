class LevelThree
  
  attr_reader :platforms, :enemies, :coins, :images, :portal, :goal

  def initialize
    @platforms = [Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 0, y: Window.height - 10, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 200, y: Window.height - 10, height: 10, width: 250, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 525, y: Window.height - 10, height: 10, width: 40, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 650, y: Window.height - 10, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 100, y: Window.height - 90, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 70, y: Window.height - 160, height: 10, width: 70, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 35, y: Window.height - 230, height: 10, width: 35, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 700, y: Window.height - 250, height: 10, width: 75, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 550, y: Window.height - 160, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 350, y: Window.height - 160, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 200, y: Window.height - 230, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 150, y: Window.height - 300, height: 10, width: 40, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 0, y: Window.height - 350, height: 10, width: 100, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 175, y: Window.height - 400, height: 10, width: 50, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 320, y: Window.height - 350, height: 10, width: 30, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 410, y: Window.height - 430, height: 10, width: 50, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 550, y: Window.height - 470, height: 10, width: 60, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 610, y: Window.height - 550, height: 10, width: 60, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 200, y: Window.height - 620, height: 10, width: 200, z: 10)]
    @images = [Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\crab.png', x: 200, y: Window.height - 35, width: 50, height: 30,size: 20, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\jellyfish.png', x: 490, y: Window.height - 270, width: 175, height: 100, size: 20, z: 10),
      Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\jellyfish.png', x: 115, y: Window.height - 450, width: 175, height: 100, size: 20, z: 10)]
    @enemies = [Square.new(x: 200, y: Window.height - 25, size: 20, z: 0),
      Square.new(x: 490, y: Window.height - 270, size: 20, z: 0),
      Square.new(x: 115, y: Window.height - 450, size: 20, z: 0)]
    @coins = [Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 30, y: Window.height - 200, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 30, y: Window.height - 270, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: 540, y: Window.height - 270, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: 490, y: Window.height - 270, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: 440, y: Window.height - 270, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: 50, y: Window.height - 200, height:40, width: 40, z: 10),
      Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: 115, y: Window.height - 440, height:40, width: 40, z: 10)]
    @goal = Triangle.new(x1: Window.width - 60, x2: Window.width - 110, x3: Window.width - 10, y1: Window.height - 670, y2: Window.height - 620, y3: Window.height - 620, color: 'fuchsia', z: 0)
    @portal = Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\portal.png', clip_width: 32, clip_height: 48, height: 68, width: 52, time: 300, loop: true, x: Window.width - 100, y: Window.height - 680,  z: 10)
    @enemy_0_speed = 0
    @enemy_1_speed = 0
    @enemy_2_speed = 0

  end


  def add_assets
    @platforms.each do |platform|
      platform.add
    end

    @coins.each do |coin|
      coin.add
    end

    @enemies.each do |enemy|
      enemy.add
     end

    @images.each do |image|
      image.add
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
    if @enemies[0].x == 432
      @enemy_0_speed = -4
    elsif @enemies[0].x == 200
      @enemy_0_speed = 4
    end
  end

  def check_enemy_1_boundary
    if @enemies[1].y == Window.height - 270
      @enemy_1_speed = 2
    elsif @enemies[1].y == Window.height - 110
      @enemy_1_speed = -2
    end
  end

  def check_enemy_2_boundary
    if @enemies[2].y == Window.height - 450
      @enemy_2_speed = 2
    elsif @enemies[2].y == Window.height - 250
      @enemy_2_speed = -2
    end
  end

  def enemy_movement
    @enemies[0].x += @enemy_0_speed
    @images[0].x += @enemy_0_speed
    @enemies[1].y += @enemy_1_speed
    @images[1].y += @enemy_1_speed
    @enemies[2].y += @enemy_2_speed
    @images[2].y += @enemy_2_speed
  end

end
