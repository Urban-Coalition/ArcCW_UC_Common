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

$bbox -0.18 -0.222 -0.217 1.873 0.222 0.217

$definebone "_556_mesh" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0
$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s410bore_lod.smd"
	fps 30
}
