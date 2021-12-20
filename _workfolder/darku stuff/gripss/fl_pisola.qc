$modelname "weapons/arccw/atts/uc_tlr2hl.mdl"

$bodygroup "body"
{
	studio "TLR-2 HL.smd"
}


$surfaceprop "weapon"

$contents "solid"

$cdmaterials "models/UC/attachments/"


$attachment "flashlight" "flashlight" 0 0 0 rotate 0 180 0

$attachment "laser" "laser" 0 0 0 rotate 0 180 0
$sequence "idle" {
	"TLR-2 HL.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "TLR-2 HL.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
