$modelname "weapons/arccw/atts/ur_annihilator_laser.mdl"

$bodygroup "body"
{
	studio "annihilator_laser.smd"
}


$surfaceprop "item"

$contents "solid"

$illumposition 0 -0.258 1.082

$cdmaterials "models/UC/attachments/"

$attachment "laser" "tag_laser" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -4.273 -1.351 -0.302 4.784 1.351 2.478

$definebone "blender_implicit" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "j_gun" "" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "tag_laser" "j_gun" 9.761528 0 4.695951 0 -89.999983 0 0 0 0 0 0 0
$definebone "tag_lasercap" "j_gun" -0.39044 0 4.697129 0 0 0 0 0 0 0 0 0


$sectionframes 30 63

$sequence "idle" {
	"annihilator_laser_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "annihilator_laser_physics.smd"
{
	$mass 5
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "j_gun"

}

$KeyValues
{
	prop_data 
	{
		"base" "Item.Small"
	}
}
