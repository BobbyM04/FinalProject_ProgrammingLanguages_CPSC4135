require_relative 'echoes_game_dsl'

data = EchoesGameDSL.buid do
  # Player Characters: Character definitions, Roles, Stats, and Abilities
  character "Glenn" do 
    role "The Reluctant Warrior"
    hp 400
    tp 140
    skills ["All Break", "Cross Slash", "Heroic Energy", "Power Swing"]
  end

  character "Lenne" do
    role "The Spiritbound Warrior"
    hp 360
    tp 200
    skills ["Heaven's Tear", "Wind Jump", "Water Jump", "Third Eye"]
  end

  character "Victor" do
    role "The Scholar of Nhysa"
    hp 360
    tp 240
    skills ["Heroic Hymn", "Valor Minuet", "Heal all", "Heal"]
  end

  character "Sienna" do
    role "The Wandering Blade"
    hp 320
    hp 120
    skills ["Yoko Giri", "Kesa Giri", "Petal Storm", "X-Slash"]
  end

  # Location: City of Windwater
  location "City of Windwater" do
    description "A coastal city where the sea breeze carries whispers of old legends. Known for its vibrant markets, seafaring culture, and deep-rooted ties to the Monestary of Distant Shores."
    npcs ["Weathered Sailor", "Windwater Merchant", "Elderly Woman", "City Councilor"]

    # Dialogue (Quest: The Whispering Clues)
    dialogue "Weathered Sailor" do
      line "I swear on the tides of Windwater, I saw him that night---a cloaked figure, drifting along the shoreline under the pale moon. He moved as if carried by the sea itself, like a lost monk returning to where he once belonged."

      dialogue "Glenn" do
        line "A lost monk? That vision sends chills down my spine. We need to learn more."
      end
    end

    dialogue "Windwater Merchant" do
      line "Listen here, fair adventurers. Not long ago, something strange washed ashore in the Fields of Fortune---something never seen before."

      dialogue "Sienna" do
        line "Something mysterious? That might be the key to understanding their disappearance."
      end

      dialogue "Glenn" do
        line "Sounds similar to what we heard down at the docks, Sienna."\
      end
    end

    dialogue "Elderly Woman" do
      line "Ah, I remember the old days... The stories of how the monks would gather in secret amidst the Flower Fields of the Verdant Hills, and even in the depths of the Elderbloom Woods."
      line "They whispered peace but also ruin, of a power so immense it could change everything."

      dialogue "Victor" do
        line "These gatherings? Interesting, even hinting at hidden secrets within the monestary itself. We must piece these clues together."
    end

  # Location: Fields of Fortune
  location "Fields of Fortune" do
    description "A sprawling grassland dotted with ancient ruins and hidden treasures, once the site of great battles and now teeming with restless spirits and forgotten riches."
    npcs ["Nomadic Merchant", "Escanya Citizen"]

    # Dialogue (Quest: Echoes of the Fallen)
    dialogue "Glenn" do
      line "These ruins speak of a time when hope was sacrificed during a time of war, a time different then ours."

      dialogue "Lenne" do
        line "Look at these inscriptions---they're worn, but they whisper of a decision made in desperation..."
        line "Some more than just retreat."
      end

      dialogue "Victor" do
        line "Listen to this... 'In the time of endless war, we cast aside our sanctuary to protect the future.'"
        line "These stone tablets aren't just memorials, they're warnings."
        line "The monks were forced to abandon the Monestary of Distant Shores because of what they were protecting."
        line "It was not only a beacon of hope in the right hands, but in the wrong hands, a harbinger of ruin."
      end
    end

    # Enemies: General (Fields of Fortune)
    enemy "Fortune Pigear" do
      level 1
      hp 100
      skills ["Bite", "Charge"]
      weaknesses ["Fire", "Earth"]
    end

    enemy "Crab of Fortune" do
      level 1
      hp 120
      skills ["Crab Shell", "Fortune Claw"]
      weaknesses ["Water", "Wind"]
    end

    # Enemies: Unique (Fields of Fortune)
    enemy "Golden Gryphon" do
      level 10
      hp 1000
      skills ["Wingstorm", "Treasure Roar"]
      weaknesses ["Dark", "Wind"]
    end

    enemy "Gemhorn Antelope" do
      level 10
      hp 1000
      skills ["Gem Shard Barrage", "Prismatic Shield"]
      weaknesses ["Wind", "Earth"]
    end
  end

  # Location: Glimmerstone Caverns
  location "Glimmerstone Caverns" do
    description "Crystalline caverns hidden beneath the Fields of Fortune."
    npcs ["Nomadic Merchant", "Escanya Soldier"]

    # Enemies: General (Glimmerstone Caverns)
    enemy "Robber" do
      level 2
      hp 100
      skills ["Slash"]
      weaknesses ["Dark", "Earth"]
     end

    enemy "Goblin Shaman" do
      level 3
      hp 140
      skills ["Shaman Blaze"]
      weaknesses ["Light", "Earth"]
    end

    enemy "Goblin Warrior" do
      level 3
      hp 200
      skills ["Goblin Gibberish", "Raging Hammer"]
      weaknesses ["Light", "Earth"]
    end

    # Enemies: Boss (Glimmerstone Caverns)
    enemy "Lumiscar, The Crystalline Warden" do
      level 5
      hp 1200
      skills ["Crystal Barrage", "Gem Pulse", "Color Phases: (Blue, Red, Green)"]
      weaknesses ["Earth", "Water"]
    end
  end

  # Location: Temple of the Purple Flame
  location "Temple of the Purple Flame" do
    description "Ancient temple in the north of the Fields of Fortune. Here, violet fire eternally burns in defiance of time."
    npcs ["Ancient Figure", "Purple Flame Bearer"]

    # Enemies: General (Temple of the Purple Flame)
    enemy "Ghost" do
      level 8
      hp 200
      skills ["Ghostly Whispers"]
      weaknesses ["Light"]
     end

    enemy "Zombie" do
      level 8
      hp 200
      skills ["Zombie Swipe"]
      weaknesses ["Light", "Earth"]
    end

    # Enemies: Boss (Temple of the Purple Flame)
    enemy "Dream Weaver" do
      level 10
      hp 2200
      skills ["Reality Tear", "Ethereal Flame"]
      weaknesses ["Light"]
    end
  end

  # Location: Cradle of the Deep
  location "Cradle of the Deep" do
    description "Deep beneath Alandia lies a subterrenean world known as the Cradle of the Deep and the elemental sovereign, Aetherion. Once a guardian of balance, now it stands a test to any who dare challenge it."
    npcs ["Adventurer's Guild Guide", "Adventurer's Guild Soldier"]

    # Enemies: Boss (Cradle of the Deep (Ultimate Boss))
    enemy "Aetherion, The Elemental Sovereign" do
      level 100
      hp 11500
      skills ["Elemental Cascade", "Primal Shift", "Harmony Unleashed", "Final Stand", "Infernal Maelstrom", "Tidal Eruption", "Elemental Barrage", "Harmony's Wrath"]
      weaknesses ["Earth", "Light"]
    end
  end

  # Location: Kortara Mountain Range
  location "Kortara Mountain Range" do
    description "In the heart of Alandia rises the Kortara Mountain Range. A mountain range with scars of war and hidden secrets of the Monestary of Distant Shores."
    npcs ["Adventurer's Guild Soldier", "Highridge Village Vendor"]
  end

  # Location: Mount Kortara (Kortara Mountain Range)
  location "Mount Kortara" do
    description "The tallest mountain peak in all of Alandia. Here resides the Iceborne Sovereign, Vynthrax, a legendary ice dragon who challanges any who dare to step foot into its domain."

    # Enemies: Boss (Mount Kortara)
    enemy "Vynthrax, The Iceborne Sovereign" do
      level 15
      hp 2800
      skills ["Frozen Wrath", "Frost Breath", "Rage of the Glacier"]
      weaknesses ["Fire", "Dark"]
    end
  end

  # Location: Elderbloom Woods
  location "Elderbloom Woods" do
    description "A mystical, glowing forest where ancient trees whisper secrets of the past. The air is thick with enchantment, and nature itself guards long-forgotten truths."
    npcs ["Dubious Figure", "Elderbloom Citizen"]
  end

  # Location: Rainy City of Ironreach
  location "Rainy City of Ironreach" do
    description "A city in the north of Alandia where endless rain falls, but sunlight is far and few between."
    npcs ["Ironreach Citizen", "Ironreach Merchant"]
  end

  # Location: Flower Fields of the Verdant Hills
  location "Flower Fields of the Verdant Hills" do
    description "Rolling meadows blanketed in vibrant wildflowers, where the wind carries whispers of forgotten memories."
    npcs ["Wandering Botanist", "Shepherd of the Verdant Hills"]
  end

  # Location: Kingdom of Virelia
  location "Kingdom of Virelia" do
    description "A radiant and flourishing kingdom in the southeast corner of Alandia. Though peaceful in appearance, its halls echo with political intrigue and the burdens of ancient pacts.."
    npcs ["Royal Guard Captain", "High Council Leader Elowen, Virelia Market Vendor"]
  end

  # Location: Monestary of Distant Shores (Final Story Area w/ Final Boss)
  location "Monestary of Distant Shores" do
    description "An ancient, overgrown sanctuary nestled on a remote island off Alandia's coast. Once a place of peace and powerful magic, it now stands abandoned, echoing with the secrets of the war and the vanished monks who once protected a great relic."
    npcs ["Echoing Spirit", "Faded Monk Figure"]

    # Enemies: Boss (Monestary of Distant Shores (Final Boss))
    enemy "Aeon Tyrus, Keeper of the Eternal Watch" do
      level 100
      hp 12000
      skills ["Eternal Judgment", "Heavenly Reckoning", "Judgment Strike", "Penance Flame"]
      weaknesses ["Water", "Dark"]
    end
  end