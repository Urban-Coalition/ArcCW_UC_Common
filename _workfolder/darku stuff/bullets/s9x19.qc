$modelname "weapons/arccw/uc_shells/9x19.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s9x19.smd"
}
$lod 16
{
	replacemodel "s9x19.smd" "s9x19_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s9x19_lod.smd"
	fps 30
}
