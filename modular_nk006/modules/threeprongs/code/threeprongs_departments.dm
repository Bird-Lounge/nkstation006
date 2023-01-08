#define JOB_NK6_NUCAP "Commander" //making it completely distinct for reasons of SPESS IS EATING MY FACE GUYS PLEASE SEND HELP
#define JOB_NK6_HOP "First Officer"
#define JOB_NK6_HOS "Chief of Security"
#define JOB_NK6_CE "Chief of Engineering"
#define JOB_NK6_QM "Chief of Resources"
#define JOB_NK6_RD "Chief of Science"
#define JOB_NK6_CMO "Chief of Medicine"
//departmental assistants
#define JOB_NK6_ASST_CMD "Command Crew"
#define JOB_NK6_ASST_SUP "Support Crew"
#define JOB_NK6_ASST_SPC "Specialist Crew"
//sec crew
#define JOB_NK6_SECOFF "Security"
#define JOB_NK6_LAWYER "Attorney"
//engineering crew
#define JOB_NK6_DAMCON "Damage Control Technician"
#define JOB_NK6_ENGITECH "Engineering Technician"
//cargo crew
#define JOB_NK6_CARGO "Delivery Technician"
#define JOB_NK6_MINE "Pathfinder"
//service crew
#define JOB_NK6_CULINARY "Culinary Artist"
#define JOB_NK6_JANITOR "Sanitation Officer"
//TODO: clowns?
//medical crew
#define JOB_NK6_SURGEON "Surgeon"
#define JOB_NK6_EMT "Emergency Medical Technician"
#define JOB_NK6_PSYCH "Therapist"
#define JOB_NK6_CHEM "Chemistry Technician"
//science crew
#define JOB_NK6_SCI "Science Officer"
#define JOB_NK6_ROBO "Robotics Technician"
#define JOB_NK6_BIO "Biologist"
#define JOB_NK6_BOTANY "Hydroponics Technician"

/datum/job_department/nk006/heads
	department_name = "Heads"
	department_bitflags = DEPARTMENT_BITFLAG_CAPTAIN
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_COMMAND
	label_class = "command"
	can_add_new_jobs = 1
	ui_color = "#ffff00"

/datum/job_department/nk006/command
	department_name = "Command"
	department_bitflags = DEPARTMENT_BITFLAG_COMMAND
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_COMMAND
	display_order = 1
	label_class = "command"
	ui_color = "#6600ff"
	can_add_new_jobs = 1

/datum/job_department/nk006/command/security
	department_name = "Security"
	department_bitflags = DEPARTMENT_BITFLAG_SECURITY
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_SECURITY
	display_order = 2
	label_class = "security"
	ui_color = "#007fff"
	can_add_new_jobs = 1

/datum/job_department/nk006/support
	department_name = "Support"
	department_bitflags = DEPARTMENT_BITFLAG_ENGINEERING
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_ENGINEERING
	display_order = 3
	label_class = "engineering"
	ui_color = "#ff6600"
	can_add_new_jobs = 1

/datum/job_department/nk006/support/engineering
	department_name = "Engineering"
	department_bitflags = DEPARTMENT_BITFLAG_ENGINEERING
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_ENGINEERING
	display_order = 4
	label_class = "engineering"
	ui_color = "#ff7f00"
	can_add_new_jobs = 1

/datum/job_department/nk006/support/cargo
	department_name = "Cargo"
	department_bitflags = DEPARTMENT_BITFLAG_CARGO
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_SUPPLY
	display_order = 5
	label_class = "supply"
	ui_color = "#af7f3f"
	can_add_new_jobs = 1

/datum/job_department/nk006/support/service
	department_name = "Service"
	department_bitflags = DEPARTMENT_BITFLAG_SERVICE
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_SERVICE
	display_order = 6
	label_class = "service"
	ui_color = "#00ff00"
	can_add_new_jobs = 1

/datum/job_department/nk006/specialist
	department_name = "Specialist"
	department_bitflags = DEPARTMENT_BITFLAG_SCIENCE
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_SCIENCE
	display_order = 7
	label_class = "science"
	ui_color = "#aaff00"
	can_add_new_jobs = 1

/datum/job_department/nk006/specialist/medical
	department_name = "Medical"
	department_bitflags = DEPARTMENT_BITFLAG_MEDICAL
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_MEDICAL
	display_order = 8
	label_class = "medical"
	ui_color = "#ff0000"
	can_add_new_jobs = 1

/datum/job_department/nk006/specialist/science
	department_name = "Science"
	department_bitflags = DEPARTMENT_BITFLAG_SCIENCE
	department_head = /datum/job/nk006/nucap
	department_experience_type = EXP_TYPE_SCIENCE
	display_order = 9
	label_class = "science"
	ui_color = "#7fff00"
	can_add_new_jobs = 1