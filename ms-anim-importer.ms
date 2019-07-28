rollout CustomAnimationImporter "Custom Animation Importer"
(
    -- rollout ui
    editText    edit_FilePath "File Name" pos:[13,  15] width:225
    button      btn_Browse "Browse..." pos:[245, 13]

    groupBox group_targets "Targets" pos:[10, 40] width: 300 height: 60
    checkbutton btn_PickObject "Pick Object" pos:[22, 62] width:100
    edittext edit_TargetObject "" pos:[130, 64] width:170

    groupBox group_PositionImport "Position" pos:[10, 110] width: 300 height: 105
    checkbox check_PositionImport "Import Position Info" pos:[22, 130] checked:true
    dropdownlist drop_xPositionField "X Position Field" pos:[22, 160] width:92
    dropdownlist drop_yPositionField "Y Position Field" pos:[117, 160] width:92
    dropdownlist drop_zPositionField "Z Position Field" pos:[212, 160] width:92

    groupBox group_RotationImport "Rotation" pos:[10, 225] width: 300 height: 105
    checkbox check_RotationImport "Import Rotation Info" pos:[22, 245] checked:true
    dropdownlist drop_xRotationField "X Rotation Field" pos:[22, 275] width:92
    dropdownlist drop_yRotationField "Y Rotation Field" pos:[117, 275] width:92
    dropdownlist drop_zRotationField "Z Rotation Field" pos:[212, 275] width:92

    button btn_Import "Import" pos:[80, 345] width:160 height:30
    -- end rollout ui

    global target_object

    local dataFields
    local rawData = #()
    -- configure field select options
    fn setFieldSelectOptions data = (
        dataFields = data
        drop_xPositionField.items = data
        drop_yPositionField.items = data
        drop_zPositionField.items = data

        drop_xRotationField.items = data
        drop_yRotationField.items = data
        drop_zRotationField.items = data
    )
    -- end configure field select options

    -- read data from csv
    fn readDataFile path = (
        AssyFile = openfile path
        if (AssyFile != undefined) then
        (
            print "Read file"
            str = readline AssyFile
            fields = filterstring str "," splitEmptyTokens:true
            setFieldSelectOptions(fields)
            while not eof AssyFile do(
                str = readline AssyFile
                newStr = filterstring str "," splitEmptyTokens:true
                
                append rawData newStr
            )
            print rawData
        )
        else( messageBox "Open Failed" title:"Error!" )
    )
    -- end read data from csv

    -- get position info from raw data
    fn getPosition i = ()
    -- end get position info from raw data

    -- get rotation info from raw data
    fn getRotation i = ()
    -- end get rotation info from raw data

    -- open file dialog
    on btn_Browse pressed do (
        dlg = dotNetObject "System.Windows.Forms.OpenFileDialog"
        dlg.title = "Please select a CSV file to get point data"
        dlg.Multiselect = false
        dlg.Filter = "CSV files (*.csv)|*.csv|All Files (*.*)|*.*"
        result = dlg.showDialog()
        if(result.Equals result.OK) do(
            edit_FilePath.text = dlg.fileName
            readDataFile dlg.fileName
        )
    )
    -- end open file dialog

    on btn_PickObject changed state do (
        if state == true do (
            try (
                target_object = pickobject propt:"Pick surface"
                edit_TargetObject.text = target_object.name
                btn_PickObject.checked = false;
            ) catch ()
        )
    )

    on btn_Import pressed do (
        target_object.position = [0, 0, 0]

        if (rawData != undefined) do (
            local keyCount = rawData.count
            with animate on (
                for i = 1 to keyCount do (
                    at time i (
                        if (check_PositionImport.checked == true) do (
                            pos = getPosition(i)
                        )
                        if (check_RotationImport.checked == true) do (
                            rot = getRotation(i)
                            -- rot_box = eulerangles 0 30 0
                            -- rotate target_object rot_box
                        )
                    )
                )
            )
        )
    )
)

createdialog CustomAnimationImporter width:320 height:390