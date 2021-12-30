// Created by Crowbar 0.71

$modelname "weapons/arccw/ud_shells/556.mdl"

$bodygroup "reference"
{
	studio "556.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition 0 -0.847 0

$cdmaterials "models\weapons\arccw\ud_shells\"

$cbox 0 0 0 0 0 0

$bbox -0.18 -0.222 -0.217 1.873 0.222 0.217

$definebone "root" "" 0 0 0 0 0 0 0 0 0 0 0 0


$sequence "reference" {
	"556_anims\reference.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}
