String effectData = """0:	 No Effect
1:	 Plus or Minus Attack Damage - Value sets increase in damage points
2:	 Plus or Minus Movement Speed - Value sets percent increase
3:	 Plus or Minus Attack Speed - Value sets percent increase
4:	 Plus or Minus Max Health - Value sets increase in health points
5:	 Plus or Minus Armor - Value sets increase in armor points
6:	 Plus or Minus Knockback Resistance - Value sets percent increase
7:	 Blindness
8:	 Dolphin's Grace
9:	 Fire Resistance
10:	 Glowing
11:	 Invisibility
12:	 Jump Boost - Value sets amplifier (max 4)
13:	 Levitation - Value sets amplifier (max 4)
14:	 Nausea
15:	 Night Vision
16:	 Poison - Value sets amplifier (max 4)
17:	 Regeneration - Value sets amplifier (max 4)
18:	 Slow-Falling
19:	 Water-Breathing
20:	 Wither - Value sets amplifier (max 4)
21:	 Hunger - Value sets amplifier (max 4)
22:	 Cleanse Blindness
23:	 Cleanse Fire Resistance
24:	 Cleanse Levitation
25:	 Cleanse Nausea
26:	 Cleanse Poison
27:	 Cleanse Wither
28:	 Cleanse Absorption
29:	 Cleanse Hunger
30:	*Item Falls out of Player's Hand
31:	*Item Breaks
32:	*Item Regains Full Durability
33:	*Set Trigger (See Condition #33)
34:	*Item becomes Primed - Value sets number of ticks it will stay primed for (See Condition #34)
35:	*Item becomes Activated (See Condition #35)
36:	*Set Fire to Ground Below Player - Value sets radius (max 5)
37:	*Player loses all experience points and levels
38:	*Item Loses a Fraction of its Durability - Values: (1: 1%, 2: 5%, 3: 25%)
39:	*Item Regains a Fraction of its Durability - Values: (1: 1%, 2: 5%, 3: 25%)
40:	 Sound and Particle Effect - See "Sounds and Particles" list below for use of Value key
41:	*Kills you Instantly (Please don't use this except in special situations.)
42:	*Item is Removed from Armor Slot
43:	*Receive Item - See "Resources" list below for use of Value key; Value2 determines amount received (max 128)
44:	*Lose Item - See "Resources" list below for use of Value key; Value2 determines amount lost (max 128)
45:	*Reloads all Crossbows on Hotbar and Offhand - See "Loadables" list below for use of Value key
46:	*Reloads this Crossbow - See "Loadables" list below for use of Value key
47:	*Gain Potion Effect for Certain Duration - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
48:	*Inflict Potion Effect on Monsters That Just Took Damage - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
49:	*Inflict Potion Effect on All Nearby Monsters - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
50:	*Inflict Potion Effect on a Random Nearby Monster - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
51:	*Grant Potion Effect to All Nearby Players (Includes yourself) - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
52:	*Grant Potion Effect to All Other Nearby Players (Does not include yourself) - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
53:	*Grant Potion Effect to a Random Other Nearby Player (Cannot affect yourself) - See "Potion Effects and Afflictions" list below for use of Value and Value2 key
54:	*Add to or Remove from Counter1 - Value key sets amount added (See Condition #54)
55:	*Set value of Counter1 - Value key sets value Counter1 is set to
56:	*Add to or Remove from Counter2 - Value key sets amount added (See Condition #56)
57:	*Set value of Counter2 - Value key sets value Counter2 is set to
58:	*Add to or Remove from Counter3 - Value key sets amount added (See Condition #58)
59:	*Set value of Counter3 - Value key sets value Counter3 is set to
60:	 [Reserved]
61:	 [Reserved]
62:	 [Reserved]
63:	 [Reserved]
64:	 [Currently Unused]
65:	 [Currently Unused]
66:	 [Currently Unused]
67:	 [Currently Unused]
68:	 [Currently Unused]
69:	 [Currently Unused]
70:	 [Currently Unused]
71:	 [Currently Unused]
72:	*Increase or Decrease Item Count - Value sets amount added
73:	 Resistance - Value sets amplifier (max 4)
74:	 Plus or Minus Armor Toughness - Value sets increase in points
75:	*Regain Hunger - Value sets number of hunger points gained
76:	*Player gains a certain number of experience points - Value sets points (max 256)
77:	*Player loses a certain number of experience levels - Value sets levels lost. (max 256)
78:	 Nearby monsters are immune to knockback - Values sets effect radius (1: 7 blocks, 2: 15 blocks, 3: unlimited distance)
79:	*Heal 4 Health Points - Value determines healing. (Healing = Value * 4)
80:	*Player gains a certain number of experience levels - Value sets levels (max 256)
81:	*Roll random number [0 <= n < max] (See Condition #81) - Value sets max (This will never actually roll max, only 1 less than it. This value only survives for one tick.)
82:	 [Reserved]""";

String effectDataRaw = """;;;
Amount;input;;
Percent Increase;input;;
Percent Increase;input;;
Amount;input;;
Amount;input;;
Percent Increase;input;;
;;;
;;;
;;;
;;;
;;;
Amplifier (max 4);input;;
Amplifier (max 4);input;;
;;;
;;;
Amplifier (max 4);input;;
Amplifier (max 4);input;;
;;;
;;;
Amplifier (max 4);input;;
Amplifier (max 4);input;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
Ticks to Prime For;input;;
;;;
Radius;dropdown-4;;
;;;
Percent Lost;percentage;;
Percent Regained;percentage;;
Effect;sound;;
;;;
;;;
Item Received;resource;Amount Recevied;input
Item Lost;resource;Amount Lost;input
Projectile;loadable;;
Projectile;loadable;;
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Potion Effect;potion_effect;Duration;duration
Amount Added;input;;
Value;input;;
Amount Added;input;;
Value;input;;
Amount Added;input;;
Value;input;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
Amount Gained;input;;
Amplifier (max 4);input;;
Amount;input;;
Points Gained;input;;
Points Gained;input;;
Levels Lost;input;;
Radius;no_knockback_distance_radius;;
Times the Player Should Gain 4 Health;input;;
Levels Gained;input;;
max;input;;
;;;""";

String conditionData = """0:	 Always True
1:	 Underwater
2:	 On Ground
3:	 On Fire
4:	 Standing in Light Level 8 or Greater
5:	 Sprinting while on Ground - (Note: Attacking causes you to stop sprinting, but there is a bug with the game that makes it look like you are still sprinting)
6:	 Sneaking/Crouching
7:	*Timer - Value determines time in ticks between each trigger; Value2 sets offset in ticks
8:	 Has a certain number of experience levels - Value determines required level
9:	 There are a certain number of monsters within 15 blocks - Value determines count
10:	*Dealt Damage With a Melee Attack - Value is optional and sets minimum damage that must be dealt
11:	*Killed Mob or Player
12:	*Killed Mob of a Specific Type - See "Monster Types" list below for use of Value key
13:	*Blocked Damage with Shield - Value is optional and sets minimum damage that must be blocked
14:	 This Crossbow is Loaded
15:	*Player loads a crossbow
16:	 Eating food
17:	 Drinking a potion
18:	 [Currently Unused]
19:	 [Currently Unused]
20:	 [Currently Unused]
21:	 [Currently Unused]
22:	 [Currently Unused]
23:	 [Currently Unused]
24:	 [Currently Unused]
25:	 [Currently Unused]
26:	 [Currently Unused]
27:	 [Currently Unused]
28:	 [Currently Unused]
29:	 [Currently Unused]
30:	*Took Damage - Value is optional and sets minimum damage that must be taken by the hit to trigger this condition
31:	*Took Damage From a Monster
32:	 Percentage Random Chance - Values: (1: 0.1%, 2: 1%, 3: 5%, 4: 10%, 5: 25%, 6: 33%, 7: 50%)
33:	 Trigger was set earlier by this item (See Effect #33)
34:	 Item is Primed (See Effect #34)
35:	 Item has been Activated (See Effect #35)
36:	 Has a certain amount of health - Value sets minimum health
37:	 Has a certain amount of armor - Value sets minimum armor
38:	*Deal Damage With an Arrow or Spectral Arrow
39:	*Deal Damage With a Firework Rocket
40:	 Item has a certain amount of durability damage - Value sets minimum damage
41:	*Ate Food
42:	*Drank Potion
43:	 Has Item - See "Resources" list below for use of Value key; Value2 determines the amount they must have
44:	 [Reserved]
45:	*Broke Monster Spawner
46:	 A Mob of a Specific Type is Within 15 Blocks - See "Monster Types" list below for use of Value key; Value2 is optional and sets minumum count in range
47:	 Another Player is within 20 Blocks - Value2 is optional and sets minimum count in range
48:	 Bow is being drawn back
49:	 Crossbow is being loaded
50:	 Trident is being drawn back
51:	 Shield is being held up
52:	 Spyglass is being looked through
53:	 [Currently Unused]
54:	 Counter1 is equal to a certain value - Value key sets the value checked (See Effect #54)
55:	 Counter1 is greater than or equal to a certain value - Value key sets this value
56:	 Counter2 is equal to a certain value - Value key sets the value checked (See Effect #56)
57:	 Counter2 is greater than or equal to a certain value - Value key sets this value
58:	 Counter3 is equal to a certain value - Value key sets the value checked (See Effect #58)
59:	 Counter3 is greater than or equal to a certain value - Value key sets this value
60:	 [Reserved]
61:	 [Reserved]
62:	 [Reserved]
63:	 [Reserved]
64:	 A Burning Entity is within 15 blocks - Value sets minumum count in range
65:	*Used a Carrot on a Stick - Value sets cooldown in ticks before it can be used again
66:	*Took Blast Damage
67:	*Took Fire Damage
68:	*Took Projectile Damage
69:	 Have specific item in mainhand - See "Equipment" list for use of Value key
70:	 In Lava
71:	*Fall Certain Distance - Value sets distance in cm. (Notes: This trigger activates when the player hits the ground from their fall. It only triggers if the player fell more than one block. It will not trigger if the player is in Creative Mode.)
72:	 [Reserved]
73:	 [Currently Unused]
74:	 [Currently Unused]
75:	 [Currently Unused]
76:	 [Currently Unused]
77:	 [Currently Unused]
78:	 [Currently Unused]
79:	 [Currently Unused]
80:	 [Currently Unused]
81:	 Rolled random number equals certain number (See Effect #81) - Value sets number checked against
82:	 Rolled random number is greater than or equal to certain number (See Effect #81) - Value sets number checked""";

String conditionDataRaw = """;;;
;;;
;;;
;;;
;;;
;;;
;;;
Ticks Between Each Trigger;input;Offset in Ticks;input
Required Level;input;;
Required Monsters;input;;
Minimum Damage Dealt (optional);input;;
;;;
Monster Type;monster_type;;
Minimum Damage Blocked (optional);input;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
Minimum Damage Taken (optional);input;;
;;;
Chance;chance;;
;;;
;;;
;;;
Minimum Health;input;;
Minimum Armor;input;;
;;;
;;;
Minimum Durability Damage Taken;input;;
;;;
;;;
Resource;resource;Amount Required;input
;;;
;;;
Monster Type;monster_type;Minumum Required in Range (optional);input
;;Minumum Required in Range (optional);input
;;;
;;;
;;;
;;;
;;;
;;;
Value Checked;input;;
Value Checked;input;;
Value Checked;input;;
Value Checked;input;;
Value Checked;input;;
Value Checked;input;;
;;;
;;;
;;;
;;;
Minumum Required in Range (optional);input;;
Cooldown in Ticks (optional);input;;
;;;
;;;
;;;
Item;equipment;;
;;;
Distance in cm;input;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
Value Checked;input;;
Value Checked;input;;""";

String potionEffectData = """1:	 Speed I
2:	 Speed II
3:	 Speed V
4:	 Strength I
5:	 Strength II
6:	 Strength X
7:	 Resistance I
8:	 Resistance II
9:	 Resistance V
10:	 Haste I
11:	 Haste II
12:	 Haste X
13:	 Slowness I
14:	 Slowness II
15:	 Slowness X
16:	 Weakness I
17:	 Weakness II
18:	 Weakness X
19:	 Wither I
20:	 Wither II
21:	 Wither V
22:	 Levitation I
23:	 Levitation III
24:	 Levitation V
25:	 Absorption I
26:	 Absorption II
27:	 Absorption V
28:	 Regeneration I
29:	 Regeneration II
30:	 Regeneration V
31:	 Fire Resistance
32:	 Set on Fire - Value2 key has no effect
33:	 Instant Damage I
34:	 Instant Damage II
35:	 Instant Damage X
36:	 Explosion - Value2 key sets explosion power
37:	 Instant Health I (Use Effect #79 instead if possible)
38:	 Instant Health II (Use Effect #79 instead if possible)
39:	 Instant Health X (Use Effect #79 instead if possible)
40:	 Lightning Strike - Value2 key has no effect""";

String durationData = """1:	 1 Second
2:	 5 Seconds
3:	 10 Seconds
4:	 30 Seconds
5:	 1 Minute
6:	 3 Minutes
7:	 5 Minutes
8:	 10 Minutes""";

String monsterTypeData = """1:	 Undead
2:	 Zombie (Includes variants)
3:	 Skeleton (Includes variants)
4:	 Arthropod
5:	 Spider (Includes variants)
6:	 Creeper
7:	 Illager
8:	 Witch
9:	 Vex
10:	 Aquatic Monster
11:	 Nether Monster
12:	 Ender Monster
13:	 Piglin (Includes variants)
14:	 Flying Monster
15:	 Ravager
16:	 Husk
17:	 Stray
18:	 Wither Skeleton
19:	 Blaze
20:	 Silverfish""";

String loadableData = """1:	 Arrow
2:	 Spectral Arrow
3:	 Firework Rocket
4:	 Arrow of Slowness
5:	 Arrow of Weakness
6:	 Arrow of Harming
7:	 Arrow of Healing
8:	 Arrow of Poison
9:	 Arrow of Levitation
10:	 Arrow from Inventory""";

String soundData = """1:	*Fireburst
2:	 Puff
3:	*Glimmer
4:	 Light Glimmer
5:	 Rocket Exaust
6:	*Gain Experience
7:	*Pop
8:	*Stomp
9:	*Plant Break
10:	*White Burst
11:	*Black Burst
12:	*Red Burst
13:	*Orange Burst
14:	*Yellow Burst
15:	*Green Burst
16:	*Blue Burst
17:	*Purple Burst
18:	*Pink Burst
19:	*Brown Burst
20:	 White Shimmer
21:	 Black Shimmer
22:	 Red Shimmer
23:	 Orange Shimmer
24:	 Yellow Shimmer
25:	 Green Shimmer
26:	 Blue Shimmer
27:	 Purple Shimmer
28:	 Pink Shimmer
29:	 Brown Shimmer
30:	*Wormhole
31:	*Totem Break
32:	*Smack
33:	 Rocket Exaust 2
34:	*Fire Attack
35:	*Ice Attack
36:	*Earth Attack
37:	*Water Attack
38:	*Blade Attack
39:	*Flash Attack
40:	*Dark Attack (Musical)
41:	*Light Attack (Musical)
42:	*Adventurous Attack (Musical)
43:	*Exotic Attack (Musical)
44:	*Blood Attack
45:	*Slime Attack
46:	*Honey Attack
47:	*Bramble Attack
48:	*Strike Attack
49:	*Web Attack
50:	*Advancement
51:	*Beacon 1
52:	*Beacon 2
53:	 Small Raincloud""";

String resourceData = """1:	 Gold Ingot
2:	 Gold Nugget
3:	 Iron Ingot
4:	 Iron Nugget
5:	 Emerald
6:	 Diamond
7:	 Fire Charge
8:	 Coal
9:	 Gunpowder
10:	 Bone
11:	 Arrow
12:	 Magic Scroll (Renamed mojang_banner_pattern)""";

String equipmentData = """1:	 Sword
2:	 Axe
3:	 Pickaxe
4:	 Shovel
5:	 Hoe
6:	 Helmet
7:	 Chestplate
8:	 Leggings
9:	 Boots
10:	 Wooden Equipment (Tools, Melee Weapons, Armor)
11:	 Leather Equipment
12:	 Stone Equipment
13:	 Chainmail Equipment
14:	 Iron Equipment
15:	 Diamond Equipment
16:	 Netherite Equipment
17:	 Golden Equipment
18:	 Bow
19:	 Crossbow
20:	 Trident
21:	 Shield
22:	 Potion or Water Bottle
23:	 Totem of Undying
24:	 Golden Apple or Enchanted Golden Apple
25:	 Fishing Rod
26:	 Flint and Steel
27:	 Empty Bucket
28:	 Water Bucket (Includes fish buckets)
29:	 Lava Bucket
30:	 Milk Bucket
31:	 Torch or Lantern
32:	 Elytra
33:	 Arrow, Spectral Arrow or Tipped Arrow""";
