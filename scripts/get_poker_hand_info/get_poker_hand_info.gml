/// @param {Real} _base_chips
/// @param {Real} _base_mult
/// @param {Real} _chips_per_level
/// @param {Real} _mult_per_level
function PokerHandInfo(
	_base_chips,
	_base_mult,
	_chips_per_level,
	_mult_per_level
) constructor {
	base_chips = _base_chips
	base_mult = _base_mult
	chips_per_level = _chips_per_level
	mult_per_level = _mult_per_level
}

/// @param {Enum.POKER_HANDS} [_poker_hand]
/// @return {Struct.PokerHandInfo}
function get_poker_hand_info(_poker_hand) {
	static _highCardInfo		= new PokerHandInfo(5, 1, 10, 1)
	static _pairInfo			= new PokerHandInfo(10, 2, 15, 1)
	static _twoPairsInfo		= new PokerHandInfo(20, 2, 20, 1)
	static _threeOfAKindInfo	= new PokerHandInfo(30, 3, 20, 2)
	static _straightInfo		= new PokerHandInfo(30, 4, 30, 3)
	static _flushInfo			= new PokerHandInfo(35, 4, 15, 2)
	static _fullHouseInfo		= new PokerHandInfo(40, 4, 25, 2)
	static _fourOfAKindInfo		= new PokerHandInfo(60, 7, 30, 3)
	static _straightFlushInfo	= new PokerHandInfo(100, 8, 40, 4)
	static _fiveOfAKindInfo		= new PokerHandInfo(120, 12, 35, 3)
	static _flushHouseInfo		= new PokerHandInfo(140, 14, 40, 4)
	static _flushFiveInfo		= new PokerHandInfo(160, 16, 50, 3)

	switch(_poker_hand) {
		case POKER_HANDS.HIGH_CARD:			return _highCardInfo
		case POKER_HANDS.PAIR:				return _pairInfo
		case POKER_HANDS.TWO_PAIRS:			return _twoPairsInfo
		case POKER_HANDS.THREE_OF_A_KIND:	return _threeOfAKindInfo
		case POKER_HANDS.STRAIGHT:			return _straightInfo
		case POKER_HANDS.FLUSH:				return _flushInfo
		case POKER_HANDS.FULL_HOUSE:		return _fullHouseInfo
		case POKER_HANDS.FOUR_OF_A_KIND:	return _fourOfAKindInfo
		case POKER_HANDS.STRAIGHT_FLUSH:	return _straightFlushInfo
		case POKER_HANDS.FIVE_OF_A_KIND:	return _fiveOfAKindInfo
		case POKER_HANDS.FLUSH_HOUSE:		return _flushHouseInfo
		case POKER_HANDS.FLUSH_FIVE:		return _flushFiveInfo
		default:							return undefined
	}
}