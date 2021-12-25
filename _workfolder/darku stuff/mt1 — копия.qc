// Created by Crowbar 0.71

$modelname "weapons/arccw/atts/uc_mirco_t1_hsp.mdl"

// $bodygroup "body"
// {
// 	studio "microt1.smd"
// }
$bodygroup "hsp"
{
	studio "microt1_hsp.smd"
}


$surfaceprop "weapon"


$cdmaterials "models/UC/attachments/"
$definebone "holosight" "" 0.000000 1.423388 -0.048433 0.000000 -0.000057 89.999985 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
$definebone "root" "" 0.000000 0.000000 0.000000 -0.000000 0.000000 89.999985 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000

$attachment "holosight" "holosight" 0 0 0 rotate 0 0 0



$sequence "idle" {
	"microt1_hsp.smd"
	fps 30
}