shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D noise;

void fragment() {
	vec4 col = textureLod(screen_texture, SCREEN_UV + vec2(cos(SCREEN_UV.y * 50.0 + TIME * 5.0) * 0.1, sin(TIME) - 3.0) * 0.005, 0.0);
	vec4 noise_col = texture(noise, UV * 0.1 + vec2(TIME, TIME) * 0.01);
	noise_col = mix(vec4(0.5), vec4(1.0), noise_col);
	noise_col.b *= 2.0;
    COLOR = col * noise_col;
}