$modelname "weapons/arccw/uc_shells/12g.mdl"
$scale 2.5

$bodygroup "reference"
{
	studio "s12g.smd"
}
$lod 16
{
	replacemodel "s12g.smd" "s12g_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s12g_lod.smd"
	fps 30
}
