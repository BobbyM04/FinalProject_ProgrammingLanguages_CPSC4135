require 'json'

module EchoesGameDSL
  class GameData
    attr_accessor :characters, :enemies, :locations, :dialogues

    def initialize
      @characters = []
      @enemies = []
      @locations = []
      @dialogues = []
    end

    def character(name, &block)
      builder = CharacterBuilder.new(name)
      builder.instance_eval(&block)
      @characters << builder.to_h
    end

    def location(name, &block)
      builder = LocationBuilder.new(name)
      builder.instance_eval(&block)
      @locations << builder.to_h
    end

    def dialogue(npc_name, &block)
      builder = DialogueBuilder.new(npc_name)
      builder.instance_eval(&block)
      @dialogues << builder.to_h
    end

    def export_to_json(file)
      File.write(file, JSON.pretty_generate({
        characters: @characters,
        enemies: @enemies,
        locations: @locations,
        dialogues: @dialogues,
      }))
    end
  end

  class CharacterBuilder
    def initialize(name)
      @data = { name: name }
    end

    def role(val); @data[:role] = val; end
    def hp(val); @data[:hp] = val; end
    def tp(val); @data[:tp] = val; end
    def skills(arr); @data[:skills] = arr; end
    def to_h; @data; end
  end

  class EnemyBuilder
    def initialize(name)
      @data = { name: name }
    end

    def level(val); @data[:level] = val; end
    def hp(val); @data[:hp] = val; end
    def skills(arr); @data[:skills] = arr; end
    def weaknesses(arr); @data[:weaknesses] = arr; end
    def location(val); @data[:location] = val; end
    def to_h; @data; end
  end

  class LocationBuilder
    def initialize(name)
      @data = { name: name, enemies: [], npcs: [], dialogue: [] }
    end

    def description(val); @data[:description] = val; end
    def npcs(arr); @data[:npcs] = arr; end

    def enemy(name, &block)
      builder = EnemyBuilder.new(name)
      builder.instance_eval(&block)
      @data[:enemies] ||= []
      @data[:enemies] << builder.to_h
    end
    
    def dialogue(npc_name, &block)
      builder = DialogueBuilder.new(npc_name)
      builder.instance_eval(&block)
      @data[:dialogues] ||= []
      @data[:dialogues] << builder.to_h
    end

    def to_h; @data; end
  end

  class DialogueBuilder
    def initialize(npc_name)
      @data = { npc: npc_name, lines: [], choices: {} }
    end
  
    def line(text)
      @data[:lines] << text
    end
  
    def choice(option, result)
      @data[:choices][option] = result
    end
  
    def to_h
      @data
    end
  end
      
  def self.build(&block)
    dsl = GameData.new
    dsl.instance_eval(&block)
    dsl
  end
end