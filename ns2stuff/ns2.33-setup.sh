#! /bin/bash

if [ -d ns-allinone-2.33 ]; then
  echo "Removing current installation"
  rm -rf ns-allinone-2.33/
fi

if [ ! -d "~/bin" ]; then
  echo "Creating directory: ~/bin"
  mkdir ~/bin
fi

rm -f ns-allinone-2.33.tar.gz
rm -f ns2-CPSC851-Image-9-22-2014.tar.gz
rm -f Makefile.inNEW

wget http://netlab.cs.clemson.edu/ns-allinone-2.33.tar.gz
wget http://netlab.cs.clemson.edu/ns2-CPSC851-Image-9-22-2014.tar.gz
wget http://netlab.cs.clemson.edu/Makefile.inNEW

wget http://www.cs.clemson.edu/~jmarty/courses/ns2Stuff/example1.tar.gz

tar -xzf ns-allinone-2.33.tar.gz

cd ns-allinone-2.33/ns-2.33
cp ~/ns2-CPSC851-Image-9-22-2014.tar.gz .
tar -xzf ns2-CPSC851-Image-9-22-2014.tar.gz

cd ..

echo "Changing otcl-1.13/configure"
linenum="$(grep -n 'SHLIB_LD=\"ld -shared\"' otcl-1.13/configure | awk -F':' '{print $1}')"
line='s/.*/\tSHLIB_LD="gcc -shared"/'
line=$linenum$line
sed -i "$line" otcl-1.13/configure

./install

cd ns-2.33
cp ~/Makefile.inNEW Makefile.in 
./configure
touch Makefile
make clean
make depend
make

cp ~/example1.tar.gz .
tar -xzf example1.tar.gz

rm -f ns-allinone-2.33.tar.gz
rm -f ns2-CPSC851-Image-9-22-2014.tar.gz
rm -f Makefile.inNEW

echo "remember to update ./bashrc (see the end of this script) "
#export PATH=".:~/bin:/tools:/tools/scripts:/scripts:/bin:/sbin:/usr/bin:/usr/sbin:${PATH}"
#export LD_LIBRARY_PATH=~/ns-allinone-2.33/otcl-1.13:~/ns-allinone-2.33/lib
#export TCL_LIBRARY=~/ns-allinone-2.33/tcl8.4.18
#alias gons='cd ~/ns-allinone-2.33/ns-2.33'
#alias goex1='cd ~/ns-allinone-2.33/ns-2.33/example1'

