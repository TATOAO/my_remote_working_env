
# Load environment variables from .env file
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh

mkdir -p $python_path

wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz -P $python_path
