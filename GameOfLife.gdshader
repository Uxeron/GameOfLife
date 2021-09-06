shader_type canvas_item;

void fragment() {
	const ivec2 offsets[8] = {ivec2(-1, -1), ivec2(0, -1), ivec2(1, -1), ivec2(-1, 0), ivec2(1, 0), ivec2(-1, 1), ivec2(0, 1), ivec2(1, 1)};
	
	ivec2 pos = ivec2(UV / TEXTURE_PIXEL_SIZE);

	int neighbours = 0;
	
	for(int i = 0; i < 8; i++)
		if(texelFetch(TEXTURE, pos + offsets[i], 0).rgb == vec3(1.0))
			neighbours++;
	
	bool live = (texelFetch(TEXTURE, pos, 0).rgb == vec3(1.0));
	
	if (live) {
		if (neighbours < 2) live = false;
		if (neighbours > 3) live = false; 
	} else {
		if (neighbours == 3) live = true; 
	}
	
	COLOR.rgb = live ? vec3(1.0) : vec3(0.0);
}