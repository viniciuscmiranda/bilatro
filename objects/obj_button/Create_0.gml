event_inherited()

width = 160
height = 64
rad = RADIUS_4

if (!variable_instance_exists(id, "get_props")) {
    get_props = function() {
        return {
            label: "",
            is_disabled: false
        }
    }
}