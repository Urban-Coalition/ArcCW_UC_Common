$modelname "weapons/arccw/atts/ud_flashlight_1.mdl"

$bodygroup "body"
{
	studio "flashlight_1.smd"
}


$surfaceprop "weapon"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/UC/attachments/"

$attachment "light" "light" 0.00 0.00 0.00 rotate -0 180 0

$cbox 0 0 0 0 0 0

$bbox -1.501 -0.874 -0.421 2.028 0.904 1.859


$sequence "idle" {
	"anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "flashlight_1.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
