indexing
	description: "Summary description for {FIELD_CELL}."
	author: "Dmitry Kochelaev"
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_CELL

create
	make

feature {NONE} -- Initialization

	make is
			-- Initialization for `Current'.
		require
			current_state_is_undefinied: state = Void
			states_are_undefinied: states = Void
		local
			empty_state: STATE
			cross_state: STATE
			circle_state: STATE
		do
			states := create {HASH_TABLE[STATE, INTEGER]}.make (10)
			create cross_state.make (1, "Cross")
			create circle_state.make (-1, "Circle")
			create empty_state.make (0, "Empty")
			states.put (empty_state, empty_state.get_state_id)
			states.put (cross_state, cross_state.get_state_id)
			states.put (circle_state, circle_state.get_state_id)
			state := empty_state
		ensure
			states.valid_key (state.get_state_id)
		end

feature -- Command

	make_turn (player: INTEGER) is
			-- makes turn for player
		require
			{GAME}.circle_code = player or {GAME}.cross_code = player
		do
			if state.get_state_id = 0 then
				state := states.item (player)
			end
		end

feature -- Access
	cell_value: INTEGER is
		do
			Result := state.get_state_id
		end


feature {NONE} -- States description

	state: STATE -- Current state
	states: TABLE[STATE, INTEGER] -- All states present in system

feature {NONE} -- Constants
	default_state_id: INTEGER -- Default state id

invariant
	states_exist: states /= Void
	state_is_valid: states.valid_key (state.get_state_id)
end