# Installing Clawpack on windows with WSL

## 1. Install WSL
Open your command prompt and type the following to create an Ubuntu instance on your machine : 

```powershell
wsl --install -d Ubuntu
```

You will have to define a username and a password that you should not forget.

See the tutorial online: [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install).

## 2. Install dependencies

Execute the following in your bash sell from WSL to install the Fortran compiler, the make tools and python tools for virtual environements.

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install make
sudo apt-get install gfortran
sudo apt install liblapack-dev libopenblas-dev
sudo apt-get install python3 python3-venv
sudo apt-get install python3-dev
```

Then create your virtual environment and install all necessary packages.

```bash
python3 -m venv claw
export CLAW=$PWD/claw/src/clawpack
echo "export CLAW=$CLAW" >> $PWD/claw/bin/activate
source claw/bin/activate

pip install --upgrade pip
pip install meson-python ninja pkgconfig scipy matplotlib
pip install --no-build-isolation -e git+https://github.com/clawpack/clawpack.git@v5.12.0#egg=clawpack
```

## 3. Open a project in VScode with WSL

You can find the official tutorials online: [https://learn.microsoft.com/en-us/training/modules/developing-in-wsl/?source=recommendations](https://learn.microsoft.com/en-us/training/modules/developing-in-wsl/?source=recommendations).

Open any folder in `\\wsl.localhost\Ubuntu\home\<username>` and open a terminal. It should run with WSL by default. If it is not the case, open a new one and specify 'Ubuntu (WSL)'. Be sure to activate your virtual environment `source path_to_claw_venv/bin/activate` before running clawpack.
