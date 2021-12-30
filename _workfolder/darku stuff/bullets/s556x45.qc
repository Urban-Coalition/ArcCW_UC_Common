$modelname "weapons/arccw/uc_shells/556x45.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s556x45.smd"
}
$lod 16
{
	replacemodel "s556x45.smd" "s556x45_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s556x45_lod.smd"
	fps 30
}
