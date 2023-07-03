extends Node2D


var Chunksvis = 2

var t1 = preload("res://terrin/T1.tscn")
var t2 = preload("res://terrin/T2.tscn")
var t3 = preload("res://terrin/T3.tscn")
var t4 = preload("res://terrin/T4.tscn")
var t5 = preload("res://terrin/T5.tscn")
var t6 = preload("res://terrin/T6.tscn")

func _ready():
	randomize()
	generateInitialTerrain()

func generateInitialTerrain():
	for i in range(-Chunksvis, Chunksvis + 1):
		var chunk = t1.instance()
		chunk.set_position(Vector2(i * chunkSize, 0))
		chunk.seed = seed + i
		add_child(chunk)
