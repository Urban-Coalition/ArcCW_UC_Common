$modelname "weapons/arccw/atts/ud_eotech_hsp.mdl"

$bodygroup "hsp"
{
	studio "hsp.smd"
}

$surfaceprop "weapon"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/UC/attachments/"

$attachment "holosight" "holosight" 0.00 0.00 0.00 rotate -0 0 0

$cbox 0 0 0 0 0 0

$bbox -3.304 -0.648 0 3.427 0.649 2.015

$sequence "idle" {
	"anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}