$modelname "weapons/arccw/uc_shells/50ae.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s50ae.smd"
}
$lod 16
{
	replacemodel "s50ae.smd" "s50ae_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s50ae_lod.smd"
	fps 30
}
