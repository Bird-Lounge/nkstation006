/// Dirt
/turf/open/misc/sandy_dirt/prairie
	name = "prairie dirt"
	desc = "Dry, cracked dirt that crackles beneath your feet."
	initial_gas_mix = PRAIRIE_GASMIX
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/prairie //stops prairie dirt from getting any more fucked up

/turf/open/misc/sandy_dirt/prairie/Initialize(mapload)
	. = ..()
	set_light(2, 0.6, LIGHT_COLOR_PRAIRIEWORLD)

/// Plating
/turf/open/floor/plating/prairie_world
	icon_state = "plating"
	initial_gas_mix = PRAIRIE_GASMIX
	baseturfs = /turf/open/misc/asteroid/prairie_grass

/turf/open/floor/plating/prairie_world/planetary
	planetary_atmos = TRUE

/turf/open/floor/plating/prairie_world/planetary/Initialize(mapload)
	. = ..()
	set_light(2, 0.6, LIGHT_COLOR_PRAIRIEWORLD)

/// Plating
/turf/open/floor/iron/dark/small/road
	name = "road"
	desc = "Well-laid tiles that ease your weary feet on this hellhole of a gravitational well.  You're pretty sure these are irreplacable, as of now."
	planetary_atmos = TRUE
	slowdown = -0.25

/turf/open/floor/iron/dark/small/road/prairie
	initial_gas_mix = PRAIRIE_GASMIX
	baseturfs = /turf/open/floor/plating/prairie_world

/turf/open/floor/iron/dark/small/road/prairie/Initialize(mapload)
	. = ..()
	set_light(2, 0.6, LIGHT_COLOR_PRAIRIEWORLD)

/// Grass
/turf/open/misc/asteroid/prairie_grass
	gender = PLURAL
	name = "prairie grass"
	desc = "Thick swathes of dry, resilient grass.  It crunches under your steps like fallen leaves."
	icon = 'modular_skyraptor/modules/betterplanets/icons/turf_prairie.dmi'
	icon_state = "prairie_grass"
	base_icon_state = "prairie_grass"
	//damaged_dmi = 'icons/turf/snow.dmi' N/A

	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

	/*var/smooth_icon = 'modular_skyraptor/modules/betterplanets/icons/turf_prairie_grass.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_GRASS
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER*/

	baseturfs = /turf/open/misc/sandy_dirt/prairie
	initial_gas_mix = PRAIRIE_GASMIX
	slowdown = 0
	flags_1 = NONE
	planetary_atmos = TRUE
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	dig_result = null

	/*light_range = 2
	light_power = 0.6
	light_color = LIGHT_COLOR_PRAIRIEWORLD*/

/turf/open/misc/asteroid/prairie_grass/Initialize(mapload)
	. = ..()
	/*if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-9, -9)
		transform = translation
		icon = smooth_icon*/
	icon_state = "[base_icon_state][rand(0,4)]"
	set_light(3, 0.75, LIGHT_COLOR_PRAIRIEWORLD)

/turf/open/misc/asteroid/prairie_grass/planetary
	baseturfs = /turf/open/openspace/prairie

/// Exact subtype as parent, just used in ruins to prevent other ruins/chasms from spawning on top of it.
/turf/open/misc/asteroid/prairie_grass/planetary/do_not_chasm
	turf_flags = CAN_BE_DIRTY_1 | IS_SOLID | NO_RUST | NO_RUINS



/// Chasms
/turf/open/openspace/prairie
	name = "prairie chasm"
	desc = "A hole where the dry, cracked earth has given way.  Watch your step."
	baseturfs = /turf/open/openspace/prairie
	initial_gas_mix = PRAIRIE_GASMIX
	planetary_atmos = TRUE
	/// Replaces itself with replacement_turf if the turf has the no ruins allowed flag (usually ruins themselves)
	var/protect_ruin = TRUE
	/// The turf that will replace this one if the turf below has the no ruins allowed flag. we use this one so we don't get any potential double whammies
	var/replacement_turf = /turf/open/misc/asteroid/prairie_grass/planetary/do_not_chasm
	/// If true mineral turfs below this openspace turf will be mined automatically
	var/drill_below = TRUE

/turf/open/openspace/prairie/Initialize(mapload)
	. = ..()
	var/turf/T = GET_TURF_BELOW(src)
	//I wonder if I should error here
	if(!T)
		return
	if(T.turf_flags & NO_RUINS && protect_ruin)
		ChangeTurf(replacement_turf, null, CHANGETURF_IGNORE_AIR)
		return
	if(!ismineralturf(T) || !drill_below)
		return
	var/turf/closed/mineral/M = T
	M.mineralAmt = 0
	M.gets_drilled()
	baseturfs = /turf/open/openspace/prairie //This is to ensure that IF random turf generation produces a openturf, there won't be other turfs assigned other than openspace.

/turf/open/openspace/prairie/keep_below
	drill_below = FALSE

/turf/open/openspace/prairie/ruins
	protect_ruin = FALSE
	drill_below = FALSE



/// Plasma lava
/turf/open/lava/plasma/prairie
	initial_gas_mix = PRAIRIE_GASMIX_LAVA
	baseturfs = /turf/open/lava/plasma/prairie
	planetary_atmos = TRUE

	name = "scalding liquid plasma"
	desc = "Scalding-hot liquid plasma in the process of evaporating.  You REALLY don't want to touch it."

	light_range = 4
	light_power = 1
	light_color = LIGHT_COLOR_PRAIRIEWORLD_LAVA

	immunity_trait = TRAIT_LAVA_IMMUNE
	immunity_resistance_flags = LAVA_PROOF
	lava_temperature = 666 //spooky

// custom burn code - objects can still burn up, but slower, and livingmobs will still get turned into plasmamen
/turf/open/lava/plasma/prairie/do_burn(atom/movable/burn_target, seconds_per_tick = 1)
	. = TRUE
	if(isobj(burn_target))
		var/obj/burn_obj = burn_target
		if(burn_obj.resistance_flags & ON_FIRE) // already on fire; skip it.
			return
		if(!(burn_obj.resistance_flags & FLAMMABLE))
			burn_obj.resistance_flags |= FLAMMABLE //Even fireproof things burn up in lava
		if(burn_obj.resistance_flags & FIRE_PROOF)
			burn_obj.resistance_flags &= ~FIRE_PROOF
		if(burn_obj.get_armor_rating(FIRE) > 66) //obj with 100% fire armor still get slowly burned away.
			burn_obj.set_armor_rating(FIRE, 66)
		burn_obj.fire_act(temperature_damage, 666 * seconds_per_tick)
		if(istype(burn_obj, /obj/structure/closet))
			var/obj/structure/closet/burn_closet = burn_obj
			for(var/burn_content in burn_closet.contents)
				burn_stuff(burn_content)
		return

	var/mob/living/burn_living = burn_target
	burn_living.adjustFireLoss(2)
	if(QDELETED(burn_living))
		return
	burn_living.adjust_fire_stacks(20) //dipping into a stream of plasma would probably make you more flammable than usual
	burn_living.adjust_bodytemperature(rand(20,35)) //it's scalding hot
	if(!ishuman(burn_living) || SPT_PROB(65, seconds_per_tick))
		return
	var/mob/living/carbon/human/burn_human = burn_living
	var/datum/species/burn_species = burn_human.dna.species
	if(istype(burn_species, /datum/species/plasmaman) || istype(burn_species, /datum/species/android)) //ignore plasmamen/robotic species
		return

	var/list/plasma_parts = list()//a list of the organic parts to be turned into plasma limbs
	var/list/robo_parts = list()//keep a reference of robotic parts so we know if we can turn them into a plasmaman
	for(var/obj/item/bodypart/burn_limb as anything in burn_human.bodyparts)
		if(IS_ORGANIC_LIMB(burn_limb) && burn_limb.limb_id != SPECIES_PLASMAMAN && burn_limb.bodytype | BODYTYPE_HUMANOID) //getting every organic, non-plasmaman limb (augments/androids are immune to this)
			plasma_parts += burn_limb
		if(!IS_ORGANIC_LIMB(burn_limb))
			robo_parts += burn_limb

	burn_human.adjustToxLoss(15, required_biotype = MOB_ORGANIC) // This is from plasma, so it should obey plasma biotype requirements
	burn_human.adjustFireLoss(25)
	if(plasma_parts.len)
		var/obj/item/bodypart/burn_limb = pick(plasma_parts) //using the above-mentioned list to get a choice of limbs
		burn_human.emote("scream")
		var/obj/item/bodypart/plasmalimb
		switch(burn_limb.body_zone) //get plasmaman limb to swap in
			if(BODY_ZONE_L_ARM)
				plasmalimb = new /obj/item/bodypart/arm/left/plasmaman
			if(BODY_ZONE_R_ARM)
				plasmalimb = new /obj/item/bodypart/arm/right/plasmaman
			if(BODY_ZONE_L_LEG)
				plasmalimb = new /obj/item/bodypart/leg/left/plasmaman
			if(BODY_ZONE_R_LEG)
				plasmalimb = new /obj/item/bodypart/leg/right/plasmaman
			if(BODY_ZONE_CHEST)
				plasmalimb = new /obj/item/bodypart/chest/plasmaman
			if(BODY_ZONE_HEAD)
				plasmalimb = new /obj/item/bodypart/head/plasmaman
		burn_human.del_and_replace_bodypart(plasmalimb)
		burn_human.update_body_parts()
		burn_human.emote("scream")
		burn_human.visible_message(span_warning("[burn_human]'s [burn_limb.plaintext_zone] melts down to the bone!"), \
			span_userdanger("You scream out in pain as your [burn_limb.plaintext_zone] melts down to the bone, leaving an eerie plasma-like glow where flesh used to be!"))
	if(!plasma_parts.len && !robo_parts.len) //a person with no potential organic limbs left AND no robotic limbs, time to turn them into a plasmaman
		burn_human.ignite_mob()
		burn_human.set_species(/datum/species/plasmaman)
		burn_human.visible_message(span_warning("[burn_human] bursts into a brilliant purple flame as [burn_human.p_their()] entire body is that of a skeleton!"), \
			span_userdanger("Your senses numb as all of your remaining flesh is turned into a purple slurry, sloshing off your body and leaving only your bones to show in a vibrant purple!"))


/// Walls
/turf/closed/mineral/random/prairie_dirt
	name = "packed dirt"
	desc = "Hard, dry, packed dirt that's tough as rock, yet brittle beyond belief."
	icon = MAP_SWITCH('modular_skyraptor/modules/betterplanets/icons/turf_prairie_dirtwall.dmi', 'modular_skyraptor/modules/betterplanets/icons/turf_prairie.dmi')
	icon_state = "prairie_dirtwall"
	base_icon_state = "mountain_wall"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	canSmoothWith = SMOOTH_GROUP_CLOSED_TURFS
	defer_change = TRUE
	turf_type = /turf/open/misc/asteroid/prairie_grass/planetary
	baseturfs = /turf/open/misc/asteroid/prairie_grass/planetary
	initial_gas_mix = PRAIRIE_GASMIX
	weak_turf = TRUE

/turf/closed/mineral/random/prairie_dirt/Change_Ore(ore_type, random = 0)
	. = ..()
	if(mineralType)
		icon = 'modular_skyraptor/modules/betterplanets/icons/turf_prairie_packedwall.dmi'
		icon_state = "rock_wall-0"
		base_icon_state = "rock_wall"
		smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER

/turf/closed/mineral/random/prairie_dirt/mineral_chances()
	return list(
		/obj/item/stack/ore/bluespace_crystal = 3,
		/obj/item/stack/ore/diamond = 4,
		/obj/item/stack/ore/gold = 8,
		/obj/item/stack/ore/iron = 40,
		/obj/item/stack/ore/plasma = 18,
		/obj/item/stack/ore/silver = 8,
		/obj/item/stack/ore/titanium = 8,
		/obj/item/stack/ore/uranium = 8,
		/turf/closed/mineral/random/prairie_dirt/trapped = 3, //gibtonite has been replaced with indistinguishable ore veins that contain molten-hot liquid plasma below them!  watch your step...
	)

/// Near exact same subtype as parent, just used in ruins to prevent other ruins/chasms from spawning on top of it.
/turf/closed/mineral/random/prairie_dirt/do_not_chasm
	turf_type = /turf/open/misc/asteroid/prairie_grass/planetary/do_not_chasm
	baseturfs = /turf/open/misc/asteroid/prairie_grass/planetary/do_not_chasm
	turf_flags = NO_RUINS

/turf/closed/mineral/random/prairie_dirt/rich
	baseturfs = /turf/open/misc/asteroid/prairie_grass/planetary
	// abundant ore
	mineralChance = 25

/turf/closed/mineral/random/prairie_dirt/trapped
	name = "hot packed dirt"
	desc = "Hard, dry, packed dirt that's tough as rock, yet brittle beyond belief.  This seems to emanate with rich warmth."
	baseturfs = /turf/open/lava/plasma/prairie
	mineralChance = 100

/turf/closed/mineral/random/prairie_dirt/trapped/mineral_chances()
	return list(
		/obj/item/stack/ore/bluespace_crystal = 5,
		/obj/item/stack/ore/diamond = 5,
		/obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/iron = 40,
		/obj/item/stack/ore/plasma = 15,
		/obj/item/stack/ore/silver = 10,
		/obj/item/stack/ore/titanium = 10,
		/obj/item/stack/ore/uranium = 5,
	)
