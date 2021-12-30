$modelname "weapons/arccw/uc_shells/57x28fn.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s57x28fn.smd"
}
$lod 16
{
	replacemodel "s57x28fn.smd" "s57x28fn_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s57x28fn_lod.smd"
	fps 30
}
