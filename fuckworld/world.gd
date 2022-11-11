extends Node2D
var world_W = 256
var world_H = 256

func _ready():
	
	var tset = load("res://tileSet.tres")
	var tsize = tset.tile_size.y
	
	#tile group
	var group = 64
	#tile num,
	var tileNum_H = world_H/group
	var tileNum_W = world_W/group
	
	var call_hans = Callable(self, "set_tilemm")

	for num_W in tileNum_W:
		for num_H in tileNum_H:
			var xianc = Thread.new()
			var call_bind = call_hans.bind(num_W,num_H,tsize,group,tset)
			xianc.start(call_bind)
			zidian.append(xianc)

func set_tilemm(num_W,num_H,tsize,group,tset):
	var tile = TileMap.new()
	tile.tile_set = tset
	tile.position = Vector2(num_W*tsize*group,num_H*tsize*group)
	for x in 64:
		for y in 64:
			tile.set_cell(0,Vector2i(x,y),0,Vector2i(0,0),0)
	#self.add_child(tile,true,1)
	self.call_deferred("add_child",tile,true,1)
	
var zidian:Array
func _exit_tree():
	for x in zidian:
		x.wait_to_finish()
