extends TileMap

var GridSize = 10
var Dic = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in GridSize:
		for y in GridSize:
			Dic[str(Vector2(x,y))] = {"Type": "Tile"}
			set_cell(0, Vector2(x,y), 1, Vector2i(2,2),0)
