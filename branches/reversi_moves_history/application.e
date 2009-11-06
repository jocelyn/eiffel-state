indexing
	description	: "Application class for Reversi."
	author		: "Generated by the New Vision2 Application Wizard."
	date		: "$Date: 2009/11/1 15:24:55 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION
	ENVIRONMENT
		undefine
			default_create,
			copy
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch is
			-- Initialize and launch application
		do
			default_create
			gui := gui_manager
			game_mgr := game_manager
			game_mgr.restart
			gui.show_first_window
			launch
		end

feature {NONE} -- Implementation
	gui: GUI_MANAGER
	game_mgr: GAME_MANAGER

end -- class APPLICATION