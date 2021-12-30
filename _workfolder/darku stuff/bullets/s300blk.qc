$modelname "weapons/arccw/uc_shells/300blk.mdl"
$scale 2.5


$bodygroup "reference"
{
	studio "s300blk.smd"
}
$lod 16
{
	replacemodel "s300blk.smd" "s300blk_lod.smd"
}

$cdmaterials "models\weapons\arccw\uc_shells\"

$sequence "reference" {
	"s300blk_lod.smd"
	fps 30
}
