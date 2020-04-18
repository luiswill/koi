extends Node

var currency = " ¥"

var koiVisitingAnimation = "res://animations/move/animationMove1.tscn"


#Appearing Module
# ouf ot 100%
var PROB_1 = 50 
var PROB_2 = 80
var PROB_3 = 90
var PROB_4 = 95
var PROB_5 = 99

var PROB_APPEARING : int = 100 #1, APPEARING_PROB randomInt
var STARTING_PROBABILITY_OF_BEING_TAMED : int = 50 # 50% of 100 to stay in the pond
var PROBABILITY_ADDED_TO_GET_TAMED_IF_PLANT_EXISTS : int = 5 # out of 100%
