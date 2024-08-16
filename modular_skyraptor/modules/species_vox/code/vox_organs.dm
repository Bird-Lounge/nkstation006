/obj/item/organ/internal/eyes/vox
	name = "vox eyes"
	desc = "Hey, why's there three of them?"
	eye_icon_file = 'modular_skyraptor/modules/species_vox/icons/vox_external.dmi'
	eye_icon_state = "voxeyes"
	icon_state = "eyeballs-moth"



// SNOUT
/obj/item/organ/external/snout/vox
	name = "vox snout"
	desc = "Sharp and ferocious.  The mandibles are still twitching."
	icon_state = "snout"

	preference = "feature_vox_snout"

	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/vox

/datum/bodypart_overlay/mutant/snout/vox
	feature_key = "snout_vox"

/datum/bodypart_overlay/mutant/snout/vox/get_global_feature_list()
	return GLOB.snouts_list_vox



// TAILS
/obj/item/organ/external/tail/vox
	name = "vox tail"
	desc = "This seems like you could use it as a whip.  Best not to try, though, lest you lacerate yourself in the confusion."

	preference = "feature_vox_tail"
	wag_flags = !WAG_ABLE

	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/vox

/datum/bodypart_overlay/mutant/tail/vox
	feature_key = "tail_vox"

/datum/bodypart_overlay/mutant/tail/vox/get_global_feature_list()
	return GLOB.tails_list_vox
