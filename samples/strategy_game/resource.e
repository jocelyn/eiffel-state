note
	description: "Resources that can be collected and traded."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	RESOURCE

feature -- Access
	creation_time: INTEGER is
			-- Time required to collect resource
		deferred
		end

end