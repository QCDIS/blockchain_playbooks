import yaml
f = open('docker-swarm-compose-tls.yaml','rb')
content = yaml.load(f)
comp = ['ca_org4_example_com','orderer3_example_com','peer0_org4_example_com']
for each in comp:
    print(content['services'][each]['deploy']['placement']['constraints'])
a = 'ca_org2_example_com'
content['services'][a]['deploy']['placement']['constraints'][0]='node.hostname==dappvm2'
f_update = open('docker-swarm-compose-tls-testupdate.yaml','w')
yaml.dump(content,f_update,default_flow_style=False)

