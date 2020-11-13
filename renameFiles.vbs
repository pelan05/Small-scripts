Set objFso = CreateObject("Scripting.FileSystemObject")
' change folder path
Set Folder = objFSO.GetFolder("c:\test\")

For Each File In Folder.Files
    sNewFile = File.Name
    ' underscore gets replaced with space
    sNewFile = Replace(sNewFile,"_"," ")
    if (sNewFile<>File.Name) then 
        File.Move(File.ParentFolder+"\"+sNewFile)
    end if

Next
