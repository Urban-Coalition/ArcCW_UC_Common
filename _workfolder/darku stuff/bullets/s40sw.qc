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

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s40sw_lod.smd"
	fps 30
}
