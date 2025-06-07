# Installation de clawpack sur Windows avec WSL

## 1. Installation de WSL
Dans l'invite de commandes `cmd` (taper `cmd` dans le menu 'Démarrer') puis installer une instance d'Ubuntu en exécutant la ligne ci-dessous : 

```powershell
wsl --install -d Ubuntu
```

Il faudra définir un nom d'utilisaeur et un mot de passe admin à réutiliser par la suite.

## 2. Installation des paquets Fortran et Python nécessaires

Exécuter le code ci-dessous pour installer tous les codes requis pour installer et utiliser clawpack dans un environnement virtuel de Python.

```bash
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
```

## 3. Terminal WSL dans VSCode

Ouvrir un dossier quelconque dans `\\wsl.localhost\Ubuntu\home\<nom d'utilisateur>` et ouvrir un terminal. En cas normal, le terminal est déjà en WSL par défaut. Sinon, aller en haut à droite de la fenêtre du terminal pour en ouvrir un nouveau mais en WSL. Il faut bien activer l'environnement virtuel avec `source chemin_vers_environnement_claw/bin/activate` (comme dans le script précédent) pour pouvoir utiliser clawpack.

# Éxécuter un exemple

```bash
source claw/bin/activate
cd $CLAW/geoclaw/examples/tsunami/chile2010
make new
make topo make data
make output
```