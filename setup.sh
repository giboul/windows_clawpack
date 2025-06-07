sudo apt-get update
sudo apt-get upgrade
sudo apt-get install make
sudo apt-get install gfortran
sudo apt install liblapack-dev libopenblas-dev
sudo apt-get install python3 python3-venv
sudo apt-get install python3-dev
python3 -m venv claw
export CLAW=$PWD/claw/src/clawpack
echo "export CLAW=$CLAW" >> $PWD/claw/bin/activate
source claw/bin/activate

pip install --upgrade pip
pip install meson-python
pip install ninja
pip install pkgconfig
pip install scipy
pip install matplotlib
pip install --no-build-isolation -e git+https://github.com/clawpack/clawpack.git@v5.12.0#egg=clawpack
