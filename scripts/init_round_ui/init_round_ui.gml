function init_round_ui() {
	// view port padding
	var _hspace = SPACE_3
	var _vspace = SPACE_3
	
	// distance between ui blocks
	var _hgap = SPACE_3
	var _vgap = SPACE_2

	var _deck_w = sprite_get_width(spr_decks)
	var _deck_h = sprite_get_height(spr_decks)
	var _hand_w = room_width - _hspace * 2 - _deck_w - _hgap
	var _hand_h = _deck_h
	var _hand_deck_hdiff = _hand_h - _deck_h

	var _buttons_gap = SPACE_2
	var _button_w = sprite_get_width(spr_button)
	var _button_h = sprite_get_height(spr_button)

	// deck
	var _deck_x = room_width - _hspace - _deck_w / 2
	var _deck_y = room_height - _vspace - _deck_h / 2  - _button_h - _vgap
	var _deck = instance_create_depth(_deck_x, _deck_y, 0, obj_deck)

	// hand
	var _hand_x = room_width - _hspace - _hand_w / 2 - _deck_w - _hgap
	var _hand_y = room_height - _vspace - _hand_h / 2 - _button_h - _vgap
	var _hand_props = { width: _hand_w, height: _hand_h }
	var _hand = instance_create_depth(_hand_x, _hand_y, 0, obj_hand_block, _hand_props)

	// play button
	var _play_btn_x = _hand_x - _button_w / 2 - _buttons_gap / 2
	var _play_btn_y = room_height - _button_h / 2 - _vspace
	var _play_btn = instance_create_depth(_play_btn_x, _play_btn_y, 0, obj_button, { 
		color: COLOR_PRIMARY_BUTTON,
		label: "Play"
	})
	
	// discard button
	var _discard_btn_x = _hand_x + _button_w / 2 + _buttons_gap / 2
	var _discard_btn_y = _play_btn_y
	var _discard_btn = instance_create_depth(_discard_btn_x, _discard_btn_y, 0, obj_button, { 
		color: COLOR_SECONDARY_BUTTON,
		label: "Discard"
	})

	// items slot
	var _items_w = _deck_w * 2
	var _items_h = _deck_h
	var _items_x = room_width - _hspace - _items_w / 2
	var _items_y = _vspace + _items_h / 2
	var _items_props = { width: _items_w, height: _items_h }
	var _items_slot = instance_create_depth(_items_x, _items_y, 0, obj_items_block, _items_props)

	// jokers slot
	var _jokers_width = room_width - _hspace * 2 - _items_w - _hgap
	var _jokers_height = _hand_h
	var _jokers_x = room_width - _hspace - _jokers_width / 2 - _items_w - _hgap
	var _jokers_y = _vspace + _jokers_height / 2
	var _jokers_props = { width: _jokers_width, height: _jokers_height }
	var _jokers_slot = instance_create_depth(_jokers_x, _jokers_y, 0, obj_jokers_block, _jokers_props)

	// score
	var _items_bottom = _items_y + _items_h / 2
	var _deck_top = _deck_y - _deck_h / 2

	var _score_w = _deck_w
	var _score_h = _deck_top - _items_bottom - _vgap * 2
	var _score_x = _deck_x
	var _score_y = _vspace + _items_h + _vgap + _score_h / 2
	var _score_props = { width: _score_w, height: _score_h }
	var _score_slot = instance_create_depth(_score_x, _score_y, 0, obj_score_block, _score_props)

	var _table_x = _hand_x
	var _table_y = _score_y
	var _table_w = _hand_w
	var _table_h = _score_h
	var _table_props = { width: _table_w, height: _table_h }
	var _table = instance_create_depth(_table_x, _table_y, 0, obj_table_block, _table_props)

	return {
		deck: _deck,
		play_button: _play_btn,
		discard_button: _discard_btn,
		hand_block: _hand,
		jokers_block: _jokers_slot,
		items_block: _items_slot,
		score_block: _score_slot,
		table_block: _table
	}
}