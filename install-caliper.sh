cd ~
sudo apt-get install make g++
sudo npm install -g node-gyp

git clone https://github.com/AXinx/caliper-bench.git
cd ./caliper-bench/azure-3nodes/caliper-benchmarks/
npm install --save fs-extra 
npm install -g --only=prod @hyperledger/caliper-cli@0.2.0 --unsafe-perm
npx caliper bind --caliper-bind-sut fabric --caliper-bind-sdk 1.4.4 --caliper-bind-cwd ./

