$modelname "weapons/arccw/uc_shells/12g_slug.mdl"
$scale 2.5

$bodygroup "reference"
{
	studio "s12g_slug.smd"
}
$lod 16
{
	replacemodel "s12g_slug.smd" "s12g_slug_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s12g_slug_lod.smd"
	fps 30
}
