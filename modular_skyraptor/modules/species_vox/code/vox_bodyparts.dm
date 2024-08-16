/obj/item/bodypart/head/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = SPECIES_VOX
	is_dimorphic = FALSE
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX

/obj/item/bodypart/head/vox/Initialize(mapload)
	worn_ears_offset = new(
		attached_part = src,
		feature_key = OFFSET_EARS,
		offset_x = list("north" = 0, "south" = 0, "east" = 4, "west" = -4),
		//offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	worn_glasses_offset = new(
		attached_part = src,
		feature_key = OFFSET_GLASSES,
		offset_x = list("north" = 0, "south" = 0, "east" = 5, "west" = -5),
		//offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	worn_head_offset = new(
		attached_part = src,
		feature_key = OFFSET_HEAD,
		offset_x = list("north" = 0, "south" = 0, "east" = 3, "west" = -3),
		offset_y = list("north" = 0, "south" = 1, "east" = 1, "west" = 1),
	)
	worn_face_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACE,
		offset_y = list("north" = 0, "south" = 0, "east" = -1, "west" = -1),
		offset_x = list("north" = 0, "south" = 0, "east" = 3, "west" = -3),
	)
	worn_mask_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACEMASK,
		offset_y = list("north" = 0, "south" = 0, "east" = -1, "west" = -1),
		offset_x = list("north" = 0, "south" = 0, "east" = 3, "west" = -3),
	)
	return ..()

/obj/item/bodypart/chest/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = SPECIES_VOX
	is_dimorphic = TRUE
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX

/obj/item/bodypart/chest/vox/Initialize(mapload)
	worn_belt_offset = new(
		attached_part = src,
		feature_key = OFFSET_BELT,
		offset_x = list("north" = 0, "south" = 0, "east" = 2, "west" = -2),
		//offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	worn_back_offset = new(
		attached_part = src,
		feature_key = OFFSET_BACK,
		offset_x = list("north" = 0, "south" = 0, "east" = 1, "west" = -1),
		//offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	/*worn_suit_offset = new(
		attached_part = src,
		feature_key = OFFSET_SUIT,
		offset_x = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)*/
	/*worn_suit_storage_offset = new(
		attached_part = src,
		feature_key = OFFSET_SUIT,
		offset_x = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)*/
	/*worn_uniform_offset = new(
		attached_part = src,
		feature_key = OFFSET_UNIFORM,
		offset_x = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)*/
	return ..()

/obj/item/bodypart/arm/left/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = SPECIES_VOX
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX

/obj/item/bodypart/arm/left/vox/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = -1, "south" = 1, "east" = 1, "west" = -4),
		offset_y = list("north" = -6, "south" = -6, "east" = -4, "west" = -6),
	)
	return ..()

/obj/item/bodypart/arm/right/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = SPECIES_VOX
	unarmed_attack_verb = "slash"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX

/obj/item/bodypart/arm/right/vox/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = 1, "south" = -1, "east" = 4, "west" = -1),
		offset_y = list("north" = -6, "south" = -6, "east" = -6, "west" = -4),
	)
	return ..()

/obj/item/bodypart/leg/left/digitigrade/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/left/digitigrade/vox/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_TALONMOTH

/obj/item/bodypart/leg/right/digitigrade/vox
	icon_greyscale = 'modular_skyraptor/modules/species_vox/icons/bodyparts.dmi'
	limb_id = BODYPART_ID_DIGITIGRADE
	bodytype = BODYTYPE_ORGANIC | BODYTYPE_VOX | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/left/digitigrade/vox/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(limb_id == SPECIES_LIZARD)
		limb_id = SPECIES_TALONMOTH
