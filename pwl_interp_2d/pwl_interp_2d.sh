#!/bin/bash
#
mkdir temp
cd temp
rm *
~/bin/$ARCH/f90split ../pwl_interp_2d.f90
#
for FILE in `ls -1 *.f90`;
do
  gfortran -c -g $FILE >& compiler.txt
  if [ $? -ne 0 ]; then
    echo "Errors compiling " $FILE
    exit
  fi
  rm compiler.txt
done
rm *.f90
#
ar qc libpwl_interp_2d.a *.o
rm *.o
#
mv libpwl_interp_2d.a ~/lib/$ARCH
cd ..
rmdir temp
#
echo "Library installed as ~/lib/$ARCH/libpwl_interp_2d.a"
