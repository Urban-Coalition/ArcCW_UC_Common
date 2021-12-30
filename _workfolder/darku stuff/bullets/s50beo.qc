$modelname "weapons/arccw/uc_shells/50beo.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s50beo.smd"
}
$lod 16
{
	replacemodel "s50beo.smd" "s50beo_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s50beo_lod.smd"
	fps 30
}
