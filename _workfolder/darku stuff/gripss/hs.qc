$modelname "weapons/arccw/atts/uc_handstop.mdl"

$bodygroup "body"
{
	studio "handstop.smd"
}


$surfaceprop "weapon"

$contents "solid"

$cdmaterials "models/UC/attachments/"

$texturegroup "skinfamilies"
{
	{ "uc_hgrips" }
	{ "uc_hgrips_black" }
}

$sequence "idle" {
	"handstop.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "handstop.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
