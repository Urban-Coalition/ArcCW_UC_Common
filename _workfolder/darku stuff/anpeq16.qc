$modelname "weapons/arccw/atts/uc_anpeq16a.mdl"

$bodygroup "body"
{
	studio "anpeq16a.smd"
}


$surfaceprop "weapon"

$contents "solid"

$cdmaterials "models/UC/attachments/"
$texturegroup "skinfamilies"
{
	{ "uc_anpeqs" }
	{ "uc_anpeqs_black" }
}

$attachment "flashlight" "flashlight" 0 0 0 rotate 0 0 0

$attachment "laser" "laser" 0 0 0 rotate 0 0 0
$sequence "idle" {
	"anpeq16a.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "anpeq16a.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
