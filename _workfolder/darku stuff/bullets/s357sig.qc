$modelname "weapons/arccw/uc_shells/357sig.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s357sig.smd"
}
$lod 16
{
	replacemodel "s357sig.smd" "s357sig_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s357sig_lod.smd"
	fps 30
}
