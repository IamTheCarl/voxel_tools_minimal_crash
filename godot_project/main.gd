extends Spatial

var cycle: int = 0

var voxel_stream: VoxelStreamRegionFiles = VoxelStreamRegionFiles.new()

func _init():
	var directory: Directory = Directory.new()
	var _result: int = directory.remove("user://world/regions/lod0/r.0.0.0.vxr")

	voxel_stream.directory = "user://world"

func _process(_delta: float):
	print(cycle)
	cycle += 1

	var buffer: VoxelBuffer = VoxelBuffer.new()

	# Put something in there.
	buffer.create(16, 16, 16)

	# Put something interesting in there.
	for x in buffer.get_size_x() - 1:
		for y in buffer.get_size_y() - 1:
			for z in buffer.get_size_z():
				buffer.set_voxel(randi() % 256, x, y, z)

	voxel_stream.immerge_block(buffer, Vector3(cycle, 0, 0), 0)
