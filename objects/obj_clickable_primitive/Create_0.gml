is_hovered = false
is_pressed = false
is_disabled = false
is_dragging = false

// init methods
if (!variable_instance_exists(id, "on_click")) {
    on_click = function() { }
}

if (!variable_instance_exists(id, "on_hover_start")) {
    on_hover_start = function() { }
}

if (!variable_instance_exists(id, "on_hover_end")) {
    on_hover_end = function() { }
}