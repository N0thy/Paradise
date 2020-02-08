/datum/disease/black_death
	name = "Black Hole Death"
	max_stages = 5
	spread_flags = CONTACT_GENERAL|BLOOD
	spread_text = "Fleas,blood and contact"
	cure_text = "The water of gods,Saline-Glucose Solution and Spaceacillin "
	cures = list("holywater","salglu_solution","spaceacillin")
	cure_chance = 7
	agent = "Nigrum Foraminis Pestis"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "A variant of the old black plague, it is usually carried by fleas that live with space ants."
	severity = BIOHAZARD
	virus_heal_resistant = TRUE
	disease_flags = CURABLE|CAN_CARRY
	needs_all_cures = TRUE

/datum/disease/black_death/stage_act()
	..()
	switch(stage)
		if(1)
			visibility_flags = HIDDEN_SCANNER|HIDDEN_PANDEMIC
			affected_mob.bodytemperature += 1
			if(prob(1))
				to_chat(affected_mob, "<span class='danger'>You feel a headache</span>")
				affected_mob.adjustStaminaLoss(15)

		if(2)
			affected_mob.bodytemperature += 1
			visibility_flags = HIDDEN_SCANNER|HIDDEN_PANDEMIC
			if(prob(4))
				to_chat(affected_mob, "<span class='danger'>Some black lumps begin to appear in your body</span>")
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>You feel a headache</span>")
				affected_mob.adjustStaminaLoss(15)

		if(3)
			affected_mob.bodytemperature += 2
			visibility_flags = HIDDEN_SCANNER
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>Some black lumps begin to appear in your body</span>")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel a headache</span>")
				affected_mob.adjustStaminaLoss(15)

		if(4)
			affected_mob.bodytemperature += 2
			visibility_flags = null
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel a headache</span>")
				affected_mob.adjustStaminaLoss(30)
			if(prob(20))
				to_chat(affected_mob, "<span class='danger'>The black lumps hurt a lot </span>")
				affected_mob.adjustStaminaLoss(30)
				affected_mob.adjustBruteLoss(0.2)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>Black bumps explode on your skin!</span>")
				affected_mob.adjustBruteLoss(20)

		if(5)
			affected_mob.bodytemperature += 5
			affected_mob.blood_color = "#000000"
			visibility_flags = null
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You feel a sensation of hypersensitivity and muscular pain</span>")
				affected_mob.drop_r_hand()
				affected_mob.Weaken(10)
				affected_mob.adjustBruteLoss(2)
				affected_mob.drop_l_hand()
			if(prob(50))
				to_chat(affected_mob, "<span class='userdanger'>You feel your mind very slower</span>")
				affected_mob.AdjustConfused(8, bound_lower = 0, bound_upper = 100)
				affected_mob.Dizzy(5)
				affected_mob.adjustStaminaLoss(20)
				affected_mob.Weaken(10)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>Black bumps explode on your skin!</span>")
				affected_mob.adjustBruteLoss(20)
			if(prob(30))
				to_chat(affected_mob, "<span class='danger'>Your blood set black</span>")
				affected_mob.adjustBruteLoss(5)
				affected_mob.vomit(0,1)
			if(prob(40))
				to_chat(affected_mob, "<span class='danger'>You feel a headache</span>")
				affected_mob.adjustStaminaLoss(100)
