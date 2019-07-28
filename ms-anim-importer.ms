rollout CustomAnimationImporter "Custom Animation Importer"
(
    -- rollout ui
    editText    edit_FilePath "File Name" pos:[24,  15] width:200
    button      btn_Browse "Browse..." pos:[240, 13]

    groupBox group_targets "Targets" pos:[10, 40] width: 300 height: 60
    checkbutton btn_PickObject "Pick Object" pos:[22, 62] width:100
    edittext edit_TargetObject "" pos:[130, 64] width:170

    groupBox group_PositionImport "Position" pos:[10, 110] width: 300 height: 105
    checkbox check_PositionImport "Import Position Info" pos:[22, 130] checked:true
    dropdownlist drop_xPositionField "X Position Field" pos:[22, 160] width:92 items:#("1/2", "1/4", "1/8", "1/16")
    dropdownlist drop_yPositionField "Y Position Field" pos:[117, 160] width:92 items:#("1/2", "1/4", "1/8", "1/16")
    dropdownlist drop_zPositionField "Z Position Field" pos:[212, 160] width:92 items:#("1/2", "1/4", "1/8", "1/16")

    groupBox group_RotationImport "Rotation" pos:[10, 225] width: 300 height: 105
    checkbox check_RotationImport "Import Rotation Info" pos:[22, 245] checked:true
    dropdownlist drop_xRotationField "X Rotation Field" pos:[22, 275] width:92 items:#("1/2", "1/4", "1/8", "1/16")
    dropdownlist drop_yRotationField "Y Rotation Field" pos:[117, 275] width:92 items:#("1/2", "1/4", "1/8", "1/16")
    dropdownlist drop_zRotationField "Z Rotation Field" pos:[212, 275] width:92 items:#("1/2", "1/4", "1/8", "1/16")

    button btn_Import "Import" pos:[80, 345] width:160 height:30
    -- end rollout ui
)

createdialog CustomAnimationImporter width:320 height:390