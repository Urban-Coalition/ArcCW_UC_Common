$modelname "weapons/arccw/atts/uc_longass_silencer.mdl"

$bodygroup "body"
{
	studio "lond ass.smd"
}


$surfaceprop "weapon"

$contents "solid"


$cdmaterials "models/UC/attachments/"

$attachment "muzzle" "muzzle" 0.00 0.00 0.00 rotate -0 90 0



$sequence "idle" {
	"lond ass.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "lond ass.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
