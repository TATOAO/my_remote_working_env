# Load environment variables from .env file
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh

mkdir -p $basic_devs

absolute_path=$(realpath "$basic_devs")

for pkg in autoconf automake bison flex gcc gcc-c++ gdb gettext libtool make patch pkgconfig redhat-rpm-config rpm-build rpm-sign byacc cscope ctags diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap glibc-devel glib2-devel libXpm-devl zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libcurl-devel cpio tar; 
do
	(
	yum install -y --installroot=$absolute_path --downloadonly --downloaddir $basic_devs $pkg || true
	) 2>> logs/yum_download_stderr.txt 1>> logs/yum_download_stdout.txt
done

