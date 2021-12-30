$modelname "weapons/arccw/uc_shells/22lr.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s22lr.smd"
}
$lod 16
{
	replacemodel "s22lr.smd" "s22lr_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s22lr_lod.smd"
	fps 30
}
