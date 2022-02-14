$modelname "weapons/arccw/uc_shells/40sw.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s40sw.smd"
}
$lod 16
{
	replacemodel "s40sw.smd" "s40sw_lod.smd"
}

$bbox -0.18 -0.222 -0.217 1.873 0.222 0.217

$definebone "_556_mesh" "" 0 0 0 0 0 89.999982 0 0 0 0 0 0
$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s40sw_lod.smd"
	fps 30
}
