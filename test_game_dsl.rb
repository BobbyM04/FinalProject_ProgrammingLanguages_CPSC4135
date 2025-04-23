require_relative 'echoes_game_dsl'

data = EchoesGameDSL.build do
  
  # Player Characters: Character definitions, Roles, Stats, and Abilities (Role / HP / TP / Skills)
  character "Glenn" do 
    role "The Reluctant Warrior"
    hp 400
    tp 140
    skills ["All Break", "Cross Slash", "Heroic Energy", "Power Swing"]
  end

  character "Lenne" do
    role "The Spiritbound Warrior"
    hp 350
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
    hp 300
    tp 120
    skills ["Yoko Giri", "Kesa Giri", "Petal Storm", "X-Slash"]
  end

  # Location: City of Windwater
  location "City of Windwater" do
    description "A coastal city where the sea breeze carries whispers of old legends. Known for its vibrant markets, seafaring culture, and deep-rooted ties to the Monestary of Distant Shores."
    npcs ["Weathered Sailor", "Windwater Merchant", "Elderly Woman", "City Councilor"]

    # Dialogue (Quest: The Whispering Clues)
    dialogue "Weathered Sailor" do
      line "I swear on the tides of Windwater, I saw him that night---a cloaked figure, drifting along the shoreline under the pale moon. He moved as if carried by the sea itself, like a lost monk returning to where he once belonged."
    end

    dialogue "Glenn" do
      line "A lost monk? That vision sends chills down my spine. We need to learn more."
    end

    dialogue "Windwater Merchant" do
      line "Listen here, fair adventurers. Not long ago, something strange washed ashore in the Fields of Fortune---something never seen before."

      choice("Ask more about the strange object", "It glowed faintly, humming with energy. Some say it was a fragment of the old world...")
      choice("Dismiss it as superstition", "Suit yourself, but don't come crying when the ultimate Keeper stir from its slumber.")
    end

    dialogue "Sienna" do
      line "Something mysterious? That might be the key to understanding their disappearance."

      choice("Agree with Sienna", "Glenn: Sounds similar to what we heard down at the docks, Sienna.")
      choice("Ask Sienna to explain further", "Sienna: I'm sensing a pattern to these events we are being told about here in Windwater — strange appearances always happen near the coast.")
    end

    dialogue "Glenn" do
      line "Sounds similar to what we heard down at the docks, Sienna."
    end

    dialogue "Victor" do
      line "These gatherings? Interesting, even hinting at hidden secrets within the monastery itself. We must piece these clues together."

      choice("Ask about the secrets of the Monastery", "Victor: I've read old tomes back when I studied at Nhysa that speak of a relic hidden deep within the Monastery of Distant Shores.")
      choice("Change the topic", "Victor: Either way, we should press on—there's still much we don't know.")
    end

    dialogue "Elderly Woman" do
      line "Ah, I remember the old days... The stories of how the monks would gather in secret amidst the Flower Fields of the Verdant Hills, and even in the depths of the Elderbloom Woods."
      line "They whispered peace but also ruin, of a power so immense it could change everything."

      choice("Tell me more about the monks.", "It is said that the monks wore robes of blue and gold, and spoke in riddles. They were guardians of something. Something powerful.")
      choice("Do you know what happened to them?", "One day, they simply vanished. Some say they foresaw doom and fled. Others believe they became one with the forest of Alandia.")
      choice("Thanks for the story.", "Oh, of course dear. Just an old woman’s tale, perhaps. But maybe there’s truth in the whispers.")
    end

    dialogue "Victor" do
      line "These gatherings? Interesting, even hinting at hidden secrets within the monestary itself. We must piece these clues together."
      line "The monks were known to be the guardians of the Monestary of Distant Shores. If they vanished, it could mean something dire has happened or they knew something we didn't."
      line "We need to find out more about these gatherings and what they were protecting."
      line "We must piece the clues together. Maybe there is something in the Fields of Fortune that can help us understand what happened to the monks."
    end
  end

  # Location: Fields of Fortune
  location "Fields of Fortune" do
    description "A sprawling grassland dotted with ancient ruins and hidden treasures, once the site of great battles and now teeming with restless spirits and forgotten riches."
    npcs ["Nomadic Merchant", "Escanya Citizen"]

    # Dialogue (Quest: Echoes of the Fallen)
    dialogue "Glenn" do
      line "These ruins speak of a time when hope was sacrificed during a time of war, a time different then ours."
    end

    dialogue "Lenne" do
      line "Look at these inscriptions---they're worn, but they whisper of a decision made in desperation..."
      line "Some more than just retreat."
    end

    dialogue "Victor" do
      line "Listen to this... 'In the time of endless war, we cast aside our sanctuary to protect the future.'"
      line "These stone tablets aren't just memorials, they're warnings."
    
      choice("Why did the monks abandon the Monestary?",
             "The monks were forced to abandon the Monestary of Distant Shores because of what they were protecting.")
    
      line "It was not only a beacon of hope in the right hands, but in the wrong hands, a harbinger of ruin."
    
      choice("What do you mean by 'warnings'?",
             "Each carving on these stones tells a part of the story.")
    
      line "These ruins are not just remnants of the past; they are echoes of choices made in desperation."
      line "They're not just to honor the fallen — they're a desperate attempt to prevent history from repeating."
    end

    # Dialogue (NPC: Nomadic Merchant)
    dialogue "Nomadic Merchant" do
      line "Ah, brave adventurers of Eldoria! You seek the secrets of the Fields of Fortune? Beware, for they are guarded by the spirits of the past."
      line "But if you are willing to trade, I may have something that can aid you in your quest."
    end

    # Dialogue (NPC: Escanya Citizen)
    dialogue "Escanya Citizen" do
      line "The Fields of Fortune are said to have brought great prosperity to our ancestors, but now they are haunted by the echoes of their choices."
      line "I often hear whispers in the wind, tales of lost treasures and forgotten battles. If you seek fortune, tread carefully."
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
    description "Crystalline caverns hidden beneath the Fields of Fortune, guarded by ancient power and shimmering crystal guardians."
    npcs ["Nomadic Merchant", "Escanya Soldier"]

    # Dialogue (NPC: Nomadic Merchant)
    dialogue "Nomadic Merchant" do
      line "Ah, brave adventurers of Eldoria! You seek the secrets of the Fields of Fortune? Beware, for they are guarded by the spirits of the past."
      line "But if you are willing to trade, I may have something that can aid you in your quest through these shimmering caverns."
    end

    # Dialogue (NPC: Escanya Soldier)
    dialogue "Escanya Soldier" do
      line "The Glimmerstone Caverns are a treacherous place, filled with both beauty and danger. The crystals here hold ancient power, but they also attract the attention of those who would exploit it."
      line "Stay vigilant, for the shadows of the past linger in these caverns."

      choice("What kind of dangers lie ahead?", "The deeper you go, the stronger the crystal beasts become. Lumiscar, the Crystalline Warden, guards the final chamber with a wrath of gems.")
      choice("Can you help us?", "I can't join you, but take this — a shard of light crystal. It may illuminate paths others can't see.")
      choice("We're ready for anything.", "Then go with courage. And remember: not all that glimmers is treasure.")
    end

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

    # Dialogue (NPC: Ancient Figure)
    dialogue "Ancient Figure" do
      line "The Temple of the Purple Flame is a place of great power, but also great danger. The flame that burns here is said to be a remnant of the ancient war, a symbol of both hope and destruction."
      line "If you seek the truth, you must be prepared to face the shadows of the past."
    end

    # Dialogue (NPC: Purple Flame Bearer)
    dialogue "Purple Flame Bearer" do
      line "The flame that burns within this temple was once a beacon of hope, but it also holds the memories of those who fought and fell in the war. We must protect it at all costs."
      line "But beware, for the flame also attracts those who would seek to exploit its power."
    end

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
      weaknesses ["Light", "Wind"]
    end
  end

  # Location: Cradle of the Deep
  location "Cradle of the Deep" do
    description "Deep beneath Alandia lies a subterrenean world known as the Cradle of the Deep and the elemental sovereign, Aetherion. Once a guardian of balance, now it stands a test to any who dare challenge it."
    npcs ["Adventurer's Guild Guide", "Adventurer's Guild Soldier"]

    # Dialogue (NPC: Adventurer's Guild Guide)
    dialogue "Adventurer's Guild Guide" do
      line "The Cradle of the Deep is a place of great power, but also great danger. The elemental forces that dwell here are not to be trifled with."
      line "If you seek to challenge Aetherion, the Elemental Sovereign, you must be prepared to face the full fury of the elements."
      line "But if you succeed, the rewards will be beyond your wildest dreams."
    end

    # Dialogue (NPC: Adventurer's Guild Soldier)
    dialogue "Adventurer's Guild Soldier" do
      line "The Cradle of the Deep is a treacherous place, filled with elemental forces that can easily overwhelm the unprepared. We have lost many good people to the depths of this place."
      line "The elemental forces that dwell here are not to be trifled with, and the guardian of this realm is a force to be reckoned with."
      line "If you seek to challenge Aetherion, the Elemental Sovereign, be sure to gather your strength and prepare for the fight of your life."
    end

    # Enemies: Ultimate Boss (Cradle of the Deep 
    enemy "Aetherion, The Elemental Sovereign" do
      level 100
      hp 24000
      skills ["Elemental Cascade", "Primal Shift", "Harmony Unleashed", "Final Stand", "Infernal Maelstrom", "Tidal Eruption", "Elemental Barrage", "Harmony's Wrath"]
      weaknesses ["Earth", "Light"]
    end
  end

  # Location: Kortara Mountain Range
  location "Kortara Mountain Range" do
    description "In the heart of Alandia rises the Kortara Mountain Range. A mountain range with scars of war and hidden secrets of the Monestary of Distant Shores."
    npcs ["Adventurer's Guild Soldier", "Highridge Village Vendor"]
  end

  # Dialogue (NPC: Adventurer's Guild Soldier)
  dialogue "Adventurer's Guild Soldier" do
    line "The Kortara Mountain Range is a treacherous place, filled with hidden dangers and ancient secrets. The mountains themselves seem to whisper of the past, and the echoes of the war still linger in the air."
    line "If you seek to uncover the truth, you must be prepared to face the shadows of the past."
  end

  # Dialogue (NPC: Highridge Village Vendor)
  dialogue "Highridge Village Vendor" do
    line "The Kortara Mountain Range is a place of great beauty, but also great danger. The mountains are home to many secrets, and the echoes of the past can be heard in the winds that blow through the valleys."
    line "If you seek to uncover the truth, be sure to stock up on supplies before venturing into the mountains."
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

  # Dialogue (NPC: Dubious Figure)
  dialogue "Dubious Figure" do
    line "The Elderbloom Woods is the mystical forests of Alandia. The trees themselves seem to whisper secrets of the past."

    choice("What kind of secrets?", 
           "Some say the woods hold memories — echoes of the monks who once passed through. Others believe the forest itself speaks to those who listen.")

    choice("Have you seen anything unusual?", 
           "A flicker of gold between the trees... shadows moving where none should be. The forest watches, always.")

    choice("Can you guide us deeper into the woods?", 
           "Guide you? No, no... the Elderbloom chooses who walks its paths. I am but a humble wanderer, a mere echo of the past.")

    choice("Sounds like superstition.", 
           "Huehuehue. Perhaps. But superstition kept more than a few souls alive in these parts.")
  end

  # Dialogue (NPC: Elderbloom Citizen)
  dialogue "Elderbloom Citizen" do
    line "The quiet village of Elderbloom is named after the forest in which it resides. The woods are home to many secrets, and the echoes of the past can be heard in the rustling leaves."
    line "If you seek to uncover the truth, be sure to tread lightly, for the woods are alive with magic and mystery."
  end

  # Location: Rainy City of Ironreach
  location "Rainy City of Ironreach" do
    description "A city in the north of Alandia where endless rain falls, but sunlight is far and few between."
    npcs ["Ironreach Citizen", "Ironreach Merchant"]
  end

  # Dialogue (NPC: Ironreach Citizen)
  dialogue "Ironreach Citizen" do
    line "The Rainy City of Ironreach hardly ever sees any sunlight. The rain is a constant companion, and the city is shrouded in a veil of mist and mystery."
  end

  # Dialogue (NPC: Ironreach Merchant)
  dialogue "Ironreach Merchant" do
    line "Welcome to the Rainy City of Ironreach! We may not have the sun, but we have plenty of goods to keep you warm and dry."
  end

  # Location: Flower Fields of the Verdant Hills
  location "Flower Fields of the Verdant Hills" do
    description "Rolling meadows blanketed in vibrant wildflowers, where the wind carries whispers of forgotten memories."
    npcs ["Wandering Botanist", "Shepherd of the Verdant Hills"]
  end

  # Dialogue (NPC: Wandering Botanist)
  dialogue "Wandering Botanist" do
    line "The Flower Fields of the Verdant Hills are a sight to behold, but they also carry the weight of the past."
  end

  # Dialogue (NPC: Shepherd of the Verdant Hills)
  dialogue "Shepherd of the Verdant Hills" do
    line "I just live here in the Flower Fields of the Verdant Hills, now retired from my days of adventuring."
  end

  # Location: Kingdom of Virelia
  location "Kingdom of Virelia" do
    description "A radiant and flourishing kingdom in the southeast corner of Alandia. Though peaceful in appearance, its halls echo with political intrigue and the burdens of ancient pacts.."
    npcs ["Royal Guard Captain", "High Council Leader Elowen", "Virelia Market Vendor"]
  end

  # Dialogue (NPC: Royal Guard Captain)
  dialogue "Royal Guard Captain" do
    line "We are the Royal Guard of the Kingdom of Virelia. We protect the kingdom and its people from any threats that may arise."
  end

  # Dialogue (NPC: High Council Leader Elowen)
  dialogue "High Council Leader Elowen" do
    line "As the High Council Leader of Virelia, I am responsible for the well-being of our kingdom and its people."
  end

  # Dialogue (NPC: Virelia Market Vendor)
  dialogue "Virelia Market Vendor" do
    line "Welcome to the Kingdom of Virelia! We have a wide variety of goods for sale, from rare herbs to enchanted trinkets."
  end

  # Location: Monastery of Distant Shores (Final Story Area w/ Final Boss)
  location "Monastery of Distant Shores" do
    description "An ancient, overgrown sanctuary nestled on a remote island off Alandia's coast. Once a place of peace and powerful magic, it now stands abandoned, echoing with the secrets of the war and the vanished monks who once protected a great relic."
    npcs ["Echoing Spirit", "Faded Monk Figure", "Aeon Tyrus, Keeper of the Eternal Watch"]

    # Dialogue (Quest: The Keeper's Legacy)
    dialogue "Aeon Tyrus, Keeper of the Eternal Watch" do
      line "You have come to the Monestary of Distant Shores, a place where the echoes of the past still linger. The monks who once protected this sanctuary have vanished, leaving behind only whispers of their choices."
      line "I am Aeon Tyrus, the Keeper of the Eternal Watch. I guard the secrets of this place, and I will not let you pass without facing the truth of your own choices."
    end

    # Dialogue (NPC: Echoing Spirit)
    dialogue "Echoing Spirit" do
      line "Ah, welcome to the Monestary of Distant Shores! This place was once a sanctuary of peace and knowledge, but now it is a shadow of its former self."
    end

    # Dialogue (NPC: Faded Monk Figure)
    dialogue "Faded Monk Figure" do
      line "The Monestary of Distant Shores... Once a place of peace and knowledge, but only now a sanctuary guarded by the Keeper"
      line "The monks who once protected this place have vanished, leaving behind only echoes of their wisdom and the burden of their choices."
    end

    # Enemies: Final Boss (Monestary of Distant Shores
    enemy "Aeon Tyrus, Keeper of the Eternal Watch" do
      level 100
      hp 20000
      skills ["Eternal Judgment", "Heavenly Reckoning", "Judgment Strike", "Penance Flame"]
      weaknesses ["Water", "Dark"]
    end
  end
end

data.export_to_json("echoes_game_data.json")
puts "Game data exported to echoes_game_data.json"