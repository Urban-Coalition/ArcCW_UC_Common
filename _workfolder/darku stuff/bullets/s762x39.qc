$modelname "weapons/arccw/uc_shells/762x39.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s762x39.smd"
}
$lod 16
{
	replacemodel "s762x39.smd" "s762x39_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s762x39_lod.smd"
	fps 30
}
