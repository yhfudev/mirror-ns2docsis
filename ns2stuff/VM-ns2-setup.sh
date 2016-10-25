# create a virtual mchine "CentOS 6.4 i386 Base_NS2"

#download the ns2 image from our netlab machine
wget http://netlab.cs.clemson.edu/ns2docsis-release-1.0-alpha.tar.gz

#unpack
tar -xvf ns2docsis-release-1.0-alpha.tar.gz

#install and build the all in one package 
cd ns2docsis-release-1.0-alpha
mkdir ~/bin/
./install
cd ns-2.33/
ls -l ns

echo "Last step is to update ~/.bashrc and then log out and log back in...."
#edit ~/.bashrc and add the following lines at the end of the file.
#export PATH=".:/tools:/tools/scripts:/scripts:/bin:/sbin:/usr/bin:/usr/sbin:${PATH}"
#export LD_LIBRARY_PATH=~/ns2docsis-release-1.0-alpha/otcl-1.13:~/ns2docsis-release-1.0-alpha/lib
#export TCL_LIBRARY=~/ns2docsis-release-1.0-alpha/tcl8.4.18/library
#alias gons='cd ~/ns2docsis-release-1.0-alpha/ns-2.33'
#alias goex1='cd ~/ns2docsis-release-1.0-alpha/ns-2.33/example1'



