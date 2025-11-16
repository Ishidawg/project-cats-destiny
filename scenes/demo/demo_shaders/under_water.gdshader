shader_type canvas_item;

// The shader will run for every pixel on the screen
// Break down code:
// uniform = means that the variable will be the same for every time the shader runs, is like a const in common languages
// samples2D = variable type that means texture
uniform sampler2D screen_texture:hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D noise_texture:repeat_enable;

void fragment() {
	// vec3 is used for a point in 3d space with x, y and z values, but in this case I'm usin to store red, green and blue values.
	vec3 noise_color = texture(noise_texture, SCREEN_UV + (TIME / 20.0)).rgb;
	vec3 color = texture(screen_texture, SCREEN_UV + noise_color.b /20.0).rgb;

	COLOR.rgb = color;
}