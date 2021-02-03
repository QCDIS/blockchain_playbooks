cd caliper-benchmark-ben
sudo apt-get install make g++
sudo npm install -g node-gyp

npm install
npm install -g --only=prod @hyperledger/caliper-cli@0.2.0 --unsafe-perm
npx caliper bind --caliper-bind-sut fabric --caliper-bind-sdk 1.4.4 --caliper-bind-cwd ./

