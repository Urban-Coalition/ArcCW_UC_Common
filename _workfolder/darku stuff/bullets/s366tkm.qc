$modelname "weapons/arccw/uc_shells/366tkm.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s366tkm.smd"
}
$lod 16
{
	replacemodel "s366tkm.smd" "s366tkm_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s366tkm_lod.smd"
	fps 30
}
