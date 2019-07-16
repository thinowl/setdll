##############################################################################
##
##  Makefile for Detours.
##
##  Microsoft Research Detours Package
##
##  Copyright (c) Microsoft Corporation.  All rights reserved.
##

ROOT = .
!include "$(ROOT)\system.mak"

all:
    cd "$(MAKEDIR)"
	@if exist "$(MAKEDIR)\samples\7z\CPP\7zip\Bundles\Alone" cd "$(MAKEDIR)\samples\7z\CPP\7zip\Bundles\Alone" && $(MAKE)
    cd "$(MAKEDIR)\src"
    @$(MAKE) /NOLOGO /$(MAKEFLAGS)
    cd "$(MAKEDIR)\samples"
    @$(MAKE) /NOLOGO /$(MAKEFLAGS)
	@if exist "$(MAKEDIR)\bugs\makefile" cd "$(MAKEDIR)\bugs" && $(MAKE) /NOLOGO /$(MAKEFLAGS)
    cd "$(MAKEDIR)"

clean:
    cd "$(MAKEDIR)"
	@if exist "$(MAKEDIR)\core\makefile" cd "$(MAKEDIR)\core" && $(MAKE) /NOLOGO /$(MAKEFLAGS) clean
    cd "$(MAKEDIR)\src"
    @$(MAKE) /NOLOGO /$(MAKEFLAGS) clean
    cd "$(MAKEDIR)\samples"
    @$(MAKE) /NOLOGO /$(MAKEFLAGS) clean
	@if exist "$(MAKEDIR)\bugs\makefile" cd "$(MAKEDIR)\bugs" && $(MAKE) /NOLOGO /$(MAKEFLAGS) clean
    cd "$(MAKEDIR)"
    -rmdir /q /s $(INCDS) 2> nul
    -rmdir /q /s $(LIBDS) 2> nul
    -rmdir /q /s $(BINDS) 2> nul
    -rmdir /q /s dist 2> nul
    -del docsrc\detours.chm 2> nul
    -del /q *.msi 2>nul
    -del /q /f /s *~ 2>nul

test:
    cd "$(MAKEDIR)\samples"
    @$(MAKE) /NOLOGO /$(MAKEFLAGS) test
    cd "$(MAKEDIR)"

################################################################# End of File.