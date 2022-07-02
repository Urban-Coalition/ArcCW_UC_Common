$modelname "weapons/arccw/atts/uc_holosun1.mdl"

$bodygroup "body"
{
	studio "ref.smd"
}
$bodygroup "hsp"
{
	studio "ref_hsp.smd"
	blank
}

$attachment "holosight" "holosight" 0 0 0 rotate 90 0 0

$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$cdmaterials "models\uc\attachments\ins2\"

$sequence "ref" {
	"ref.smd"
}

$collisionmodel "ref.smd"