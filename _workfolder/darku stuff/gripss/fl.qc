$modelname "weapons/arccw/atts/uc_flashlight.mdl"

$bodygroup "body"
{
	studio "flashligh.smd"
}


$surfaceprop "weapon"

$contents "solid"

$cdmaterials "models/UC/attachments/"


$attachment "flashlight" "flashlight" 0 0 0 rotate 0 180 0

$sequence "idle" {
	"flashligh.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "flashligh.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
