/// @description Score
if (array_length(scoring_cards) < 1) exit

// trigger top card
curr_card = array_shift(scoring_cards)
curr_card.trigger()