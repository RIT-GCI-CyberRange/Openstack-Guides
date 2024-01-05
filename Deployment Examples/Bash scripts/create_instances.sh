#Alex Nasca 
#basic bash script to deploy three machines using open stack CLI

#        create command resources used            OS Image           Size of volume in Gigibytes   network id of network it should belong to     ip address of the box     SSH Key generated on deployment box (allows for easy ssh)
openstack server create --flavor small --image UbuntuJammy2204-Desktop --boot-from-volume 100 --nic net-id=07bc514e-fd57-4f5f-a5dd-e0d4a4e89d65,v4-fixed-ip=192.168.0.10  --key-name Demo-Key test1
openstack server create --flavor small --image UbuntuJammy2204-Desktop --boot-from-volume 100 --nic net-id=07bc514e-fd57-4f5f-a5dd-e0d4a4e89d65,v4-fixed-ip=192.168.0.11  --key-name Demo-Key test2
openstack server create --flavor small --image UbuntuJammy2204-Desktop --boot-from-volume 100 --nic net-id=07bc514e-fd57-4f5f-a5dd-e0d4a4e89d65,v4-fixed-ip=192.168.0.12  --key-name Demo-Key test3
