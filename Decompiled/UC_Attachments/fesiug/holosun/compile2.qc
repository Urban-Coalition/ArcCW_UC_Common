$modelname "weapons/arccw/atts/uc_holosun2.mdl"

$bodygroup "body"
{
	studio "ref2.smd"
}
$bodygroup "hsp"
{
	studio "ref2_hsp.smd"
	blank
}

$attachment "holosight" "holosight" 0 0 0 rotate 90 0 0

$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$cdmaterials "models\uc\attachments\ins2\"

$sequence "ref" {
	"ref2.smd"
}

$collisionmodel "ref2.smd"