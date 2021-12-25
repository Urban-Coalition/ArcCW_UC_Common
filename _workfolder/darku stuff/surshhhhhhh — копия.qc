// Created by Crowbar 0.71

$modelname "weapons/arccw/atts/uc_sureshot_hsp.mdl"

// $bodygroup "body"
// {
// 	studio "sureshot.smd"
// }
$bodygroup "hsp"
{
	studio "sureshot_hsp.smd"
}


$surfaceprop "weapon"


$cdmaterials "models/UC/attachments/"
$definebone "root" "" 0.000000 0.000000 0.000000 -0.000000 0.000000 89.999985 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "holosight" "root" -0.000171 1.379933 0.534173 -0.000000 -0.000057 89.999985 0.000000 0.000000 0.000000 -0.000000 0.000000 -0.000000

$attachment "holosight" "holosight" 0 0 0 rotate 0 0 0




$sequence "idle" {
	"sureshot_hsp.smd"
	fps 30
}