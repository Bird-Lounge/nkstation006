/obj/machinery/telecomms/bus/prairie
	id = "PrairieOutpost Bus"
	network = "tcommsat"
	freq_listening = list()
	autolinkers = list()

/obj/machinery/telecomms/bus/prairie/preset_one
	id = "PrairieOutpost Bus 1"
	network = "tcommsat"
	freq_listening = list(FREQ_COMMAND, FREQ_SECURITY, FREQ_SCIENCE, FREQ_MEDICAL)
	autolinkers = list("processor1", "command", "security", "science", "medical")

/obj/machinery/telecomms/bus/prairie/preset_two
	id = "PrairieOutpost Bus 2"
	network = "tcommsat"
	freq_listening = list(FREQ_COMMON, FREQ_ENGINEERING, FREQ_SUPPLY, FREQ_SERVICE)
	autolinkers = list("processor2", "common", "engineering", "supply", "service", "messaging")

/obj/machinery/telecomms/server/pairie_presets/civvie
	id = "Civilian Server"
	freq_listening = list()
	autolinkers = list("common", "service")

/obj/machinery/telecomms/server/pairie_presets/command
	id = "Command-Sec Server"
	freq_listening = list()
	autolinkers = list("command", "security")

/obj/machinery/telecomms/server/pairie_presets/engisupply
	id = "Engi-Supply Server"
	freq_listening = list()
	autolinkers = list("engineering", "supply")

/obj/machinery/telecomms/server/pairie_presets/medsci
	id = "Med-Sci Server"
	freq_listening = list()
	autolinkers = list("medical", "science")

/obj/machinery/telecomms/receiver/preset_prairie
	id = "Receiver"
	network = "tcommsat"
	autolinkers = list("receiverA") // link to relay
	freq_listening = list(FREQ_COMMON, FREQ_COMMAND, FREQ_ENGINEERING, FREQ_SECURITY, FREQ_MEDICAL, FREQ_SCIENCE, FREQ_SUPPLY, FREQ_SERVICE)

/obj/machinery/telecomms/receiver/preset_prairie/Initialize(mapload)
	. = ..()
	// Also add common and other freely-available radio frequencies for people
	// to have access to.
	for(var/i = MIN_FREQ, i <= MAX_FREQ, i += 2)
		freq_listening |= i

/obj/machinery/telecomms/broadcaster/preset_prairie
	id = "Broadcaster"
	network = "tcommsat"
	autolinkers = list("broadcasterA")
