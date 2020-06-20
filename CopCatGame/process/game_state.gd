extends Node


var PlayerCharacter:KinematicBody2D
var ScoreModifire: int
var defaultSM: int
var gamePaused: bool

func reset_SM():
	ScoreModifire = defaultSM

func double_SM():
	ScoreModifire *= 2

func get_SM():
	return ScoreModifire

#func game_pausing(mode):
#	if (mode == 1):
#		gamePaused = true
#	elif (mode == 0):
#		gamePaused = false
