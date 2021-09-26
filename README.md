## Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.
![image](https://user-images.githubusercontent.com/91354803/134795148-88b15a7a-92f5-4c70-8486-6073827c0301.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat. The playbook files for the environment include:

•	metricbeat-playbook.yml

•	filebeat-playbook.yml

•	DVWA Pentest.yml

•	install-elk.yml

This document contains the following details:
-	Description of the Topology
-	Access Policies
-	ELK Configuration
-	Beats in Use
-	Machines Being Monitored
-	How to Use the Ansible Build
### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

What aspect of security do load balancers protect? A load balancer protects the availability aspect of the CIA Triad. A load balancer ensures that no server gets overrun because it will distribute the load among the servers. This is conducted depending on what method you choose, for example, round robin will add someone to each server in line, and when it reaches the end, it will start over at the beginning.

A jump box acts as an intermediary between your workstation and the one you are trying to access. It allows you to connect to the jump-box, ensure the IP address is allowed, then grant access to the requested machine instead of having a direct connection to the backend machines.

Load balancers affect the availability aspect by ensuring one server does not get overwhelmed with traffic and taken down.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the system logs and system metrics.

Filebeat watches for log files on the specified machine. For this project, Filebeat was monitoring system logs on Web-1, Web-2, and Web-3 virtual machines.

Metricbeat targets metric data on the target machines. It takes the metrics and statistics and allows you to create customized dashboards with the data. For this project, Metricbeat created unique dashboards for the metric data collected from Web-1, Web-2, and Web-3 virtual machines.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name    | Function    | IP Address | Operating System          |
|------------|---------------|---------------|------------------------------   |
| Jumpbox | Gateway     | 10.0.0.4   | Linux Ubuntu Server    |
| Web-1   | Hosted DVWA | 10.0.0.5   | Linux Ubuntu Server |
| Web-2   | Hosted DVWA | 10.0.0.6   | Linux Ubuntu Server |
| Web-3   | Hosted DVWA | 10.0.0.7   | Linux Ubuntu Server |
| ELK-VM  | Hosted ELK  | 10.1.0.4   | Linux Ubuntu Server     |

### Access Policies
The machines on the internal network are not exposed to the public Internet. 

Only the load balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
The load balancer IP is 13.87.186.100 and the whitelisted IP it accepts connections from is 209.177.138.104.

Machines within the network can only be accessed by SSHing from authorized machines.

To access the ELK VMs public side (Kibana), the IP allowed is 209.177.138.104. To SSH into the ELK-VM, you must SSH from the jumpbox-vm from the following IP 10.0.0.4.

A summary of the access policies in place can be found in the table below.
| Name       | Publicly Accessible | Allowed IP Addresses |
|--------------|----------------------------|-------------------------------|
| Jump Box |	Yes                          |     209.177.138.104       |
|   Web-1    |      No                           |        10.0.0.4                   |
|   Web-2    |      No                           |        10.0.0.4                   |
|   Web-3    |      No                           |        10.0.0.4                   |
|   ELK-VM  |      No                           |        10.0.0.4                   |


### Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because the Ansible Playbooks allowed for rapid deployment and configuration. The configuration only required the IP Addresses to be changed properly and a simple command to run the playbook.

The playbook implements the following tasks:
Below are the steps, in order, that the installation of ELK follows.
1.	Install docker.io
2.	Install python3
3.	Install the Docker module
4.	Sets the max VM memory maps to 262144.
5.	Opens the ports for ELK to listen for data on. These ports include 5601, 9200, and 5044.
6.	Enables the docker service on boot.
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![image](https://user-images.githubusercontent.com/91354803/134795136-84021981-7bdc-473b-bcbc-24d1c7f8fc72.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name    | Function           | IP Address| 
|------------|--------------------|---------------|
| Web-1   | Hosted DVWA | 10.0.0.5    | 
| Web-2   | Hosted DVWA | 10.0.0.6    | 
| Web-3   | Hosted DVWA | 10.0.0.7    | 

We have installed the following Beats on these machines:

For the project, I successfully installed Filebeat and Metric to collect and display logs created on Web-1, Web-2, and Web-3.

These Beats allow us to collect the following information from each machine:

Filebeat collects System Logs from Web-1, Web-2, and Web-3. It monitors these systems for activity such as new users, logins, and failed authentications.

Metricbeat collects Docker Metrics from Web-1, Web-2, and Web-3. It monitors 	these systems for CPU usage, Memory usage, and other system metrics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the hosts.yml and ansible.cfg file to /etc/ansible/ directory.
- Update the hosts.yml file to include the IP addresses of the webservers. For the ansible.cfg file, you can leave as is in the /etc/config/ directory.
- Run the playbook and navigate to virtual machines it was run on and check that the installation worked as expected. Run ‘docker ps’ to see if the playbook successfully installed on the virtual machine.

The playbooks are named ‘filebeat-playbook.yml’ and ‘metricbeat-filebook.yml’. The source location for both are in the /etc/ansible/ directory. Both of these will get copied to the /etc/metricbeat/ directory as their destination on the VM(s).

To get your Ansible playbook to run on specific machines, edit the hosts.yml file. Under the [webservers] tab, insert the IP address you want the Ansible playbook to run on. To install items on the ELK machine, under the [elk] tab, insert the IP of that machine there. Then, specify the specific ‘host’ you want it to run on at the top of the Ansible file.

The URL to verify the ELK machine is working is http://<public-ip/app/kibana>. For this project, the URL was ‘http://13.90.226.119:5601/app/kibana’.

Please follow these commands to run the playbook and have it install the configurations on the intended machines.

•	cd /etc/ansible/

•	ls -la

•	confirm the ‘filebeat-playbook.yml’ and ‘metricbeat-playbook.yml’ are in the directory

•	ansible-playbook <playbook-name>
 
•	For Filebeat, run ‘ansible-playbook filebeat-playbook.yml’
 
•	For Metricbeat, run ‘ansible-playbook metricbeat-playbook.yml’
 
The output of the playbook should look like the following.

![image](https://user-images.githubusercontent.com/91354803/134795127-078d276a-3061-4532-b7cf-c5936fa0f861.png)

