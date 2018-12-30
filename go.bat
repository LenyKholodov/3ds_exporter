@echo off
if exist "C:\Program Files\Autodesk\3dsMax8\plugins" (
        copy debug\megaexp.dle "C:\Program Files\Autodesk\3dsMax8\plugins"
        start "" "C:\Program Files\Autodesk\3dsMax8\3dsmax.exe"
) ELSE if exist "c:\program files\media\3dmax\plugins" (
        copy debug\megaexp.dle "c:\program files\media\3dmax\plugins"
        start "" "c:\program files\media\3dmax\3dsmax.exe"
) ELSE if exist "f:\3dsmax5\plugins" (
        copy debug\megaexp.dle "f:\3dsmax5\plugins"
        start "" "f:\3dsmax5\3dsmax.exe"
)

