event_inherited()

// calc elements positions
score_block_h = height * 0.32
gap = SPACE_1
space = SPACE_2

x1 = x - width / 2 + space
x2 = x + width / 2 - space

mult_y1 = y + height / 2 - score_block_h - space
mult_y2 = mult_y1 + score_block_h

chips_y1 = mult_y1 - score_block_h - gap
chips_y2 = chips_y1 + score_block_h 

// create score displays
var _score_y = (chips_y1 + (y - height / 2)) / 2
total_score = instance_create_depth(x, _score_y, depth - 1, obj_score_display)

var _chips_y = chips_y1 + score_block_h / 2
chips_score = instance_create_depth(x, _chips_y, depth - 1, obj_score_display)

var _mult_y = mult_y1 + score_block_h / 2
mult_score = instance_create_depth(x, _mult_y, depth - 1, obj_score_display)
