# Load environment variables from .env file
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh

mkdir -p $basic_devs
cd $basic_devs

for pkg in autoconf automake bison flex gcc gcc-c++ gdb gettext libtool make patch pkgconfig redhat-rpm-config rpm-build rpm-sign byacc cscope ctags diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap; do
	yum install --installroot=$basic_devs --downloadonly --downloaddir $basic_devs $pkg
done

# for pkg in autoconf automake bison flex gcc gcc-c++ gdb gettext libtool make patch pkgconfig redhat-rpm-config rpm-build rpm-sign byacc cscope ctags diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap; do
