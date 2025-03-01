
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh


# Check if cpio is already installed
if ! command -v cpio &> /dev/null; then
    rpm -ivh cpio*.rpm
else
    echo "cpio is already installed."
fi

mkdir -p $dev_tool_install_path

# install dev packages
target_path=$(realpath $dev_tool_install_path)
cd $basic_devs 
for rpm in *.rpm; do
	echo $rpm
    rpm2cpio $rpm | cpio -idmv -D $target_path
done


ln -s $target_path/usr/bin/ld.gold $target_path/usr/bin/ld

cd ../..

echo "export PATH=$target_path/bin:\$PATH" >> $user_config
echo "export LD_LIBRARY_PATH=$target_path/usr/lib64:\$LD_LIBRARY_PATH" >> $user_config
echo "export PKG_CONFIG_PATH=$target_path/usr/lib/pkgconfig" >> $user_config

export "export LIBRARY_PATH=$target_path/usr/lib64:\$LIBRARY_PATH" >> $user_config

source $user_config


