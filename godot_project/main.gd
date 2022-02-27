extends Spatial

var cycle: int = 0
var should_fill: bool = false

func _process(_delta: float):
	print(cycle)
	cycle += 1
	
	var voxel_tool: VoxelTool = $VoxelTerrain.get_voxel_tool()
	
	if should_fill:
		voxel_tool.value = 1
	else:
		voxel_tool.value = 0
	
	should_fill = !should_fill
	
	voxel_tool.channel = VoxelBuffer.CHANNEL_TYPE
	voxel_tool.mode = voxel_tool.MODE_SET
	voxel_tool.do_sphere(Vector3(0, 0, 0), 16)
	
	$VoxelTerrain.save_modified_blocks()
