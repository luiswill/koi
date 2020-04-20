extends Node

var currency = " ¥"

var koi_visiting_animation = "res://animations/visiting/animationVisiting1.tscn"
var koi_taming_animation = "res://animations/taming/animationTaming1.tscn"


# LEVEL XP
var LEVEL_XPS = [0, 100, 200, 300, 400, 1000, 5000, 10000]


#Appearing Module
# ouf ot 100%
var PROB_1 = 50 
var PROB_2 = 80
var PROB_3 = 90
var PROB_4 = 95
var PROB_5 = 99

var PROB_APPEARING : int = 100 #1, APPEARING_PROB randomInt
var STARTING_PROBABILITY_OF_BEING_TAMED : int = 100 # 50% of 100 to stay in the pond
var PROBABILITY_ADDED_TO_GET_TAMED_IF_PLANT_EXISTS : int = 5 # out of 100%
var EXP_ADDED_IF_ALREADY_UNLOCKED : int = 5
var EXP_ADDED_IF_NEW_UNLOCKED : int = 50
