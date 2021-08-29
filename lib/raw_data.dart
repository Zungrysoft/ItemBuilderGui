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
60:	 [Currently Unused]
61:	 [Currently Unused]
62:	 [Currently Unused]
63:	 [Currently Unused]
64:	 [Currently Unused]
65:	 [Currently Unused]
66:	 [Currently Unused]
67:	 [Currently Unused]
68:	 [Currently Unused]
69:	 [Currently Unused]
70:	 [Currently Unused]
71:	 [Currently Unused]
72:	 [Currently Unused]
73:	 [Currently Unused]
74:	 [Currently Unused]
75:	*Regain Hunger - Value sets number of hunger points gained
76:	*Player gains a certain number of experience points - Value sets points (max 256)
77:	*Player loses a certain number of experience levels - Value sets levels lost. (max 256)
78:	 Nearby monsters are immune to knockback - Values sets effect radius (1: 7 blocks, 2: 15 blocks, 3: infinite distance)
79:	*Heal 4 Health Points - Value determines healing. (Healing = Value * 4)
80:	*Player gains a certain number of experience levels - Value sets levels (max 256)""";

String effectDataRaw = """;;;
Amount;input;;
Amount;input;;
Amount;input;;
Amount;input;;
Amount;input;;
Amount;input;;
;;;
;;;
;;;
;;;
;;;
Amplifier;dropdown-4;;
Amplifier;dropdown-4;;
;;;
;;;
Amplifier;dropdown-4;;
Amplifier;dropdown-4;;
;;;
;;;
Amplifier;dropdown-4;;
Amplifier;dropdown-4;;
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
Percent Lost;percentages;;
Percent Regained;percentages;;
Effect;sounds;;
;;;
;;;
Item Received;resources;Amount Recevied;input
Item Lost;resources;Amount Lost;input
Projectile;loadables;;
Projectile;loadables;;
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
Potion Effect;potion_effects;Duration;durations
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
;;;
;;;
;;;
Points Gained;input;;
Points Gained;input;;
Levels Lost;input;;
Radius;no_knockback_distances;;
Times the Player Should Gain 4 Hearts;input;;
Levels Gained;input;;""";

String conditionData = """0:	 Always True
1:	 Underwater
2:	 On Ground
3:	 On Fire
4:	 Standing in Light Level 8 or Greater
5:	 Sprinting
6:	 Sneaking/Crouching
7:	*Timer - Value determines how many ticks between each trigger
8:	 Has a certain number of experience levels - Value determines required level
9:	 There are a certain number of monsters within 20 blocks - Value determines count
10:	*Dealt Damage With a Melee Attack - Value is optional and sets minimum damage that must be dealt by the hit to trigger this condition
11:	*Killed Mob or Player
12:	*Killed Mob of a Specific Type - See "Monster Types" list below for use of Value key
13:	 [Currently Unused]
14:	 [Currently Unused]
15:	 [Currently Unused]
16:	 [Currently Unused]
17:	 [Currently Unused]
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
33:	*Trigger was set earlier by this item (See Effect #33)
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
44:	 [Currently Unused]
45:	*Broke Monster Spawner
46:	 A Mob of a Specific Type is Within 15 Blocks - See "Monster Types" list below for use of Value key; Value2 is optional and sets minimum count in range
47:	 [Currently Unused]
48:	 [Currently Unused]
49:	 [Currently Unused]
50:	 [Currently Unused]
51:	 [Currently Unused]
52:	 [Currently Unused]
53:	 [Currently Unused]
54:	 Counter1 is equal to a certain value - Value key sets the value checked (See Effect #54)
55:	 Counter1 is greater than or equal to a certain value - Value key sets this value
56:	 Counter2 is equal to a certain value - Value key sets the value checked (See Effect #56)
57:	 Counter2 is greater than or equal to a certain value - Value key sets this value
58:	 Counter3 is equal to a certain value - Value key sets the value checked (See Effect #58)
59:	 Counter3 is greater than or equal to a certain value - Value key sets this value
60:	 [Currently Unused]
61:	 [Currently Unused]
62:	 [Currently Unused]
63:	 [Currently Unused]
64:	 A Burning Entity is within 15 blocks - Value sets minimum count in range
65:	*Used a Carrot on a Stick - Value sets cooldown in ticks before it can be used again
66:	*Took Blast Damage
67:	*Took Fire Damage
68:	*Took Projectile Damage
69:	 Have specific item in mainhand - See "Equipment" list for use of Value key
70:	 In Lava
71:	*Fall Certain Distance - Value sets distance in cm. (Notes: This trigger activates when the player hits the ground from their fall. It only triggers if the player fell more than one block. It will not trigger if the player is in Creative Mode.)""";

String conditionDataRaw = """;;;
;;;
;;;
;;;
;;;
;;;
;;;
Ticks Between Each Trigger;input;;
Required Level;input;;
Required Monsters;input;;
Minimum Damage Dealt (optional);input;;
;;;
Monster Type;monster_type;;
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
;;;
Minimum Damage Taken (optional);input;;
;;;
Chance;chances;;
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
Monster Type;monster_type;Minimum Required in Range (optional);input
;;;
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
Minimum Required in Range (optional);input;;
Cooldown in Ticks (optional);input;;
;;;
;;;
;;;
Item;equipment;;
;;;
Distance in cm;input;;""";
