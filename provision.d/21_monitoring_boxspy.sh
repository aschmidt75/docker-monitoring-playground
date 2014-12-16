
export DEBIAN_FRONTEND=noninteractive
apt-get install -yqq golang
go get github.com/tools/godep

cd /tmp
git clone https://github.com/gwos/boxspy
cd boxspy
cd deploy
docker build -t gwos/boxspy:canary .

