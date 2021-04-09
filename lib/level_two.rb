class LevelTwo

    attr_reader :platforms, :coins, :goal, :images, :portal
  
    def initialize
      @platforms = [ Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 150, y: Window.height - 85, height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: (Window.width - 190) / 2, y: Window.height - 425, height: 10, z:6 , width:40),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 0, y: Window.height - 500, height: 10, z:6, width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: (Window.width - 350), y: Window.height - 175, height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 125, y: Window.height - 250, height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: (Window.width - 625), y: Window.height - 150, height: 10, z:6 , width:40),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 0, y: Window.height - 10, height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 150, y: Window.height - 210, height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: (Window.width - 650), y: Window.height - 335, height: 10, z:6 , width:40),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: (Window.width - 300), y: Window.height - 300, height: 10, z:6 , width:77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: Window.width - 470, y: Window.height - 275, height: 10, z:6 , width: 40),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 750, y: Window.height - 30,  height: 10, z:6 , width: 77),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 150, y: Window.height - 420, height: 10, z:6 , width: 40),
        Image.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\wood.png', x: 650, y: Window.height - 100, height: 10, z:6 , width:40)]       
      @coins = [Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 250, y: Window.height - 285, height: 40, width: 40, z: 5),
        Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 200, y: Window.height - 285, height: 40, width: 40, z: 5),
        Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\coin.png', clip_width: 84, time: 300, loop: true, x: Window.width - 150, y: Window.height - 285, height: 40, width: 40, z: 5)]
      @goal = Triangle.new(x1: 40, x2: 10, x3: 70, y1: Window.height - 550, y2: Window.height - 500, y3: Window.height - 500, color: 'fuchsia', z: 0)    
      @portal = Sprite.new('C:\Users\Desktop-01\Documents\VS_CODE_Projects\Super_Ruby_Bros\assets\portal.png', clip_width: 32, clip_height: 48, height: 68, width: 52, time: 300, loop: true, x: 25, y: 135,  z: 10)
      @enemy_speed = 0
    end
  
    def add_assets
      @platforms.each do |platform|
        platform.add
      end

      @coins.each do |coin|
        coin.add
      end

      @goal.add

      @portal.add
    end

    def coin_animation
      @coins.each do |coin|
        coin.play
      end
    end

    def enemy_movement
      nil
    end
  
  
  end
  