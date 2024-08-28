#!/usr/bin/python
import urllib2
import re
import csv;
import sys
import json
import sys
import datetime;
from mysql.connector import errorcode
from prettytable import PrettyTable
from prettytable import from_db_cursor
from datetime import date, datetime, timedelta
import mysql.connector
#from requests.compat import urljoin
import urllib, json, paramiko, datetime, os,sys;

print 'Argument List:', str(sys.argv)


request = urllib2.urlopen('https://cifwk-oss.lmera.ericsson.se/dmt/clusters/'+str(sys.argv[1])+'/');
urlContents=request.read();
name=(urlContents.split('<b class="generalPageNewLook-title">')[1]).split('</b>')[0]
if "Deployment" in name:
	print("normal cluster");
	dmt='LMI_ENM'+str(sys.argv[1]);
	eg="select sites.name from sites where sites.name like 'LMI_ENM%'";
else:
	print("open stack server");
	dmt="LMI_"+name;
	eg="select sites.name from sites where sites.name like 'LMI_"+name+"%'";
	


serverlist=[];
for i in range(2,len(sys.argv)-1):
        server_name=sys.argv[i].replace(']','').replace('[','').replace(',','');
        serverlist.append(server_name);


print("serverlist is ",serverlist);

#days=int(sys.argv[len(sys.argv)-1]);

time_range=sys.argv[len(sys.argv)-1];

start_time=time_range.split("-")[0];
end_time=time_range.split("-")[1];
#print("time_range is",time_range);

#start_date=datetime.now().date();
start_date=date.today();
ports=['3307','3313','3310','3311','3312','3309','3314','3315','3316','3317','3318'];
#ports=['3307','3313','3310','3311','3312','3315','3316','3317','3318'];

def request_port(dmt,eg_dmt):
	try:
		print("dmt in request_port is",dmt);
		dmt_count=0;
		for port_check in ports:
			count1=0;
			print("port is ",port_check);
			dmts=[];
			dmts_temp=[];
			connection_config_dict = {
 				    'user': 'zpassra',
				    'password': 'zpassra',
				    'host': '10.44.91.39',
				    'port':port_check,
				    'database': 'statsdb'
				}
			cnx= mysql.connector.connect(**connection_config_dict)
			cursor=cnx.cursor();
			cursor.execute(eg_dmt);
			myresult=cursor.fetchall();
			for x in myresult:
				if(dmt==x[0]):
					print(x[0]);
					print("found");	
					dmt_count=dmt_count+1;
					print("dmt_count is",dmt_count);
					port_org=port_check;
					eg1="select distinct(hostname) from sites,servers where servers.siteid=sites.id and hostname like 'ieatnetsimv%'";
        		                cursor.execute(eg1);
	                                newresult=cursor.fetchall();
	                               	for i in newresult:
        	                               	for server_name in serverlist:
                	                               	if(server_name==i[0]):
                                                        	count1=count1+1;
					print("count is ",count1,"len(serverlist) is",len(serverlist));
		                	if(count1==len(serverlist)):
						eg="SELECT COUNT(*) as count FROM site_data, sites WHERE site_data.date = '"+str(start_date)+"' AND site_data.siteid = sites.id AND sites.name="+"'"+dmt+"'";
						cursor.execute(eg);
						fin_result=cursor.fetchall();
						c=fin_result[0];
						print("count in sites data schema is",c[0]);
						if(c[0]!=0):
			                	        return port_check;
		if(port_check==ports[-1]):
			return 0;
	except mysql.connector.Error as err:
       		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			print(port_check);
               		print("Something is wrong with your user name or password")
	        elif err.errno == errorcode.ER_BAD_DB_ERROR:
       		        print("Database does not exist")
        	else:
       	        	print("err is ",err)


def prmnlogs(serverlist,start_date,dmt,port):
	for netsimBox in serverlist:
        	try:
				#print("start_Date is ",str(start_date));
			
 #               	print("\n");
#	                print("****Fetching data for "+netsimBox+" ***********************");
        	        
			date_now=str(start_date).split("-");	
			#print("date_now is ",date_now);
			date_file=date_now[0]+date_now[1]+date_now[2];
                	netsimHost=netsimBox+".athtem.eei.ericsson.se"
	                vm=paramiko.SSHClient()
        	        vm.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                	vm.connect(hostname=netsimHost,username='netsim',password='netsim')
#print("yes");
                        str_match=str(end_time)+".log";
                        #file_name="Netsimprmn_"+date_file+"_"+str(start_time)+"-"+date_file+"_"+str(end_time)+".log";
#                       print("filename is ",file_name);

                        cmd1="ls -lrth /netsim/inst/netsimprmn/*.log|grep %s"%(str_match);
#                       print("cmd1 is ",cmd1);
                        stdin,stdout,stderr = vm.exec_command(cmd1);
                        file_count=stdout.read().split("\n");
#                       print("log files are",file_count);
 #                       print("*******************Check for netsimprmn logs********************")
                        for i in file_count:
                                #print("file is ",i);
                                file_name=i.split(" ")[-1];
                                if(file_name!=""):
                                        #print("log_file name is ",file_name);
                                        cmd="grep 'netsimprmn' %s |wc -l"%(file_name)
					#print("cmd is ",cmd);
                                        stdin,stdout,stderr = vm.exec_command(cmd);
                                        prmn_count=stdout.read();
                                        print("Netsimprmn count for "+file_name+ " is "+str(prmn_count));
		except:
			print("error in fetching netsimprmn logs");
	
def generateUrls(serverlist,start_date,dmt,port):
	#print("port is",type(port));
	ddps={"ddpi.athtem.eei.ericsson.se":3307,"ddpst.athtem.eei.ericsson.se":3309,"ddpa.athtem.eei.ericsson.se":3310,"ddp.athtem.eei.ericsson.se":3308,"ddp2.athtem.eei.ericsson.se":3311,"ddpenm1.athtem.eei.ericsson.se":3312,"ddpenm2.athtem.eei.ericsson.se":3313,"ddpenm3.athtem.eei.ericsson.se":3314,"ddpenm4.athtem.eei.ericsson.se":3315,"ddpenm5.athtem.eei.ericsson.se":3316,"ddpenm6.athtem.eei.ericsson.se":3317,"ddpenm7.athtem.eei.ericsson.se":3318};
	ddp_link='';
#        print("items are ",ddps.items());
        for k,v in ddps.items():
#		print("v is",v)
                if (port == str(v)):
			print(port);
                        ddp_link=k;
			print("ddp link fetched is "+ddp_link);

	for server_name in serverlist:
#		list1=[];
		tab= PrettyTable();
		tab.field_names=["Date","DDP LINKS FOR CPU STATS"];
		#print("CPU LINKS FOR "+server_name);
		list1=[];
		list1.append(start_date);
		a=str(start_date).split("-");
		base='https://'+ddp_link+'/php/server.php?site='+dmt+'&dir='+a[-1]+a[-2]+a[-3]+'&date='+str(start_date)+'&oss=tor&server='+server_name
	               # print(base);
		list1.append(base);
		tab.add_row(list1);
#			print("\n");	
		print(tab.get_string(title=server_name));



def requestcountonvm_table(serverlist,start_date,dmt,port):
	for netsimBox in serverlist:
			
        	try:
			tab=PrettyTable();
	                print("****Fetching data for "+netsimBox+" *****");
	                netsimHost=netsimBox+".athtem.eei.ericsson.se"
        	        vm=paramiko.SSHClient()
                	vm.set_missing_host_key_policy(paramiko.AutoAddPolicy())
	                vm.connect(hostname=netsimHost,username='netsim',password='netsim');			
			str_match=str(end_time)+".data";
#			print("str_matach is ",str_match);
	                cmd1="ls -lrth /netsim/inst/netsimprmn/*.data|grep %s"%(str_match);
#			print("cmd1 is ",cmd1);
        	        stdin,stdout,stderr = vm.exec_command(cmd1);
                	file_count=stdout.read().split("\n");
        	        for i in file_count:
                		#print("file is ",i);
                        	file_name=i.split(" ")[-1];
				if(file_name !=''):
					tab=PrettyTable();
					fin_list=[];
					fin_list.append(str(time_range));
					cmd2="rm -rf /root/copy.csv";
					os.system(cmd2);
					cmd="touch /root/copy.csv";
					os.system(cmd);
					fd = open("/root/copy.csv","r+")
					cmd1 = "cat %s\n"%(file_name);
#					os.system(cmd1);
					stdin,stdout,stderr = vm.exec_command(cmd1)
		       		        for line in stdout.read():
					#	print("line is ",line);
		               		        fd.write(line);
					fd.close();
			                print "File copy successful";
#					for i in range(1,11):
#				        	total=0;
					with open("/root/copy.csv", 'r') as csvfile:
						csvreader=csv.reader(csvfile);
						fields=csvreader.next();
						#print("fileds are",fields);
						tab.field_names=fields;
						x=len(fields);
						for i in range(1,x):
							total=0;
					                #headerline = csvfile.next();
							for row in csv.reader(csvfile):
								total+= int(row[i]);
								#print("total is ",total);
							fin_list.append(total);
							#print("finlist is",fin_list);
					tab.add_row(fin_list);
					name=file_name.split("/")[-1];
					print(tab.get_string(title=name));
#					x=len(fields);
					#form_table(fileds,x);

		except:
			print("DATA NOT FETCHED PROPERLY");	


port=request_port(dmt,eg);


if(port==0):
	print("The mentioned ddp and servers are not found in the database");
else:
	requestcountonvm_table(serverlist,start_date,dmt,port);
	prmnlogs(serverlist,start_date,dmt,port);
	generateUrls(serverlist,start_date,dmt,port);
