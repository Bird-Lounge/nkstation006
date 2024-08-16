/proc/generate_vox_side_shot(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/icon/vox
	var/static/icon/vox_with_snout

	if (isnull(vox))
		vox = icon('modular_skyraptor/modules/species_vox/icons/bodyparts.dmi', "vox_head", EAST)
		var/icon/eyes = icon('modular_skyraptor/modules/species_vox/icons/vox_external.dmi', "voxeyes", EAST)
		eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
		vox.Blend(eyes, ICON_OVERLAY)

		vox_with_snout = icon(vox)
		vox_with_snout.Blend(icon('modular_skyraptor/modules/species_vox/icons/vox_external.dmi', "m_snout_vox_standard_ADJ", EAST), ICON_OVERLAY)

	var/icon/final_icon = include_snout ? icon(vox_with_snout) : icon(vox)

	if (!isnull(sprite_accessory))
		var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
		final_icon.Blend(accessory_icon, ICON_OVERLAY)

	final_icon.Crop(11, 20, 23, 32)
	final_icon.Scale(32, 32)
	final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)

	return final_icon






//== SNOUT
/datum/preference/choiced/vox_snout
	savefile_key = "feature_vox_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/snout/vox

/datum/preference/choiced/vox_snout/init_possible_values()
	return assoc_to_keys_features(GLOB.snouts_list_vox)

/datum/preference/choiced/vox_snout/icon_for(value)
	return generate_vox_side_shot(GLOB.snouts_list_vox[value], "snout_vox", include_snout = TRUE)

/datum/preference/choiced/vox_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_vox"] = value

/datum/preference/choiced/vox_snout/create_default_value()
	var/datum/sprite_accessory/snouts/vox/standard/snout = /datum/sprite_accessory/snouts/vox/standard
	return initial(snout.name)


/datum/mutant_newdnafeature/snouts_vox
	name = "Vox snout"
	id = "snout_vox"

/datum/mutant_newdnafeature/snouts_vox/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_SNOUT_BLOCK] = construct_block(GLOB.snouts_list_vox.Find(features[id]), GLOB.snouts_list_vox.len)

/datum/mutant_newdnafeature/snouts_vox/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.snouts_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_SNOUT_BLOCK), GLOB.snouts_list_vox.len)]



//== TAIL
/datum/preference/choiced/vox_tail
	savefile_key = "feature_vox_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/vox
	main_feature_name = "Tail"
	should_generate_icons = FALSE

/datum/preference/choiced/vox_tail/init_possible_values()
	return assoc_to_keys_features(GLOB.tails_list_vox)

/datum/preference/choiced/vox_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_vox"] = value

/datum/preference/choiced/vox_tail/create_default_value()
	var/datum/sprite_accessory/tails/vox/talon/tail = /datum/sprite_accessory/tails/vox/talon
	return initial(tail.name)


/datum/mutant_newdnafeature/tail_vox
	name = "Vox tail"
	id = "tail_vox"

/datum/mutant_newdnafeature/tail_vox/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_LIZARD_TAIL_BLOCK] = construct_block(GLOB.tails_list_vox.Find(features[id]), GLOB.tails_list_vox.len)

/datum/mutant_newdnafeature/tail_vox/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.tails_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_TAIL_BLOCK), GLOB.tails_list_vox.len)]



//== BODY MARKINGS
/datum/preference/choiced/vox_body_markings
	savefile_key = "feature_vox_body_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Body markings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "bodymarks_vox"

/datum/preference/choiced/vox_body_markings/init_possible_values()
	return assoc_to_keys_features(GLOB.bodymarks_list_vox)

/datum/preference/choiced/vox_body_markings/icon_for(value)
	var/datum/sprite_accessory/sprite_accessory = GLOB.bodymarks_list_vox[value]
	var/icon/final_icon = icon('modular_skyraptor/modules/species_vox/icons/bodyparts.dmi', "vox_chest_m")

	if (sprite_accessory.icon_state != "none")
		var/icon/body_markings_icon = icon(
			'modular_skyraptor/modules/species_vox/icons/vox_external.dmi',
			"m_bodymarks_vox_[sprite_accessory.icon_state]_ADJ",
		)
		body_markings_icon.Blend(COLOR_VIBRANT_LIME, ICON_MULTIPLY)
		final_icon.Blend(body_markings_icon, ICON_OVERLAY)
		if(sprite_accessory.hasinner)
			var/icon/body_markings_innericon = icon(
				'modular_skyraptor/modules/species_vox/icons/vox_external.dmi',
				"m_bodymarks_voxinner_[sprite_accessory.icon_state]_ADJ",
			)
			body_markings_innericon.Blend(COLOR_RED, ICON_MULTIPLY)
			final_icon.Blend(body_markings_innericon, ICON_OVERLAY)
		if(sprite_accessory.hasinner2)
			var/icon/body_markings_innericon = icon(
				'modular_skyraptor/modules/species_vox/icons/vox_external.dmi',
				"m_bodymarks_voxinner2_[sprite_accessory.icon_state]_ADJ",
			)
			body_markings_innericon.Blend(COLOR_BLUE, ICON_MULTIPLY)
			final_icon.Blend(body_markings_innericon, ICON_OVERLAY)

	final_icon.Blend(COLOR_WHITE, ICON_MULTIPLY)
	final_icon.Crop(10, 8, 22, 23)
	final_icon.Scale(26, 32)
	final_icon.Crop(-2, 1, 29, 32)

	return final_icon

/datum/preference/choiced/vox_body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["bodymarks_vox"] = value


/datum/mutant_newdnafeature/bodymarks_vox
	name = "Vox body markings"
	id = "bodymarks_vox"

/datum/mutant_newdnafeature/bodymarks_vox/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_LIZARD_MARKINGS_BLOCK] = construct_block(GLOB.bodymarks_list_vox.Find(features[id]), GLOB.bodymarks_list_vox.len)

/datum/mutant_newdnafeature/bodymarks_vox/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.bodymarks_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_MARKINGS_BLOCK), GLOB.bodymarks_list_vox.len)]
