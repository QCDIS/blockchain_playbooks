#install go
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
tar -xzf go1.15.2.linux-amd64.tar.gz
rm -rf go1.15.2.linux-amd64.tar.gz
rm -r /usr/local/go/
sudo mv go/ /usr/local/
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

#install docker

sudo apt-get update
yes | sudo apt-get install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
yes | sudo apt-get install docker-ce

#Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Install Nodejs
sudo apt update
yes | sudo apt install nodejs
yes | sudo apt install npm
npm install -g n
#n latest
n 10.15.3
PATH="$PATH"
npm install npm@6.4.1 -g
npm -g config set user root

#Install Fabric
mkdir -p $GOPATH/src/github.com/hyperledger
cd $GOPATH/src/github.com/hyperledger

wget https://raw.githubusercontent.com/hyperledger/fabric/master/scripts/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh 1.4.4
#git clone https://github.com/hyperledger/fabric-samples.git
cd fabric-samples
git checkout v1.4.4

