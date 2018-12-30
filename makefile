CPP    = cl.exe
RSC    = rc.exe
MAXDIR = .
#MAXDIR = f:\3dsmax5
SDKDIR = $(MAXDIR)\maxsdk
OUTDIR = debug
OBJ_LIST = $(OUTDIR)\plugin.obj \
           $(OUTDIR)\export.obj \
           $(OUTDIR)\log.obj    \
           $(OUTDIR)\dump.obj   \
           $(OUTDIR)\material.obj \
           $(OUTDIR)\node.obj \
           $(OUTDIR)\modifiers.obj \
           $(OUTDIR)\mesh.obj \
           $(OUTDIR)\anim.obj \
           $(OUTDIR)\helper.obj \
           $(OUTDIR)\light.obj \
           $(OUTDIR)\camera.obj

LIB_LIST = comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib  \
           comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib \
           uuid.lib core.lib geom.lib gfx.lib mesh.lib maxutil.lib helpsys.lib

DEF_FILE = deffile.def

ALL: build 

CPPFLAGS = /nologo /c /EHsc /I"$(SDKDIR)\include" /D "WIN32" /D "_WINDOWS" /D"DEBUG" /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\"  \
           /Yc"export.h" /Fp"$(OUTDIR)\\pch.pch" /D"_CRT_SECURE_NO_DEPRECATED"

"$(OUTDIR)\megaexp.dle": $(OBJ_LIST)
  @link /nologo /subsystem:windows /dll $(LIB_LIST) $(OBJ_LIST) /LIBPATH:"$(SDKDIR)\lib" \
        /def:"$(DEF_FILE)" /out:"$(OUTDIR)\megaexp.dle"
             
CPP_PROJ   = $(CPP_PROJ) $(CPPFLAGS)

"$(OUTDIR)":
    @if not exist $(OUTDIR) mkdir $(OUTDIR)  

"$(OUTDIR)\woodexp.dle" :  $(DEF_FILE) $(LINK_OBJS)
    link $(LINK_FLAGS) $(LINK_OBJS)

.c{$(OUTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(OUTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(OUTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(OUTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(OUTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(OUTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

build: $(OUTDIR) "$(OUTDIR)\megaexp.dle"

clean:
        @del $(OUTDIR)\\*.* /Q
        @del $(OUTDIR) /Q

rebuild:
  @nmake /nologo clean
  @nmake /nologo build
