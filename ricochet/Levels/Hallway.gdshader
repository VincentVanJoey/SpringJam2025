shader_type canvas_item;

uniform vec4 color_start = vec4(1.0, 1.0, 0.0, 1.0); // Red
uniform vec4 color_end = vec4(0.0, 0.0, 1.0, 0.0);   // Blue
uniform float speed = 1.0;  // Scrolling speed
uniform float scale = 1.0;  // Gradient scale

void fragment() {
    float gradient = mod(UV.y * scale + TIME * speed, 1.0);
    COLOR = mix(color_start, color_end, gradient);
}