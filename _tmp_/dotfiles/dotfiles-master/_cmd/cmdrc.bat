@echo off

::macros
doskey c=cls
doskey md=mkdir
doskey fe=Explorer $*
doskey x=exit
doskey e=echo $*

::Navigation
doskey cd = cd /d $*
doskey ..=cd ..
doskey ...=cd ../..
doskey ....=cd ../../..
doskey .....=cd ../../../..
doskey .1=cd ..
doskey .2=cd ../..
doskey .3=cd ../../..
doskey .4=cd ../../../..

::macros for Linux-like commands
doskey clear=cls
doskey ll=dir $*
doskey mv=move $*
doskey cp=copy $*

::Functions for running wsl distros
doskey arch=if "$1"=="run" (^
    wsl ~ -d Arch^
) else (^
    echo Did you mean arch run?^
)
doskey ubuntu=if "$1"=="run" (^
    wsl ~ -d Ubuntu-22.04^
) else (^
    echo Did you mean ubuntu run?^
)


@echo on
