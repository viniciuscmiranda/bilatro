shake_intensity = 0
shake_decay = 0.9

subscribe(EVENTS.CARD_TRIGGER, _on_trigger)
subscribe(EVENTS.JOKER_TRIGGER, _on_trigger)

function _on_trigger() {
	shake_intensity = 3
}
