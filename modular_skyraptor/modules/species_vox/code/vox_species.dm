/datum/species/vox
	// Slugcats from Rain World, revamped to fit into
	name = "\improper Vox"
	plural_form = "\improper Vox"
	id = SPECIES_VOX
	//old traits as we migrate to the new setup
	/*species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		HAIR,
		LIPS,
		USE_TRICOLOR_ALPHA,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTCOLD,
	)*/
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_TACKLING_TAILED_DEFENDER,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTCOLD,
		USE_TRICOLOR_ALPHA,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	species_language_holder = /datum/language_holder/synthetic

	mutant_bodyparts = list("bodymarks_vox" = "None")
	external_organs = list(
		/obj/item/organ/external/snout/vox = "Standard",
		/obj/item/organ/external/tail/vox = "Talon",
	)
	mutanteyes = /obj/item/organ/internal/eyes/vox

	coldmod = 0.5
	heatmod = 1.5

	bodytemp_normal = BODYTEMP_NORMAL - 30
	bodytemp_heat_damage_limit = BODYTEMP_NORMAL + 10
	bodytemp_cold_damage_limit = BODYTEMP_NORMAL - 70

	payday_modifier = 1 //we're going to be doing a master_files override to universally set payday mod to 1 bcuz it's still some serious wtfery

	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	// NOTE- subtype tongue/ and add mutanttongue to replace these later
	//disliked_food = JUNKFOOD | BUGS
	//liked_food = MEAT | SEAFOOD
	//scugs have forced digi thru custom legs, this is necessary until we rework the digi_customization setting to allow for other digileg types
	//digitigrade_customization = DIGITIGRADE_FORCED

	ass_image = 'icons/ass/asslizard.png' //one day this system gets deleted.  one day...

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/vox,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/vox,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/vox,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/vox,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/digitigrade/vox,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/digitigrade/vox,
	)

/datum/species/vox/random_name(gender,unique,lastname)
	return "Pick your own name!"

/datum/species/vox/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.undershirt = random_undershirt(human_mob.gender)
	human_mob.underwear = random_underwear(human_mob.gender)
	human_mob.socks = random_socks(human_mob.gender)
	human_mob.hairstyle = random_hairstyle(human_mob.gender)

/datum/species/vox/get_scream_sound(mob/living/carbon/human/lizard)
	return pick(
		'modular_skyraptor/modules/species_vox/sounds/voxscream_1.ogg',
	)

/datum/species/vox/on_species_gain(mob/living/carbon/carbon_being, datum/species/old_species, pref_load)
	// so far i don't think they need any special abilities here
	return ..()


/// Pretty UI stuff goes here.
/datum/species/vox/prepare_human_for_preview(mob/living/carbon/human/human_for_preview)
	/*human_for_preview.hairstyle = "Messy"
	human_for_preview.hair_color = "#365904"
	human_for_preview.dna.features["mcolor"] = "#87a629"
	human_for_preview.eye_color_left = "#39c9e6"
	human_for_preview.eye_color_right = "#ffd659"*/
	var/obj/item/organ/external/snout_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/snout/vox)
	if(snout_tmp)
		snout_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/snouts/vox/standard)
		snout_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/snouts/vox/standard() //do NOT do this this is bad and ugly
	var/obj/item/organ/external/tail_tmp = human_for_preview.get_organ_by_type(/obj/item/organ/external/tail/vox)
	if(tail_tmp)
		tail_tmp.bodypart_overlay.set_appearance(/datum/sprite_accessory/tails/vox/talon)
		tail_tmp.bodypart_overlay.sprite_datum = new /datum/sprite_accessory/tails/vox/talon()
	human_for_preview.update_body_parts()

/datum/species/vox/get_species_description()
	return "To be determined."

/datum/species/vox/get_species_lore()
	return list(
		"To be determined.",
	)

/datum/species/vox/create_pref_temperature_perks()
	var/list/to_add = list()

	to_add = list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "thermometer-empty",
			SPECIES_PERK_NAME = "Frigid Native",
			SPECIES_PERK_DESC = "Being native to an icy dwarf planet with only subsurface pockets of atmosphere and water, Akula are resilient to low pressures and temperatures and can walk freely where others would need protective gear.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "thermometer-hot",
			SPECIES_PERK_NAME = "Heat Averse",
			SPECIES_PERK_DESC = "Being good in the cold means suffering in the heat.  Sol standard of 293K is already a bit uncomfortable for them - too much hotter or higher pressure and they suffer, whereas your everyday human might not notice.",
		)
	)

	return to_add
