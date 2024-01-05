#Alex Nasca 
#basic bash script to create a network and router and attach them

openstack network create --project Ansible-Demo  arn_test_net #create a network in the specified project with the specified name 

openstack subnet create arn_subnet1 --network arn_test_net --subnet-range 192.168.0.0/24 #create a subnet called arn_subnet1 connected to the network above with the ip range 192.168.0.0/24

openstack router create arn_default_gw #create a router called arn_default_gw

openstack router set  arn_default_gw --external-gateway external249 #set the external gateway to external249 (the open internet)

openstack router add subnet arn_default_gw arn_subnet1 #connect the created network to the created router. By default the gw will be 192.168.x.1 for any machines created on the network 
