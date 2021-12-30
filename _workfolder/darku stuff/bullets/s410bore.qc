$modelname "weapons/arccw/uc_shells/410bore.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s410bore.smd"
}
$lod 16
{
	replacemodel "s410bore.smd" "s410bore_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s410bore_lod.smd"
	fps 30
}
