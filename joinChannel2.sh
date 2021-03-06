# Create the channel
docker exec peer0.org1.gateway.com peer channel create -o orderer.gateway.com:7050 -c gchannel -f /var/hyperledger/channel-artifacts/channel.tx --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/gateway.com/msp/tlscacerts/tlsca.gateway.com-cert.pem

# Join peer0.org1.example.com to the channel.
docker exec peer0.org1.gateway.com peer channel join -b gchannel.block

# Join peer1.org1.example.com to the channel.
docker exec peer1.org1.gateway.com peer channel fetch config -o orderer.gateway.com:7050 -c gchannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/gateway.com/msp/tlscacerts/tlsca.gateway.com-cert.pem
docker exec peer1.org1.gateway.com peer channel join -b gchannel_config.block
