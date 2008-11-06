require 'dofus/item'
require 'dofus/recipe'
require 'yaml'

module Dofus

  RECIPE_DATA = <<-END_RECIPE_DATA
--- 
items: 
- &id117 !ruby/object:Dofus::Item 
  name: Steamed Carp **
- &id113 !ruby/object:Dofus::Item 
  name: Grilled Kralove ***
- &id090 !ruby/object:Dofus::Item 
  name: Sliced Gudgeon ****
- &id182 !ruby/object:Dofus::Item 
  name: Kaniger Meat
- &id123 !ruby/object:Dofus::Item 
  name: Stuffed Mullet **
- &id056 !ruby/object:Dofus::Item 
  name: Gwilled Wabbit **
- &id028 !ruby/object:Dofus::Item 
  name: Preserved Insect Flesh
- &id083 !ruby/object:Dofus::Item 
  name: Gutted Horror Grawn
- &id007 !ruby/object:Dofus::Item 
  name: Preserved Bird Meat **
- &id169 !ruby/object:Dofus::Item 
  name: Biblop Blubber
- &id165 !ruby/object:Dofus::Item 
  name: Treechnid Resin
- &id128 !ruby/object:Dofus::Item 
  name: Grilled Bar **
- &id124 !ruby/object:Dofus::Item 
  name: Stuffed Mullet ***
- &id079 !ruby/object:Dofus::Item 
  name: Crab Stick ****
- &id054 !ruby/object:Dofus::Item 
  name: Gwilled Wabbit
- &id181 !ruby/object:Dofus::Item 
  name: DragoMeat ****
- &id171 !ruby/object:Dofus::Item 
  name: Pork loin **
- &id139 !ruby/object:Dofus::Item 
  name: Skate Wing **
- &id003 !ruby/object:Dofus::Item 
  name: First part of the Dragon Pig Maze Key
- &id106 !ruby/object:Dofus::Item 
  name: Gutted Dark Sardine
- &id006 !ruby/object:Dofus::Item 
  name: Nuggets
- &id112 !ruby/object:Dofus::Item 
  name: Grilled Kralove **
- &id172 !ruby/object:Dofus::Item 
  name: Pork Loin ***
- &id136 !ruby/object:Dofus::Item 
  name: Seared Pike***
- &id132 !ruby/object:Dofus::Item 
  name: Grilled Bass ****
- &id063 !ruby/object:Dofus::Item 
  name: Brawn Salad
- &id035 !ruby/object:Dofus::Item 
  name: Preserved Gobball Leg
- &id046 !ruby/object:Dofus::Item 
  name: Preserved DragoMeat **
- &id146 !ruby/object:Dofus::Item 
  name: Seared Pike****
- &id084 !ruby/object:Dofus::Item 
  name: Grawn Fritters ****
- &id105 !ruby/object:Dofus::Item 
  name: Oil Sardine ***
- &id004 !ruby/object:Dofus::Item 
  name: Frying Oil
- &id060 !ruby/object:Dofus::Item 
  name: Gwilled Wabbit ****
- &id087 !ruby/object:Dofus::Item 
  name: Sliced Gudgeon **
- &id038 !ruby/object:Dofus::Item 
  name: Roasted Gobball leg **
- &id152 !ruby/object:Dofus::Item 
  name: Bird Meat **
- &id125 !ruby/object:Dofus::Item 
  name: Gutted Tupe-Halett Pike
- &id094 !ruby/object:Dofus::Item 
  name: "Trout flamb\xC3\xA9 **"
- &id029 !ruby/object:Dofus::Item 
  name: Water
- &id177 !ruby/object:Dofus::Item 
  name: Wabbit leg ****
- &id130 !ruby/object:Dofus::Item 
  name: Gutted Siktrin Bass
- &id101 !ruby/object:Dofus::Item 
  name: Gutted Igloo Fish
- &id041 !ruby/object:Dofus::Item 
  name: Preserved Gobball Leg ****
- &id024 !ruby/object:Dofus::Item 
  name: Preserved Pork Loin ***
- &id179 !ruby/object:Dofus::Item 
  name: DragoMeat **
- &id178 !ruby/object:Dofus::Item 
  name: DragoMeat *
- &id166 !ruby/object:Dofus::Item 
  name: Scurvion Blood
- &id143 !ruby/object:Dofus::Item 
  name: Gutted Open-Market Shark
- &id122 !ruby/object:Dofus::Item 
  name: Gutted Pike
- &id102 !ruby/object:Dofus::Item 
  name: Fried Breaded Fish ****
- &id026 !ruby/object:Dofus::Item 
  name: Preserved Pork loin ****
- &id032 !ruby/object:Dofus::Item 
  name: Gobball Saliva
- &id180 !ruby/object:Dofus::Item 
  name: DragoMeat ***
- &id167 !ruby/object:Dofus::Item 
  name: Muzzle **
- &id066 !ruby/object:Dofus::Item 
  name: Preserved Muzzle ***
- &id059 !ruby/object:Dofus::Item 
  name: Preserved Wabbit leg ****
- &id120 !ruby/object:Dofus::Item 
  name: Steamed Carp ****
- &id048 !ruby/object:Dofus::Item 
  name: Preserved DragoMeat ***
- &id184 !ruby/object:Dofus::Item 
  name: Koalak Meat
- &id175 !ruby/object:Dofus::Item 
  name: Wabbit leg **
- &id138 !ruby/object:Dofus::Item 
  name: Gutted Blue Ray
- &id021 !ruby/object:Dofus::Item 
  name: Cooked Ham
- &id033 !ruby/object:Dofus::Item 
  name: Insect Croquettes **
- &id049 !ruby/object:Dofus::Item 
  name: Dragomeat Steak ***
- &id009 !ruby/object:Dofus::Item 
  name: Preserved Bird Meat ****
- &id115 !ruby/object:Dofus::Item 
  name: Kralove ****
- &id098 !ruby/object:Dofus::Item 
  name: Gutted Breaded Fish
- &id173 !ruby/object:Dofus::Item 
  name: Pork loin ****
- &id151 !ruby/object:Dofus::Item 
  name: Bird Meat *
- &id144 !ruby/object:Dofus::Item 
  name: Spicy Shark ****
- &id089 !ruby/object:Dofus::Item 
  name: Gutted Gudgeon from Kiye
- &id047 !ruby/object:Dofus::Item 
  name: Dragomeat Steak **
- &id034 !ruby/object:Dofus::Item 
  name: Dose of Tasty Juice
- &id039 !ruby/object:Dofus::Item 
  name: Preserved Gobball Leg ***
- &id126 !ruby/object:Dofus::Item 
  name: Stuffed Mullet ****
- &id037 !ruby/object:Dofus::Item 
  name: Preserved Gobball Leg **
- &id050 !ruby/object:Dofus::Item 
  name: Preserved DragoMeat ****
- &id055 !ruby/object:Dofus::Item 
  name: Preserved Wabbit leg **
- &id157 !ruby/object:Dofus::Item 
  name: Gobball leg *
- &id156 !ruby/object:Dofus::Item 
  name: Larva Flesh ***
- &id127 !ruby/object:Dofus::Item 
  name: Gutted Lard Bass
- &id118 !ruby/object:Dofus::Item 
  name: Steamed Carp ***
- &id071 !ruby/object:Dofus::Item 
  name: Crocodyl Steak
- &id017 !ruby/object:Dofus::Item 
  name: Larva with Salt ***
- &id072 !ruby/object:Dofus::Item 
  name: Spices 1 Pepper Measure
- &id107 !ruby/object:Dofus::Item 
  name: Sardine ****
- &id070 !ruby/object:Dofus::Item 
  name: Preserved Crocodyl Meat
- &id114 !ruby/object:Dofus::Item 
  name: Gutted Unique Kralove
- &id096 !ruby/object:Dofus::Item 
  name: Gutted Ancestral Trout
- &id015 !ruby/object:Dofus::Item 
  name: Larva with Salt **
- &id075 !ruby/object:Dofus::Item 
  name: Gutted Sourimi Crab
- &id042 !ruby/object:Dofus::Item 
  name: Roasted Gobball leg ****
- &id153 !ruby/object:Dofus::Item 
  name: Bird Meat ****
- &id008 !ruby/object:Dofus::Item 
  name: Nuggets **
- &id080 !ruby/object:Dofus::Item 
  name: Gutted Grawn
- &id027 !ruby/object:Dofus::Item 
  name: Cooked Ham ****
- &id164 !ruby/object:Dofus::Item 
  name: Muzzle *
- &id148 !ruby/object:Dofus::Item 
  name: Spicy Shark **
- &id062 !ruby/object:Dofus::Item 
  name: Preserved Muzzle *
- &id011 !ruby/object:Dofus::Item 
  name: Salt Measure
- &id093 !ruby/object:Dofus::Item 
  name: Gutted Trout
- &id068 !ruby/object:Dofus::Item 
  name: Preserved Kaniger Meat
- &id147 !ruby/object:Dofus::Item 
  name: Gutted Sickle-Hammerhead Shark
- &id061 !ruby/object:Dofus::Item 
  name: Hazel
- &id104 !ruby/object:Dofus::Item 
  name: Oil Sardine **
- &id095 !ruby/object:Dofus::Item 
  name: "Trout flamb\xC3\xA9 ***"
- &id176 !ruby/object:Dofus::Item 
  name: Wabbit leg ***
- &id077 !ruby/object:Dofus::Item 
  name: Crab Stick ***
- &id025 !ruby/object:Dofus::Item 
  name: Cooked Ham ***
- &id108 !ruby/object:Dofus::Item 
  name: Gutted Kittenfish
- &id163 !ruby/object:Dofus::Item 
  name: Insect Flesh **
- &id092 !ruby/object:Dofus::Item 
  name: Smoked Tiger Fish ****
- &id067 !ruby/object:Dofus::Item 
  name: Brawn Salad ***
- &id016 !ruby/object:Dofus::Item 
  name: Preserved Larva Flesh ***
- &id069 !ruby/object:Dofus::Item 
  name: Angeroo Steak
- &id155 !ruby/object:Dofus::Item 
  name: Larva Flesh **
- &id135 !ruby/object:Dofus::Item 
  name: Seared Pike
- &id023 !ruby/object:Dofus::Item 
  name: Cooked Ham **
- &id100 !ruby/object:Dofus::Item 
  name: Fingre Fish ***
- &id159 !ruby/object:Dofus::Item 
  name: Gobball leg **
- &id013 !ruby/object:Dofus::Item 
  name: Larva with Salt
- &id053 !ruby/object:Dofus::Item 
  name: Preserved Wabbit leg *
- &id002 !ruby/object:Dofus::Item 
  name: Boar snout
- &id045 !ruby/object:Dofus::Item 
  name: Dragomeat Steak
- &id109 !ruby/object:Dofus::Item 
  name: Smoked Kittenfish **
- &id085 !ruby/object:Dofus::Item 
  name: Lemon
- &id160 !ruby/object:Dofus::Item 
  name: Gobball leg ***
- &id145 !ruby/object:Dofus::Item 
  name: Gutted Kittenperch
- &id097 !ruby/object:Dofus::Item 
  name: "Trout flamb\xC3\xA9 ****"
- &id012 !ruby/object:Dofus::Item 
  name: Preserved Larva Flesh
- &id099 !ruby/object:Dofus::Item 
  name: Fingre Fish **
- &id129 !ruby/object:Dofus::Item 
  name: Grilled Bass ***
- &id020 !ruby/object:Dofus::Item 
  name: Salad
- &id043 !ruby/object:Dofus::Item 
  name: Onion
- &id141 !ruby/object:Dofus::Item 
  name: Gutted Farle's Ray
- &id088 !ruby/object:Dofus::Item 
  name: Sliced Gudgeon ***
- &id036 !ruby/object:Dofus::Item 
  name: Roasted Gobball leg
- &id183 !ruby/object:Dofus::Item 
  name: Crocodyl Meat
- &id081 !ruby/object:Dofus::Item 
  name: Grawn Fritters **
- &id074 !ruby/object:Dofus::Item 
  name: Koalak Steak
- &id149 !ruby/object:Dofus::Item 
  name: Spicy Shark ***
- &id142 !ruby/object:Dofus::Item 
  name: Skate Wing ****
- &id140 !ruby/object:Dofus::Item 
  name: Skate Wing ***
- &id031 !ruby/object:Dofus::Item 
  name: Preserved Insect Flesh **
- &id134 !ruby/object:Dofus::Item 
  name: Five-Leaf Clover
- &id103 !ruby/object:Dofus::Item 
  name: Gutted Shiny Sardine
- &id091 !ruby/object:Dofus::Item 
  name: Gutted Tiger Fish
- &id110 !ruby/object:Dofus::Item 
  name: Smoked Kittenfish ***
- &id040 !ruby/object:Dofus::Item 
  name: Roasted Gobball leg ***
- &id076 !ruby/object:Dofus::Item 
  name: Crab Stick **
- &id170 !ruby/object:Dofus::Item 
  name: Pork loin *
- &id019 !ruby/object:Dofus::Item 
  name: Pepper Measure
- &id065 !ruby/object:Dofus::Item 
  name: Brawn Salad **
- &id057 !ruby/object:Dofus::Item 
  name: Preserved Wabbit leg ***
- &id073 !ruby/object:Dofus::Item 
  name: Preserved Koalak Meat
- &id154 !ruby/object:Dofus::Item 
  name: Larva Flesh *
- &id131 !ruby/object:Dofus::Item 
  name: Sourimi Crab
- &id052 !ruby/object:Dofus::Item 
  name: Spices
- &id086 !ruby/object:Dofus::Item 
  name: Gutted Gudgeon
- &id030 !ruby/object:Dofus::Item 
  name: Insect Croquette
- &id051 !ruby/object:Dofus::Item 
  name: Dragomeat Steak ****
- &id158 !ruby/object:Dofus::Item 
  name: Jelly Blubber
- &id133 !ruby/object:Dofus::Item 
  name: Gutted Perch
- &id058 !ruby/object:Dofus::Item 
  name: Gwilled Wabbit ***
- &id014 !ruby/object:Dofus::Item 
  name: Preserved Larva Flesh **
- &id005 !ruby/object:Dofus::Item 
  name: Preserved Bird Meat
- &id082 !ruby/object:Dofus::Item 
  name: Grawn Fritters ***
- &id185 !ruby/object:Dofus::Item 
  name: Palm Oil
- &id162 !ruby/object:Dofus::Item 
  name: Insect Flesh *
- &id150 !ruby/object:Dofus::Item 
  name: Pinch of Temporal Powder
- &id121 !ruby/object:Dofus::Item 
  name: Grawn
- &id119 !ruby/object:Dofus::Item 
  name: Gutted Sand Small Carp
- &id001 !ruby/object:Dofus::Item 
  name: Lousy Pig snout
- &id168 !ruby/object:Dofus::Item 
  name: Muzzle ***
- &id137 !ruby/object:Dofus::Item 
  name: Wild Mint Leaf
- &id116 !ruby/object:Dofus::Item 
  name: Gutted Ediem Carp
- &id064 !ruby/object:Dofus::Item 
  name: Preserved Muzzle **
- &id022 !ruby/object:Dofus::Item 
  name: Preserved Pork loin **
- &id044 !ruby/object:Dofus::Item 
  name: Preserved DragoMeat *
- &id111 !ruby/object:Dofus::Item 
  name: Gutted Kralove
- &id174 !ruby/object:Dofus::Item 
  name: Wabbit leg *
- &id161 !ruby/object:Dofus::Item 
  name: Gobball leg ****
- &id018 !ruby/object:Dofus::Item 
  name: Preserved Pork Loin
- &id010 !ruby/object:Dofus::Item 
  name: Nuggets ****
- &id078 !ruby/object:Dofus::Item 
  name: Gutted Exotic Surimice Crab
recipes: 
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id001: 3
    *id002: 3
  product: *id003
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id004: 1
    *id005: 1
  product: *id006
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id007: 1
    *id004: 7
  product: *id008
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id004: 4
    *id009: 1
  product: *id010
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id011: 1
    *id012: 1
  product: *id013
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id014: 1
    *id011: 2
  product: *id015
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id011: 3
    *id016: 1
  product: *id017
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id018: 1
    *id019: 2
    *id020: 1
  product: *id021
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id019: 3
    *id020: 3
    *id022: 1
  product: *id023
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id024: 1
    *id019: 4
    *id020: 5
  product: *id025
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id026: 1
    *id019: 5
    *id020: 8
  product: *id027
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id028: 1
    *id029: 1
    *id011: 2
  product: *id030
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id031: 1
    *id032: 3
    *id011: 5
  product: *id033
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id004: 1
    *id035: 1
  product: *id036
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 2
    *id004: 2
    *id037: 1
  product: *id038
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 3
    *id004: 3
    *id039: 1
  product: *id040
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id004: 4
    *id041: 1
  product: *id042
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id043: 4
    *id011: 4
    *id044: 1
  product: *id045
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 5
    *id043: 5
    *id011: 5
    *id046: 1
  product: *id047
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 5
    *id043: 5
    *id048: 1
    *id011: 5
  product: *id049
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id050: 1
    *id034: 6
    *id043: 6
    *id011: 6
  product: *id051
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id004: 4
    *id019: 2
    *id052: 2
    *id053: 1
  product: *id054
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id055: 1
    *id004: 5
    *id019: 3
    *id052: 2
  product: *id056
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id004: 6
    *id019: 3
    *id052: 3
    *id057: 1
  product: *id058
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id004: 7
    *id019: 5
    *id052: 5
    *id059: 1
  product: *id060
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id061: 1
    *id029: 2
    *id011: 2
    *id019: 2
    *id062: 1
  product: *id063
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id061: 3
    *id029: 2
    *id011: 4
    *id019: 4
    *id064: 1
  product: *id065
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id061: 4
    *id029: 2
    *id011: 6
    *id019: 6
    *id066: 1
  product: *id067
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id029: 1
    *id004: 1
    *id011: 1
    *id019: 1
    *id068: 1
    *id020: 1
  product: *id069
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id029: 1
    *id070: 1
    *id034: 1
    *id004: 1
    *id011: 1
    *id019: 1
    *id020: 1
  product: *id071
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id029: 1
    *id072: 1
    *id034: 1
    *id073: 1
    *id004: 1
    *id011: 1
    *id020: 1
  product: *id074
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id075: 1
  product: *id076
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id075: 2
  product: *id077
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id078: 1
    *id034: 1
  product: *id079
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id080: 1
    *id004: 1
  product: *id081
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id080: 2
    *id004: 1
  product: *id082
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id083: 1
    *id004: 1
  product: *id084
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 1
    *id086: 1
  product: *id087
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 1
    *id086: 2
  product: *id088
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 1
    *id089: 1
  product: *id090
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 1
    *id091: 1
  product: *id092
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 2
    *id093: 1
  product: *id094
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 3
    *id093: 2
  product: *id095
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id096: 1
    *id085: 2
  product: *id097
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id098: 1
    *id034: 1
    *id004: 1
  product: *id099
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id098: 2
    *id034: 1
    *id004: 1
  product: *id100
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id101: 1
    *id004: 1
  product: *id102
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 2
    *id004: 2
    *id103: 1
  product: *id104
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 3
    *id004: 2
    *id103: 2
  product: *id105
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id085: 2
    *id004: 2
    *id106: 1
  product: *id107
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id108: 1
    *id085: 1
    *id011: 1
  product: *id109
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id108: 2
    *id085: 1
    *id011: 1
  product: *id110
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id085: 2
    *id004: 2
    *id111: 1
  product: *id112
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 8
    *id085: 2
    *id004: 4
    *id111: 2
  product: *id113
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id114: 1
    *id034: 4
    *id085: 2
    *id004: 2
  product: *id115
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id085: 2
    *id011: 2
    *id116: 1
  product: *id117
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 2
    *id085: 2
    *id011: 2
    *id116: 2
  product: *id118
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 1
    *id085: 2
    *id011: 2
    *id119: 1
  product: *id120
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 2
    *id121: 2
    *id085: 2
    *id011: 2
    *id122: 1
  product: *id123
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 3
    *id121: 3
    *id085: 3
    *id011: 3
    *id122: 2
  product: *id124
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id125: 1
    *id034: 2
    *id121: 2
    *id085: 2
    *id011: 2
  product: *id126
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 3
    *id085: 2
    *id011: 10
    *id075: 2
    *id127: 1
    *id020: 1
  product: *id128
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id085: 4
    *id011: 10
    *id075: 2
    *id127: 2
    *id020: 2
  product: *id129
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id130: 1
    *id034: 3
    *id085: 2
    *id011: 10
    *id131: 2
    *id020: 1
  product: *id132
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id133: 1
    *id085: 4
    *id004: 4
    *id011: 4
    *id134: 4
  product: *id135
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 6
    *id133: 2
    *id085: 6
    *id004: 6
    *id011: 6
    *id134: 6
  product: *id136
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 3
    *id043: 2
    *id137: 5
    *id085: 4
    *id004: 6
    *id138: 1
  product: *id139
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id043: 3
    *id137: 7
    *id085: 5
    *id004: 8
    *id138: 2
  product: *id140
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 3
    *id043: 2
    *id137: 5
    *id141: 1
    *id085: 4
    *id004: 6
  product: *id142
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id143: 1
    *id034: 6
    *id043: 6
    *id085: 4
    *id011: 6
    *id020: 6
  product: *id144
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id043: 4
    *id085: 4
    *id004: 4
    *id011: 4
    *id145: 1
    *id134: 4
  product: *id146
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 4
    *id043: 4
    *id085: 4
    *id004: 4
    *id011: 4
    *id052: 1
    *id147: 1
  product: *id148
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id034: 6
    *id043: 6
    *id085: 6
    *id004: 6
    *id011: 6
    *id052: 1
    *id147: 2
  product: *id149
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id151: 1
  product: *id005
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id152: 1
  product: *id007
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id153: 1
  product: *id009
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id154: 1
  product: *id012
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id155: 1
  product: *id014
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id156: 1
  product: *id016
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id157: 1
    *id158: 1
  product: *id035
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id159: 1
    *id158: 2
  product: *id037
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 3
    *id160: 1
    *id158: 3
  product: *id039
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id158: 4
    *id161: 1
  product: *id041
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id158: 1
    *id162: 1
  product: *id028
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id158: 2
    *id163: 1
  product: *id031
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id164: 1
    *id165: 1
    *id166: 1
  product: *id062
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 3
    *id165: 1
    *id167: 1
    *id166: 2
  product: *id064
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id168: 1
    *id165: 2
    *id166: 3
  product: *id066
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id169: 1
    *id158: 2
    *id170: 1
  product: *id018
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 3
    *id169: 2
    *id171: 1
    *id158: 2
  product: *id022
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id169: 3
    *id158: 3
    *id172: 1
  product: *id024
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 5
    *id169: 4
    *id173: 1
    *id158: 5
  product: *id026
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id158: 1
    *id165: 1
    *id174: 1
  product: *id053
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 2
    *id175: 1
    *id158: 2
    *id165: 1
  product: *id055
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 3
    *id158: 2
    *id165: 2
    *id176: 1
  product: *id057
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 3
    *id177: 1
    *id158: 3
    *id165: 3
  product: *id059
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id169: 2
    *id165: 1
    *id178: 1
    *id166: 2
  product: *id044
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id169: 2
    *id165: 1
    *id179: 1
    *id166: 2
  product: *id046
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id169: 3
    *id165: 2
    *id180: 1
    *id166: 3
  product: *id048
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 4
    *id169: 4
    *id165: 3
    *id181: 1
    *id166: 4
  product: *id050
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id029: 1
    *id169: 1
    *id182: 1
    *id158: 1
    *id165: 1
  product: *id068
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id029: 1
    *id169: 1
    *id158: 1
    *id165: 1
    *id183: 1
    *id166: 1
  product: *id070
- !ruby/object:Dofus::Recipe 
  ingredients: 
    *id150: 1
    *id029: 1
    *id169: 1
    *id184: 1
    *id158: 1
    *id165: 1
    *id185: 1
    *id166: 1
  product: *id073

  END_RECIPE_DATA

  ITEMS, RECIPES = YAML.load(RECIPE_DATA).values_at('items', 'recipes')
end
