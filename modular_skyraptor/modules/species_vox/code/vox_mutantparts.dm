// == SECTION 1: SNOUTS ==
GLOBAL_LIST_EMPTY(snouts_list_vox)

/datum/mutant_spritecat/vox_snout
	name = "Vox Snouts"
	id = "snout_vox"
	sprite_acc = /datum/sprite_accessory/snouts/vox
	default = "Standard"

/datum/mutant_spritecat/vox_snout/init_jank()
		init_sprite_accessory_subtypes(/datum/sprite_accessory/snouts/vox, GLOB.snouts_list_vox)
		world.log << "CELEBRATE: FOR THE VOX HAVE SNOOTS"
		return ..()

/datum/sprite_accessory/snouts/vox
	icon = 'modular_skyraptor/modules/species_vox/icons/vox_external.dmi'
	em_block = TRUE
	hasinner = TRUE
	inner_color_src = SPRITE_ACC_SCRIPTED_COLOR

/datum/sprite_accessory/snouts/vox/innercolor_override(mob/living/carbon/human/target)
	if(!isnull(target))
		var/col = target.dna.features["tricolor-a1"]
		if(!isnull(col))
			return col
		else
			return COLOR_WHITE
	else
		return COLOR_WHITE

/datum/sprite_accessory/snouts/vox/standard
	name = "Standard"
	icon_state = "standard"
	hasinner = TRUE


/datum/mutant_newdnafeature/vox_snout
	name = "Vox Snout DNA"
	id = "snout_vox"

/datum/mutant_newdnafeature/vox_snout/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_SNOUT_BLOCK] = construct_block(GLOB.snouts_list_vox.Find(features[id]), GLOB.snouts_list_vox.len)
	return ..()

/datum/mutant_newdnafeature/vox_snout/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.snouts_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_SNOUT_BLOCK), GLOB.snouts_list_vox.len)]
	return ..()



// == SECTION 2: BODYMARKINGS TESTING ==
GLOBAL_LIST_EMPTY(bodymarks_list_vox)

/datum/mutant_spritecat/vox_bodymarks
	name = "Vox Bodymarks"
	id = "bodymarks_vox"
	sprite_acc = /datum/sprite_accessory/body_markings/vox
	default = "Plates"

/datum/mutant_spritecat/vox_bodymarks/init_jank()
		init_sprite_accessory_subtypes(/datum/sprite_accessory/body_markings/vox, GLOB.bodymarks_list_vox)
		world.log << "CELEBRATE: FOR THE VOX HAVE BODY MARKINGS"
		return ..()

/datum/sprite_accessory/body_markings/vox
	icon = 'modular_skyraptor/modules/species_vox/icons/vox_external.dmi'
	color_src = SPRITE_ACC_SCRIPTED_COLOR

/datum/sprite_accessory/body_markings/vox/color_override(mob/living/carbon/human/target)
	if(!isnull(target))
		var/col = target.dna.features["tricolor-a1"]
		if(!isnull(col))
			return col
		else
			return COLOR_WHITE
	else
		return COLOR_WHITE

/datum/sprite_accessory/body_markings/vox/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/body_markings/vox/plates
	name = "Plates"
	icon_state = "plates"
	gender_specific = 0



// == SECTION 2.1: SLUGCAT BODYMARKING PART TWO==
/datum/mutant_newmutantpart/bodymarks_vox
	name = "vox body markings"
	id = "bodymarks_vox"

/datum/mutant_newmutantpart/bodymarks_vox/get_accessory(var/bodypart, var/features)
	..()
	if(bodypart == "bodymarks_vox")
		return GLOB.bodymarks_list_vox[features["bodymarks_vox"]]
	else
		return FALSE


/datum/mutant_newdnafeature/vox_bodymark
	name = "Vox Body Pattern DNA"
	id = "bodymarks_vox"

/datum/mutant_newdnafeature/vox_bodymark/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_LIZARD_MARKINGS_BLOCK] = construct_block(GLOB.bodymarks_list_vox.Find(features[id]), GLOB.bodymarks_list_vox.len)
	return ..()

/datum/mutant_newdnafeature/vox_bodymark/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.bodymarks_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_MARKINGS_BLOCK), GLOB.bodymarks_list_vox.len)]
		dna.features["body_markings"] = GLOB.bodymarks_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_MARKINGS_BLOCK), GLOB.bodymarks_list_vox.len)]
	return ..()



// == SECTION 4: TAILS ==
GLOBAL_LIST_EMPTY(tails_list_vox)
/datum/mutant_spritecat/vox_tails
	name = "Vox Tails"
	id = "tail_vox"
	sprite_acc = /datum/sprite_accessory/tails/vox
	default = "Standard"

/datum/mutant_spritecat/vox_tails/init_jank()
		init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/vox, GLOB.tails_list_vox)
		world.log << "CELEBRATE: FOR THE VOX HAVE TAILS"
		return ..()

/datum/sprite_accessory/tails/vox
	icon = 'modular_skyraptor/modules/species_vox/icons/vox_tails.dmi'
	hasinner = TRUE
	inner_color_src = SPRITE_ACC_SCRIPTED_COLOR

/datum/sprite_accessory/tails/vox/innercolor_override(mob/living/carbon/human/target)
	if(!isnull(target))
		var/col = target.dna.features["tricolor-a1"]
		if(!isnull(col))
			return col
		else
			return COLOR_WHITE
	else
		return COLOR_WHITE

/datum/sprite_accessory/tails/vox/talon
	name = "Talon"
	icon_state = "talon"

/datum/mutant_newdnafeature/vox_tail
	name = "Vox Tails DNA"
	id = "tail_vox"

/datum/mutant_newdnafeature/vox_tail/gen_unique_features(var/features, var/L)
	if(features[id])
		L[DNA_LIZARD_TAIL_BLOCK] = construct_block(GLOB.tails_list_vox.Find(features[id]), GLOB.tails_list_vox.len)
	return ..()

/datum/mutant_newdnafeature/vox_tail/update_appear(var/datum/dna/dna, var/features)
	if(dna.features[id])
		dna.features[id] = GLOB.tails_list_vox[deconstruct_block(get_uni_feature_block(features, DNA_LIZARD_TAIL_BLOCK), GLOB.tails_list_vox.len)]
	return ..()
