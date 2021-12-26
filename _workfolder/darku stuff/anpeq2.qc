$modelname "weapons/arccw/atts/uc_anpeq2.mdl"

$bodygroup "body"
{
	studio "anpeq2.smd"
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
	"anpeq2.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "anpeq2.smd"
{
	$mass 1
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "root"
}
