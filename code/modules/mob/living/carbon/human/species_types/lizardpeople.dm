/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "\improper Lizardperson"
	plural_form = "Lizardfolk"
	id = SPECIES_LIZARD
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_TACKLING_TAILED_DEFENDER,
		USE_TRICOLOR_ALPHA, /// SKYRAPTOR ADDITIONS
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutant_bodyparts = list("bodymarks_lizard" = "None", "legs" = "Normal Legs") //SKYRAPTOR EDITS: bodymarks_lizard from body_markings, new lizard subtypes for stability
	external_organs = list(
		/obj/item/organ/external/horns/lizard = "None",
		/obj/item/organ/external/frills/lizard = "None",
		/obj/item/organ/external/snout = "Round",
		/obj/item/organ/external/spines = "None",
		/obj/item/organ/external/tail/lizard = "Smooth",
	)
	mutanttongue = /obj/item/organ/internal/tongue/lizard
	coldmod = 1.5
	heatmod = 0.67
	payday_modifier = 1.0
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_cookie = /obj/item/food/meat/slab
	meat = /obj/item/food/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	exotic_bloodtype = "L"
	inert_mutation = /datum/mutation/human/firebreath
	death_sound = 'sound/voice/lizard/deathsound.ogg'
	species_language_holder = /datum/language_holder/lizard
	digitigrade_customization = DIGITIGRADE_OPTIONAL

	// Lizards are coldblooded and can stand a greater temperature range than humans
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_LAVALAND_SAFE
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT - 10)

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard,
	)

/datum/species/lizard/on_species_gain(mob/living/carbon/new_lizard, datum/species/old_species, pref_load)
	. = ..()
	if(ishuman(new_lizard))
		update_mail_goodies(new_lizard)

/datum/species/lizard/update_quirk_mail_goodies(mob/living/carbon/human/recipient, datum/quirk/quirk, list/mail_goodies = list())
	if(istype(quirk, /datum/quirk/blooddeficiency))
		mail_goodies += list(
			/obj/item/reagent_containers/blood/lizard
		)
	return ..()

/// Lizards are cold blooded and do not stabilize body temperature naturally
/datum/species/lizard/body_temperature_core(mob/living/carbon/human/humi, seconds_per_tick, times_fired)
	return

/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname


/datum/species/lizard/randomize_features()
	var/list/features = ..()
	features["body_markings"] = pick(GLOB.body_markings_list)
	return features

/datum/species/lizard/get_scream_sound(mob/living/carbon/human/lizard)
	return pick(
		'sound/voice/lizard/lizard_scream_1.ogg',
		'sound/voice/lizard/lizard_scream_2.ogg',
		'sound/voice/lizard/lizard_scream_3.ogg',
	)

/datum/species/lizard/get_physical_attributes()
	return "Lizardpeople can withstand slightly higher temperatures than most species, but they are very vulnerable to the cold \
		and can't regulate their body-temperature internally, making the vacuum of space extremely deadly to them."

/datum/species/lizard/get_species_description()
	return "The militaristic Lizardpeople hail originally from Tizira, but have grown \
		throughout their centuries in the stars to possess a large spacefaring \
		empire: though now they must contend with their younger, more \
		technologically advanced Human neighbours."

/datum/species/lizard/get_species_lore()
	return list(
		"The face of conspiracy theory was changed forever the day mankind met the lizards.",

		"Hailing from the arid world of Tizira, lizards were travelling the stars back when mankind was first discovering how neat trains could be. \
		However, much like the space-fable of the space-tortoise and space-hare, lizards have rejected their kin's motto of \"slow and steady\" \
		in favor of resting on their laurels and getting completely surpassed by 'bald apes', due in no small part to their lack of access to plasma.",

		"The history between lizards and humans has resulted in many conflicts that lizards ended on the losing side of, \
		with the finale being an explosive remodeling of their moon. Today's lizard-human relations are seeing the continuance of a record period of peace.",

		"Lizard culture is inherently militaristic, though the influence the military has on lizard culture \
		begins to lessen the further colonies lie from their homeworld - \
		with some distanced colonies finding themselves subsumed by the cultural practices of other species nearby.",

		"On their homeworld, lizards celebrate their 16th birthday by enrolling in a mandatory 5 year military tour of duty. \
		Roles range from combat to civil service and everything in between. As the old slogan goes: \"Your place will be found!\"",
	)

/// SKYRAPTOR EDIT BEGIN

/datum/species/lizard/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	world.log << "SKYRAPTOR ALERT: SETTING UP LIZARD PREVIEW"
	var/obj/item/organ/external/snout_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/snout)
	if(snout_tmp)
		snout_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/snouts/lizard/sharplight)
		snout_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/snouts/lizard/sharplight()
	else
		world.log << "SKYRAPTOR ERROR: LIZARD PREVIEW IS MISSING ITS SNOUT!"
	var/obj/item/organ/external/horns_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/horns/lizard)
	if(horns_tmp)
		horns_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/horns/lizard/ram)
		horns_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/horns/lizard/ram()
	else
		world.log << "SKYRAPTOR ERROR: LIZARD PREVIEW IS MISSING ITS HORNS!"
	var/obj/item/organ/external/frills_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/frills/lizard)
	if(frills_tmp)
		frills_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/frills/lizard/aquatic)
		frills_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/frills/lizard/aquatic()
	else
		world.log << "SKYRAPTOR ERROR: LIZARD PREVIEW IS MISSING ITS FRILLS!"
	var/obj/item/organ/external/spines_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/spines)
	if(spines_tmp)
		spines_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/spines/none)
		spines_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/spines/none()
	else
		world.log << "SKYRAPTOR ERROR: LIZARD PREVIEW IS MISSING ITS SPINES!"
	human_for_preview.update_body_parts()

/// SKYRAPTOR EDIT END

// Override for the default temperature perks, so we can give our specific "cold blooded" perk.
/datum/species/lizard/create_pref_temperature_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "thermometer-empty",
		SPECIES_PERK_NAME = "Cold-blooded",
		SPECIES_PERK_DESC = "Lizardpeople have higher tolerance for hot temperatures, but lower \
			tolerance for cold temperatures. Additionally, they cannot self-regulate their body temperature - \
			they are as cold or as warm as the environment around them is. Stay warm!",
	))

	return to_add

/*
Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	id = SPECIES_LIZARD_ASH
	examine_limb_id = SPECIES_LIZARD
	mutantlungs = /obj/item/organ/internal/lungs/lavaland
	mutantbrain = /obj/item/organ/internal/brain/primitive
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_VIRUSIMMUNE,
		TRAIT_FORBID_MINING_SHUTTLE_CONSOLE_OUTSIDE_STATION,
	)
	species_language_holder = /datum/language_holder/lizard/ash
	digitigrade_customization = DIGITIGRADE_FORCED
	examine_limb_id = SPECIES_LIZARD
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard/ashwalker,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard/ashwalker,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard,
	)

/datum/species/lizard/ashwalker/get_physical_attributes()
	return "Ash Walkers are identical to lizardpeople in almost all aspects. \
		Unlike them, they're always digitigrade, they can breathe Lavaland's often noxious atmosphere and resist viruses. They are usually illiterate."

/*
Lizard subspecies: SILVER SCALED
*/
/datum/species/lizard/silverscale
	name = "Silver Scale"
	id = SPECIES_LIZARD_SILVER
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	inherent_traits = list(
		TRAIT_HOLY,
		TRAIT_NOBREATH,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_VIRUSIMMUNE,
		TRAIT_WINE_TASTER,
	)
	mutantlungs = null
	damage_modifier = 10 //very light silvery scales soften blows
	species_language_holder = /datum/language_holder/lizard/silver
	mutanttongue = /obj/item/organ/internal/tongue/lizard/silver
	changesource_flags = MIRROR_BADMIN | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
	examine_limb_id = SPECIES_LIZARD
	///stored mutcolor for when we turn back off of a silverscale.
	var/old_mutcolor
	///stored eye color for when we turn back off of a silverscale.
	var/old_eye_color_left
	///See above
	var/old_eye_color_right

/datum/species/lizard/silverscale/get_physical_attributes()
	return "Silver Scales are to lizardpeople what angels are to humans. \
		Mostly identical, they are holy, don't breathe, don't get viruses, their hide cannot be pierced, love the taste of wine, \
		and their tongue allows them to turn into a statue, for some reason."

/datum/species/lizard/silverscale/on_species_gain(mob/living/carbon/human/new_silverscale, datum/species/old_species, pref_load)
	old_mutcolor = new_silverscale.dna.features["mcolor"]
	old_eye_color_left = new_silverscale.eye_color_left
	old_eye_color_right = new_silverscale.eye_color_right
	new_silverscale.dna.features["mcolor"] = "#eeeeee"
	new_silverscale.eye_color_left = "#0000a0"
	new_silverscale.eye_color_right = "#0000a0"
	. = ..()
	new_silverscale.add_filter("silver_glint", 2, list("type" = "outline", "color" = "#ffffff63", "size" = 2))

/datum/species/lizard/silverscale/on_species_loss(mob/living/carbon/human/was_silverscale, datum/species/new_species, pref_load)
	was_silverscale.dna.features["mcolor"] = old_mutcolor
	was_silverscale.eye_color_left = old_eye_color_left
	was_silverscale.eye_color_right = old_eye_color_right
	was_silverscale.remove_filter("silver_glint")
	return ..()
