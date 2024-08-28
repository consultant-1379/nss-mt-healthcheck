#!/usr/bin/python
import sys
import datetime;
from mysql.connector import errorcode
from prettytable import PrettyTable
from prettytable import from_db_cursor
from datetime import date, datetime, timedelta
import mysql.connector


print 'Argument List:', str(sys.argv)

print("arg length is ",len(sys.argv));
print("arg is ",str(sys.argv[1]))


dmt='LMI_ENM'+str(sys.argv[1]);



print("dmt is" ,dmt);
serverlist=[];
for i in range(2,len(sys.argv)-1):
        server_name=sys.argv[i].replace(']','').replace('[','').replace(',','');
        serverlist.append(server_name);


print("serverlist is ",serverlist);
days=int(sys.argv[len(sys.argv)-1]);

start_date=datetime.now().date();
today=date.today();

end_date=date.today()-timedelta(days);
def daterange(start_date, end_date):
    for days in range(int ((start_date - end_date).days)):
        yield start_date - timedelta(days)


ports=['3307','3313','3310','3311','3312','3309','3314','3315','3316','3317','3318'];
#ports=['3307','3313','3310','3311','3312','3315','3316','3317','3318'];

def request_port(dmt):
	try:
		dmt_count=0;
		for port_check in ports:
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
			#cnx = mysql.connector.connect(user='zpassra', password='zpassra',host='10.44.91.39',port='3313',database='statsdb')
			cnx= mysql.connector.connect(**connection_config_dict)
			cursor=cnx.cursor();
			eg="select sites.name from sites where sites.name like 'LMI_ENM%'";
			cursor.execute(eg);
			myresult=cursor.fetchall();
			for x in myresult:
				count=0;
				if(dmt==x[0]):
					print(x[0]);
					print("found");	
					dmt_count=dmt_count+1;
					print("dmt_count is",dmt_count);
					port_org=port_check;
					eg1="select hostname from sites,servers where servers.siteid=sites.id and hostname like 'ieatnetsimv%'";
        		                cursor.execute(eg1);
	                                newresult=cursor.fetchall();
	                               	for i in newresult:
        	                               	for server_name in serverlist:
                	                               	if(server_name==i[0]):
                                                        	count=count+1;
		                	if(count==len(serverlist)):
						'''
						eg2="SELECT SUM(ecim_get) AS ecim_get,SUM(ecim_edit) AS ecim_edit,SUM(ecim_MOaction) AS ecim_MOaction,SUM(cpp_createMO) AS cpp_createMO,SUM(cpp_deleteMO) AS cpp_deleteMO,SUM(cpp_setAttr) AS cpp_setAttr,SUM(cpp_getMIB) AS cpp_getMIB,SUM(cpp_nextMOinfo) AS cpp_nextMOinfo,SUM(cpp_get) AS cpp_get,SUM(cpp_MOaction) AS cpp_MOaction,SUM(snmp_get) AS snmp_get,SUM(snmp_set) AS snmp_set,SUM(AVCbursts) AS AVCbursts,SUM(MCDbursts) AS MCDbursts,SUM(AlarmBursts) AS AlarmBursts,SUM(sftp_FileOpen) AS sftp_FileOpen,SUM(sftp_get_cwd) AS sftp_get_cwd FROM netsim_requests,sites,servers WHERE netsim_requests.siteid = sites.id AND sites.name = '"+dmt+"' AND netsim_requests.serverid = servers.id AND netsim_requests.time BETWEEN"+" '"+str(today)+" 00:00:00' AND"+" '"+str(today) +" 23:59:59' GROUP BY servers.id,servers.hostname ORDER BY hostname ASC";
						eg="SELECT servers.hostname AS hostname,ROUND(AVG(iowait+sys+user+IFNULL(steal,0)),0) AS avgcpu,ROUND(MAX((memused - membuffers - memcached)/1024),0) AS maxmem FROM hires_server_stat,servers WHERE hires_server_stat.serverid IN ( select id from servers where hostname like 'ieatnetsimv5062%')AND hires_server_stat.serverid = servers.id AND hires_server_stat.time BETWEEN"+" '"+str(today)+" 00:00:00' AND"+" '"+str(today) +" 23:59:59' GROUP BY servers.hostname ORDER BY hostname ASC";
						print("eg is ",eg);
						cursor.execute(eg);
						second_result=cursor.fetchall();
						cursor.execute(eg2);
						first_result=cursor.fetchall();
						print("firstresult is ",first_result);
						print("secondresult is ",second_result);
						if(len(first_result)==0 and len(second_result)==0):
							continue;
#						elif(len(first_result)==0 and len(second_result)==0 and port_check==ports[-1] and dmt_count==1):
#							return port_check;
						'''
						eg="SELECT COUNT(*) as count FROM site_data, sites WHERE site_data.date = '"+str(today)+"' AND site_data.siteid = sites.id AND sites.name="+"'"+dmt+"'";
						cursor.execute(eg);
						fin_result=cursor.fetchall();
						print("fin_result is ",fin_result);
						c=fin_result[0];
						print("c is",c[0]);
						#print("fin_result is ",fin_result[0]);
						if(c[0]!=0):
			                	        return port_check;
		'''
		if(len(first_result)==0 and len(second_result)==0 and port_check==ports[-1] and dmt_count==1):
                	return port_org;
		else:
		'''
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

	
	

def requestcountonvm_table(serverlist,start_date,end_date,dmt,days,port):
	connection_config_dict = {
                                    'user': 'zpassra',
                                    'password': 'zpassra',
                                    'host': '10.44.91.39',
                                    'port':port,
                                    'database': 'statsdb'
                                }
#	cnx = mysql.connector.connect(user='zpassra', password='zpassra',host='10.44.91.39',port='3307',database='statsdb')
        cnx= mysql.connector.connect(**connection_config_dict);
	for server_name in serverlist:
                start_date=datetime.now().date();
                end_date=date.today()-timedelta(days);
                tab= PrettyTable();

                tab.field_names=["DATE","ecim_get","ecim_edit","ecim_MOaction","cpp_createMO","cpp_deleteMO","cpp_setAttr","cpp_getMIB","cpp_nextMOinfo","cpp_get","cpp_MOaction","snmp_get","snmp_set","AVCbursts","MCDbursts","AlarmBursts","sftp_FileOpen","sftp_get_cwd"];
                cursor=cnx.cursor();
                for start_date in daterange(start_date, end_date):
                        #dmt='LMI_ENM419';
                        eg="SELECT SUM(ecim_get) AS ecim_get,SUM(ecim_edit) AS ecim_edit,SUM(ecim_MOaction) AS ecim_MOaction,SUM(cpp_createMO) AS cpp_createMO,SUM(cpp_deleteMO) AS cpp_deleteMO,SUM(cpp_setAttr) AS cpp_setAttr,SUM(cpp_getMIB) AS cpp_getMIB,SUM(cpp_nextMOinfo) AS cpp_nextMOinfo,SUM(cpp_get) AS cpp_get,SUM(cpp_MOaction) AS cpp_MOaction,SUM(snmp_get) AS snmp_get,SUM(snmp_set) AS snmp_set,SUM(AVCbursts) AS AVCbursts,SUM(MCDbursts) AS MCDbursts,SUM(AlarmBursts) AS AlarmBursts,SUM(sftp_FileOpen) AS sftp_FileOpen,SUM(sftp_get_cwd) AS sftp_get_cwd FROM netsim_requests,sites,servers WHERE netsim_requests.siteid = sites.id AND sites.name = '"+dmt+"' AND netsim_requests.serverid = servers.id AND netsim_requests.time BETWEEN"+" '"+str(start_date)+" 00:00:00' AND"+" '"+str(start_date) +" 23:59:59' GROUP BY servers.id,servers.hostname having servers.hostname="+"'"+server_name+"'"+" ORDER BY hostname ASC";

                        cursor.execute(eg);
        #row = dict(zip(cursor.column_names, cursor.fetchone()))

                        for i in cursor.column_names:
                                i=i.strip('\'u')
                        myresult = cursor.fetchall()
                        if(len(myresult) == 0):
                                x=("NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA");
                                x=(str(start_date),)+x;
                        else:
                                for x in myresult:
                                        x=(str(start_date),)+x;
                        tab.add_row(x);
                print(tab.get_string(title=server_name));




def cpuinfo_table(serverlist,start_date,end_date,dmt,days,port):
        connection_config_dict = {
                                    'user': 'zpassra',
                                    'password': 'zpassra',
                                    'host': '10.44.91.39',
                                    'port':port,
                                    'database': 'statsdb'
                                }
#       cnx = mysql.connector.connect(user='zpassra', password='zpassra',host='10.44.91.39',port='3307',database='statsdb')
        cnx= mysql.connector.connect(**connection_config_dict);
        for server_name in serverlist:
                start_date=datetime.now().date();
                end_date=date.today()-timedelta(days);
                tab1= PrettyTable();
		tab1.field_names=["Date","AvgCPU(%)","MaxMemoryUsed(GB)"];
                cursor=cnx.cursor();
                for start_date in daterange(start_date, end_date):
                       #dmt='LMI_ENM419';
	               # eg1="SELECT ROUND(AVG(iowait+sys+user+IFNULL(steal,0)),0) AS avgcpu,ROUND(MAX((memused - membuffers - memcached)/1024),0) AS maxmem  FROM hires_server_stat,servers WHERE hires_server_stat.serverid in ( select id from servers where hostname like 'ieatnetsimv%' ) AND hires_server_stat.time BETWEEN"+" '"+str(start_date)+" 00:00:00' AND"+" '"+str(start_date) +" 23:59:59' GROUP BY servers.hostname having servers.hostname="+"'"+server_name+"'"+" ORDER BY hostname ASC";
			eg1="SELECT ROUND(AVG(iowait+sys+user+IFNULL(steal,0)),0) AS avgcpu,ROUND(MAX((memused - membuffers - memcached)/1024),0) AS maxmem FROM hires_server_stat,servers WHERE hires_server_stat.serverid IN ( select id from servers where hostname like '"+server_name+"' ) AND hires_server_stat.serverid = servers.id AND hires_server_stat.time BETWEEN '"+str(start_date) +" 00:00:00' AND '"+str(start_date)+" 23:59:59' GROUP BY servers.hostname ORDER BY hostname ASC";
			#print("cpu info is",eg1);
                        cursor.execute(eg1);
        #row = dict(zip(cursor.column_names, cursor.fetchone()))

                        for i in cursor.column_names:
                                i=i.strip('\'u')
                        myresult = cursor.fetchall()
                        if(len(myresult) == 0):
                                x=("NA","NA");
                                x=(str(start_date),)+x;
                        else:
                                for x in myresult:
                                        x=(str(start_date),)+x;
                        tab1.add_row(x);
                print(tab1.get_string(title=server_name));
	
	


port=request_port(dmt);


print("return port is",port);
#print(type(port));
if(port==0):
	print("The mentioned ddp and servers are not found in the database");
else:
	requestcountonvm_table(serverlist,start_date,end_date,dmt,days,port);
	cpuinfo_table(serverlist,start_date,end_date,dmt,days,port);

