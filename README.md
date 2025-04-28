# Echoes of the Seventh Era: Game DSL

Echoes Game DSL is a domain-specific language (DSL) written in Ruby for creating and managing game data for the 16-bit retro-style game, Echoes of the Seventh Era (RPG). It allows developers to define characters, locations, enemies, and dialogues in a structured and intuitive way.

## Features

- **Define Characters**: Create characters with roles, stats, and skills.
- **Create Locations**: Add locations with descriptions, NPCs, and enemies.
- **Add Enemies**: Define enemies with levels, stats, skills, and weaknesses.
- **Build Dialogues**: Create rich dialogues with NPCs, including lines and choices.
- **Export to JSON**: Export the game data to a JSON file for further use.

## Installation

1. Clone this repository or download the files.
2. Ensure you have Ruby installed on your system.
3. Require the `echoes_game_dsl.rb` file in your project.

## Usage

Here is an example of how to use the DSL:

```ruby
require_relative 'echoes_game_dsl'

data = EchoesGameDSL.build do
  character "Glenn" do
    role "The Reluctant Warrior"
    hp 400
    tp 140
    skills ["All Break", "Cross Slash", "Heroic Energy", "Power Swing"]
  end

  location "City of Windwater" do
    description "A coastal city where the sea breeze carries whispers of old legends."
    npcs ["Weathered Sailor", "Windwater Merchant"]

    dialogue "Weathered Sailor" do
      line "I saw a cloaked figure drifting along the shoreline under the pale moon."
    end

    enemy "Fortune Pigear" do
      level 1
      hp 100
      skills ["Bite", "Charge"]
      weaknesses ["Fire", "Earth"]
    end
  end
end

# Export the data to a JSON file
data.export_to_json('game_data.json')
