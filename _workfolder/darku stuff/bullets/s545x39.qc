$modelname "weapons/arccw/uc_shells/545x39.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s545x39.smd"
}
$lod 16
{
	replacemodel "s545x39.smd" "s545x39_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s545x39_lod.smd"
	fps 30
}
