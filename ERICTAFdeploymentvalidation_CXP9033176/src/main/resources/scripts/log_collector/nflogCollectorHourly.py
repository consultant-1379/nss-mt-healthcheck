#!/usr/bin/python
from urllib.request import urlopen
#import urllib2
import ssl
import re
import csv;
import sys
import json
import sys
from mysql.connector import errorcode
from prettytable import PrettyTable
from prettytable import from_db_cursor
from datetime import date, datetime, timedelta
import mysql.connector
from requests.compat import urljoin
import json, paramiko,os,sys;
import warnings
warnings.filterwarnings(action='ignore',module='.*paramiko.*')
warnings.filterwarnings(action='ignore',module='.*Cryptography.*')
print ('Argument List:', str(sys.argv))


#ssl._create_default_https_context = ssl._create_unverified_context
#request = urlopen('https://cifwk-oss.lmera.ericsson.se/dmt/clusters/'+str(sys.argv[1])+'/');
#urlContents=request.read().decode('utf-8');
#urlContents=request.read();
#name=(urlContents.split('<b class="generalPageNewLook-title">')[1]).split('</b>')[0]
#if "Deployment" in name:
#    print("normal cluster");
#    dmt='LMI_ENM'+str(sys.argv[1]);
#    eg="select sites.name from sites where sites.name like 'LMI_ENM%'";
#else:
#    print("open stack server");
#    dmt="LMI_"+name;
#    eg="select sites.name from sites where sites.name like 'LMI_"+name+"%'";

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

#days=int(sys.argv[len(sys.argv)-1]);

time_range=sys.argv[len(sys.argv)-1];

start_time=time_range.split("-")[0];
end_time=time_range.split("-")[1];
start_date=datetime.now().date();
ports=['3307','3313','3310','3311','3312','3309','3314','3315','3316','3317','3318'];

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
            date_now=str(start_date).split("-");
            date_file=date_now[0]+date_now[1]+date_now[2];
            netsimHost=netsimBox+".athtem.eei.ericsson.se"
            vm=paramiko.SSHClient()
            vm.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            vm.connect(hostname=netsimHost,username='netsim',password='netsim')
            str_match=str(end_time)+".log";
            cmd1="ls -lrth /netsim/inst/netsimprmn/*.log|grep %s"%(str_match);
            stdin,stdout,stderr = vm.exec_command(cmd1);
            file_count=stdout.read().split("\n");
            for i in file_count:
                file_name=i.split(" ")[-1];
                if(file_name!=""):
                    cmd="grep 'netsimprmn' %s |wc -l"%(file_name)
                    stdin,stdout,stderr = vm.exec_command(cmd);
                    prmn_count=stdout.read();
                    print("Netsimprmn count for "+file_name+ " is "+str(prmn_count));
        except:
            print("error in fetching netsimprmn logs");

def generateUrls(serverlist,start_date,dmt,port):
    ddps={"ddpi.athtem.eei.ericsson.se":3307,"ddpst.athtem.eei.ericsson.se":3309,"ddpa.athtem.eei.ericsson.se":3310,"ddp.athtem.eei.ericsson.se":3308,"ddp2.athtem.eei.ericsson.se":3311,"ddpenm1.athtem.eei.ericsson.se":3312,"ddpenm2.athtem.eei.ericsson.se":3313,"ddpenm3.athtem.eei.ericsson.se":3314,"ddpenm4.athtem.eei.ericsson.se":3315,"ddpenm5.athtem.eei.ericsson.se":3316,"ddpenm6.athtem.eei.ericsson.se":3317,"ddpenm7.athtem.eei.ericsson.se":3318};
    ddp_link='';
    for k,v in ddps.items():
        if (port == str(v)):
            print(port);
            ddp_link=k;
            print("ddp link fetched is "+ddp_link);

    for server_name in serverlist:
        tab= PrettyTable();
        tab.field_names=["Date","DDP LINKS FOR CPU STATS"];
        list1=[];
        list1.append(start_date);
        a=str(start_date).split("-");
        base='https://'+ddp_link+'/php/server.php?site='+dmt+'&dir='+a[-1]+a[-2]+a[-3]+'&date='+str(start_date)+'&oss=tor&server='+server_name
        list1.append(base);
        tab.add_row(list1);
        print(tab.get_string(title=server_name));


def requestcountonvm_table(serverlist,start_time,end_time,dmt,port,time_range):
    connection_config_dict = {
                                'user': 'zpassra',
                                'password': 'zpassra',
                                'host': '10.44.91.39',
                                'port':port,
                                'database': 'statsdb'
                            }
    cnx= mysql.connector.connect(**connection_config_dict);
    for server_name in serverlist:
        #start_date='2019-05-26';
        #start_time="00:00:00";
        #end_time="01:00:00";
        start_date=datetime.now().date();
        tab= PrettyTable();
        tab.field_names=["TIME_RANGE","DATE","ecim_get","ecim_edit","ecim_MOaction","cpp_createMO","cpp_deleteMO","cpp_setAttr","cpp_getMIB","cpp_nextMOinfo","cpp_get","cpp_MOaction","snmp_get","snmp_set","AVCbursts","MCDbursts","AlarmBursts","sftp_FileOpen","sftp_get_cwd"];
        cursor=cnx.cursor();
        eg="SELECT SUM(ecim_get) AS ecim_get,SUM(ecim_edit) AS ecim_edit,SUM(ecim_MOaction) AS ecim_MOaction,SUM(cpp_createMO) AS cpp_createMO,SUM(cpp_deleteMO) AS cpp_deleteMO,SUM(cpp_setAttr) AS cpp_setAttr,SUM(cpp_getMIB) AS cpp_getMIB,SUM(cpp_nextMOinfo) AS cpp_nextMOinfo,SUM(cpp_get) AS cpp_get,SUM(cpp_MOaction) AS cpp_MOaction,SUM(snmp_get) AS snmp_get,SUM(snmp_set) AS snmp_set,SUM(AVCbursts) AS AVCbursts,SUM(MCDbursts) AS MCDbursts,SUM(AlarmBursts) AS AlarmBursts,SUM(sftp_FileOpen) AS sftp_FileOpen,SUM(sftp_get_cwd) AS sftp_get_cwd FROM netsim_requests,sites,servers WHERE netsim_requests.siteid = sites.id AND sites.name = '"+dmt+"' AND netsim_requests.serverid = servers.id AND netsim_requests.time BETWEEN '"+str(start_date)+" "+str(start_time)+"' AND '"+str(start_date)+" "+str(end_time)+"' GROUP BY servers.id,servers.hostname having servers.hostname='"+server_name+"' ORDER BY hostname ASC;";
        cursor.execute(eg);
        for i in cursor.column_names:
            i=i.strip('\'u')
        myresult = cursor.fetchall()
        if(len(myresult) == 0):
            x=(time_range,"NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA","NA");
            #x=(str(time_range),)+x;
            x=(str(start_date),)+x;
            print(x);
        else:
            for x in myresult:
                x=(str(start_date),)+x;
                x=(str(time_range),)+x;
                tab.add_row(x);
        tab.title="sravs";
        print("####################################Request Counts for "+server_name+"####################################");
        print(tab.get_string(title=server_name));





port=request_port(dmt,eg);


if(port==0):
    print("The mentioned ddp and servers are not found in the database");
else:
    requestcountonvm_table(serverlist,start_time,end_time,dmt,port,time_range)
    #prmnlogs(serverlist,start_date,dmt,port);
    generateUrls(serverlist,start_date,dmt,port);
