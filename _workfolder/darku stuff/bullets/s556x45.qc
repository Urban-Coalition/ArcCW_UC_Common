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

$bbox -0.18 -0.222 -0.217 1.873 0.222 0.217

$definebone "_556_mesh" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0
$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s556x45_lod.smd"
	fps 30
}
