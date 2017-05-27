# aker-freeipa-playbook

* This playbook helps you install Aker and its dependencies :
  * Python modules
  * FreeIPA
  * Elasticsearch
  * Kibana
  * Filebeat
  * Logstash
  
  Clone this repo to your ansible master machine and declare your hosts in `hosts` file
   ```
  [freeipa_masters] # FreeIPA server (Optional)
  master1.ipa.example 

  [freeipa_clients] # FreeIPA Clients
  aker.ipa.example
  web1.ipa.example
  web2.ipa.example
  db1.ipa.example
  db2.ipa.example


  [aker_servers] # Aker server
  aker.ipa.example

  [db_servers] # Optional for the sample demo environment 
  db1.ipa.example
  db2.ipa.example

  [elk_servers] # Elasticsearch server
  elasticsearch.ipa.example
  ```
  
  Now to start the install you have several options :
  
 * **install_freeipa** (default true) , this will install and configure FreeIPA server and clients .
 
 * **install_elasticsearch** (default true) , to install and configure the whole ELK stack .
 
 * **aker_idp** (default IPA), this to determine the Identitry provider mecahnism used by Aker , options are IPA for FreeIPA or Json fo a local `/etc/hosts.json` file .
 
 * **aker_load_sample_env** (default True), whether to setup a sample dmeo environment with a couple of test users or not , this applies on both IPA and Json optins .
 
 * **aker_admin_user** (default vagrant), the OS user on aker server that Aker wont be forced on, this user to be used for admin tasks on aker server .
 
 * **dns** (default 192.168.122.1), this is the dns resolver in your environment , it will be incorporated with FreeIPA
 
 
 Lets see a couple of installataion examples:
 
 * `ansible-playbook aker-freeipa.yml`
   * Use all above defaults 
 * `ansible-playbook -e "install_freeipa=False aker_idp=Json" aker-freeipa.yml`
   * Install using Json instead
 * `ansible-playbook -e "install_freeipa=False install_elasticsearch=False aker_idp=Json" aker-freeipa.yml`
   * Install Json and skip ELK stack .
