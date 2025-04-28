require 'json'

# Main module for the Echoes of the Seventh Era: Game DSL
module EchoesGameDSL
  # Class to store and manage all game data (characters, enemies, locations, dialogues)
  class GameData
    attr_accessor :characters, :enemies, :locations, :dialogues

    def initialize
      @characters = []
      @enemies = []
      @locations = []
      @dialogues = []
    end

    # Defines a character and adds it to the character list
    def character(name, &block)
      builder = CharacterBuilder.new(name)
      builder.instance_eval(&block)
      @characters << builder.to_h
    end

    # Defines a location and adds it to the location list
    def location(name, &block)
      builder = LocationBuilder.new(name)
      builder.instance_eval(&block)
      @locations << builder.to_h
    end

    # Defines a dialogue and adds it to the dialogue list
    def dialogue(npc_name, &block)
      builder = DialogueBuilder.new(npc_name)
      builder.instance_eval(&block)
      @dialogues << builder.to_h
    end

    # Exports the game data to a JSON file
    def export_to_json(file)
      File.write(file, JSON.pretty_generate({
        characters: @characters,
        enemies: @enemies,
        locations: @locations,
        dialogues: @dialogues,
      }))
    end
  end

  # Builder class for creating character data
  class CharacterBuilder
    def initialize(name)
      @data = { name: name }
    end

    # Defines the role of the character
    def role(val); @data[:role] = val; end
    # Defines the HP (hit points) of the character
    def hp(val); @data[:hp] = val; end
    # Defines the TP (tech points) of the character
    def tp(val); @data[:tp] = val; end
    # Defines a list of skills the character knows
    def skills(arr); @data[:skills] = arr; end
    # Returns the built character as a hash
    def to_h; @data; end
  end

  # Builder class for creating enemy data
  class EnemyBuilder
    def initialize(name)
      @data = { name: name }
    end

    # Defines the level of the enemy
    def level(val); @data[:level] = val; end
    # Defines the HP (hit points) of the enemy
    def hp(val); @data[:hp] = val; end
    # Defines a list of skills the enemy uses
    def skills(arr); @data[:skills] = arr; end
    # Defines a list of weaknesses for the enemy
    def weaknesses(arr); @data[:weaknesses] = arr; end
    # Defines the location where the enemy is found
    def location(val); @data[:location] = val; end
    # Returns the built enemy as a hash
    def to_h; @data; end
  end

  # Builder class for creating location data
  class LocationBuilder
    def initialize(name)
      @data = { name: name, enemies: [], npcs: [], dialogue: [] }
    end

    # Provides a description of the location
    def description(val); @data[:description] = val; end
    def npcs(arr); @data[:npcs] = arr; end

    # Defines an enemy that appears in this location
    def enemy(name, &block)
      builder = EnemyBuilder.new(name)
      builder.instance_eval(&block)
      @data[:enemies] ||= []
      @data[:enemies] << builder.to_h
    end
    
    # Defines a dialogue associated with an NPC in this location
    def dialogue(npc_name, &block)
      builder = DialogueBuilder.new(npc_name)
      builder.instance_eval(&block)
      @data[:dialogues] ||= []
      @data[:dialogues] << builder.to_h
    end

    # Returns the built location as a hash
    def to_h; @data; end
  end

  # Builder class for creating dialogue data
  class DialogueBuilder
    def initialize(npc_name)
      @data = { npc: npc_name, lines: [], choices: {} }
    end
  
    # Adds a line of dialogue spoken by the NPC (or player character)
    def line(text)
      @data[:lines] << text
    end
  
    # Adds a player choice and the corresponding result
    def choice(option, result)
      @data[:choices][option] = result
    end
  
    # Returns the built dialogue as a hash
    def to_h
      @data
    end
  end
      
  # Entry point for building game data using the DSL
  def self.build(&block)
    dsl = GameData.new
    dsl.instance_eval(&block)
    dsl
  end
end