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

// init managers
instance_create_depth(0, 0, 0, pubsub_manager)
instance_create_depth(0, 0, 0, camera_manager)
instance_create_depth(0, 0, 0, sound_manager) 
instance_create_depth(0, 0, 0, mouse_manager) 

// start run
// TODO: only init from main menu
global.run = instance_create_depth(0, 0, 0, run_manager) 
global.round.start()