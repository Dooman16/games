shader_type canvas_item;
uniform vec2 hole_center = vec2(0.5, 0.5);
uniform float outer_radius : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 uv = UV;
    float dist = length(uv - hole_center);

    float alpha = 1.0;

    if (outer_radius > 0.0) {
        alpha = smoothstep(0.0, outer_radius, dist);
    }

    COLOR = vec4(0.0, 0.0, 0.0, alpha);
}