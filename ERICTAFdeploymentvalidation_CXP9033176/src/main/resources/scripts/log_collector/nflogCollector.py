#!/usr/bin/python
import urllib3
import re
import sys
import json
import sys
import datetime;
from mysql.connector import errorcode
from prettytable import PrettyTable
from prettytable import from_db_cursor
from datetime import date, datetime, timedelta
import mysql.connector
from requests.compat import urljoin

#print 'Argument List:', str(sys.argv)

print("arg length is ",len(sys.argv));
print("arg is ",str(sys.argv[1]))


if(len(str(sys.argv[1]))==3):
	dmt='LMI_ENM'+str(sys.argv[1]);
	eg="select sites.name from sites where sites.name like '"+dmt+"%'";
else:
	dmt="LMI_"+str(sys.argv[1]);
	eg="select sites.name from sites where sites.name like '"+dmt+"%'";


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

def request_port(dmt,eg_dmt):
        print("dmt in request_port is",dmt);
        dmt_count=0;

        for port_check in ports:
                try:
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
                        #print("eg_dmt is ",eg_dmt);
                        #eg="select sites.name from sites where sites.name like 'LMI_ENM%'";
                        cursor.execute(eg_dmt);
                        myresult=cursor.fetchall();
                        if(port_check=='3315'):
                                print("eg is ",eg_dmt);
                                print("myresult is ",myresult);
                        for x in myresult:
                                count=0;
                                if(dmt==x[0]):
                                        print(x[0]);
                                        print("found");
                                        dmt_count=dmt_count+1;
                                        print("dmt_count is",dmt_count);
                                        port_org=port_check;
                                        eg1="select distinct(hostname) from sites,servers where servers.siteid=sites.id and hostname like 'ieatnetsimv%'";
                                        cursor.execute(eg1);
                                        newresult=cursor.fetchall();
                                        #print("newresult is ",newresult);
                                        for i in newresult:
                                                for server_name in serverlist:
                                                        if(server_name==i[0]):
                                                                count=count+1;
                                        if(count==len(serverlist)):
                                                eg="SELECT COUNT(*) as count FROM site_data, sites WHERE site_data.date = '"+str(today)+"' AND site_data.siteid = sites.id AND sites.name="+"'"+dmt+"'";
                                                cursor.execute(eg);
                                                fin_result=cursor.fetchall();
                                                #print("fin_result is ",fin_result);
                                                c=fin_result[0];
                                                print("count in sites data schema is",c[0]);
                                                #print("fin_result is ",fin_result[0]);
                                                if(c[0]!=0):
                                                        return port_check;

                except mysql.connector.Error as err:
                        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                                print(port_check);
                                print("Something is wrong with your user name or password")
                        elif err.errno == errorcode.ER_BAD_DB_ERROR:
                                print("Database does not exist")
                        else:
                                print("err is ",err)
        if(port_check==ports[-1]):
                return 0;



def requestcountonvm_table(serverlist,start_date,end_date,dmt,days,port):
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
                id_eg="select id as fetched_serverid from servers where hostname like '"+server_name+"'";
                cursor.execute(id_eg);
                res=cursor.fetchall();
                print("res is",res);
                print("serverid is ",res[0][0]);
                fetched_serverid=res[0][0];
                for start_date in daterange(start_date, end_date):
                       #dmt='LMI_ENM419';
                        eg1="SELECT ROUND(AVG(iowait+sys+user+IFNULL(steal,0)),0) AS avgcpu,ROUND(MAX((memused - membuffers - memcached)/1024),0) AS maxmem FROM hires_server_stat,servers WHERE hires_server_stat.serverid ="+"'"+str(fetched_serverid)+"'"+" AND hires_server_stat.serverid = servers.id AND hires_server_stat.time BETWEEN '"+str(start_date) +" 00:00:00' AND '"+str(start_date)+" 23:59:59' GROUP BY servers.hostname ORDER BY hostname ASC";
#                       print("cpu info is",eg1);
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





def generateUrls(serverlist,start_date,end_date,dmt,days,port):
        #print("port is",type(port));
        ddps={"ddpi.athtem.eei.ericsson.se":3307,"ddpst.athtem.eei.ericsson.se":3309,"ddpa.athtem.eei.ericsson.se":3310,"ddp.athtem.eei.ericsson.se":3308,"ddp2.athtem.eei.ericsson.se":3311,"ddpenm1.athtem.eei.ericsson.se":3312,"ddpenm2.athtem.eei.ericsson.se":3313,"ddpenm3.athtem.eei.ericsson.se":3314,"ddpenm4.athtem.eei.ericsson.se":3315,"ddpenm5.athtem.eei.ericsson.se":3316,"ddpenm6.athtem.eei.ericsson.se":3317,"ddpenm7.athtem.eei.ericsson.se":3318};
        ddp_link='';
#        print("items are ",ddps.items());
        for k,v in ddps.items():
#               print("v is",v)
                if (port == str(v)):
                        print(port);
                        ddp_link=k;
                        print("ddp link fetched is "+ddp_link);

        for server_name in serverlist:
#               list1=[];
                tab= PrettyTable();
                tab.field_names=["Date","DDP LINKS FOR CPU STATS"];
                #print("CPU LINKS FOR "+server_name);
                for present_date in daterange(start_date, end_date):
                        list1=[];
                        list1.append(present_date);
                        a=str(present_date).split("-");
                        base='https://'+ddp_link+'/php/server.php?site='+dmt+'&dir='+a[-1]+a[-2]+a[-3]+'&date='+str(present_date)+'&oss=tor&server='+server_name
                       # print(base);
                        list1.append(base);
                        tab.add_row(list1);
#                       print("\n");
                print(tab.get_string(title=server_name));


#        return ddp_link





port=request_port(dmt,eg);


#print(type(port));
if(port==0):
        print("The mentioned ddp and servers are not found in the database");
else:
        requestcountonvm_table(serverlist,start_date,end_date,dmt,days,port);
#       cpuinfo_table(serverlist,start_date,end_date,dmt,days,port);
#       port=request_port(dmt);
#       print("return port is",port);
        ddplink=generateUrls(serverlist,start_date,end_date,dmt,days,port);
#       print("ddp is",ddplink);

