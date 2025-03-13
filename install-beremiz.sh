
sudo apt update
sudo apt upgrade

mkdir Beremiz
cd Beremiz

sudo apt install git
sudo apt install libwxgtk3.2-dev
sudo apt install flex bison
sudo apt install python3-venv

git clone https://github.com/beremiz/beremiz.git #beremiz
git clone https://github.com/beremiz/matiec.git #matiec
git clone https://github.com/beremiz/Modbus.git #modbus
git clone https://github.com/beremiz/erpc.git #erpc
git clone https://github.com/ArimaBatista2/arquivo6.git #arquivo test
cd matiec

autoreconf -fvi
./configure
make -j32

cd ..

python3 -m venv venv
source venv/bin/activate
pip install wxPython==4.2.2
pip install numpy
pip install matplotlib
pip install lxml
pip install zeroconf
pip install cryptography

~/Beremiz/venv/bin/python ~/Beremiz/beremiz/Beremiz.py

