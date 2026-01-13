randomise() 

// init shaders
horrifi_enable(true) 
horrifi_bloom_set(true, 25, 0.1, 0.5) 
horrifi_scanlines_set(true, 0.015) 
horrifi_chromaticab_set(true, 0.1) 
horrifi_noise_set(true, 0.035) 
horrifi_vignette_set(true, 0.08, 1) 

// global settings
global.animation_speed = 1 
global.max_animation_speed = 3 
global.initial_animation_speed = global.animation_speed  
global.master_volume = 1
global.sfx_volume = 0.8 * global.master_volume 
global.music_volume = 0.2 * global.master_volume

// poker hand rules
global.poker_hand_rules = {
	high_card_cards: 1,
	pair_cards: 2,
	three_of_a_kind_cards: 3,
	four_of_a_kind_cards: 4,
	five_of_a_kind_cards: 5,
	flush_cards: 5,
	straight_cards: 5,
	straight_gap: 0
} 

// game settings
global.initial_poker_hands_level = 1 
global.max_selected_cards = 5 
global.initial_ante = 1 
global.initial_round = 1 

// init managers
instance_create_depth(0, 0, 0, pubsub_manager)
instance_create_depth(0, 0, 0, camera_manager)
instance_create_depth(0, 0, 0, sound_manager) 
instance_create_depth(0, 0, 0, mouse_manager) 

// start run
// TODO: only init from main menu
global.run = instance_create_depth(0, 0, 0, run_manager) 
global.round.start()