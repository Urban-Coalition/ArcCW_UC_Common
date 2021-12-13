$modelname "weapons/arccw/atts/ud_foregrip_vertical.mdl"

$bodygroup "body"
{
	studio "foregrip_vertical.smd"
}


$surfaceprop "weapon"

$contents "solid"

$illumposition 0 0 0

$cdmaterials "models/UC/attachments/"

$attachment "foregrip" "foregrip" 0.00 0.00 0.00 rotate -0 90 0

$cbox 0 0 0 0 0 0

$bbox -1.501 -0.874 -0.421 2.028 0.904 1.859


$sequence "idle" {
	"anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "foregrip_vertical.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
