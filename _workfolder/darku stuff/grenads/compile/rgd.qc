$modelname "weapons\arccw\c_uo_rgd.mdl"
 
$bodygroup "granata" {
	studio "rgd5.smd"
}

$cdmaterials "models\weapons\arccw\shared"
$cdmaterials "models\weapons\arccw\uo"

$attachment "1" "camera" 0 0 0 rotate -90 0 0
 
$surfaceprop "default"
 
$contents "solid"
 
$illumposition 0 0 0

$bbox 0 0 0 0 0 0
 
$cbox 0 0 0 0 0 0


$sequence "idle"{
	"anims\idle.smd" 
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$sequence "ready"{
	"anims\ready.smd" 
	fps 50
}

$sequence "draw"{
	"anims\draw.smd" 
	fps 30
}

$sequence "throw_start"{
	"anims\throw_start.smd" 
	fps 30
}

$sequence "throw_idle"{
	"anims\throw_idle.smd" 
	fps 30
	loop
}

$sequence "throw2_start"{
	"anims\throw2_start.smd" 
	fps 30
}

$sequence "throw2_idle"{
	"anims\throw2_idle.smd" 
	fps 30
	loop
}

$sequence "throw_end"{
	"anims\throw_end.smd" 
	fps 30
}

// alt throw animations

$sequence "lowthrow_start"{
	"anims\lowthrow_start.smd" 
	fps 30
}

$sequence "lowthrow_idle"{
	"anims\lowthrow_idle.smd" 
	fps 30
	loop
}

$sequence "lowthrow2_start"{
	"anims\lowthrow2_start.smd" 
	fps 30
}

$sequence "lowthrow2_idle"{
	"anims\lowthrow2_idle.smd" 
	fps 30
	loop
}

$sequence "lowthrow_end"{
	"anims\lowthrow_end.smd" 
	fps 30
}

$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Wrist"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"