#!/usr/bin/python
import urllib, json, paramiko, datetime, os,sys;
from datetime import timedelta



serverlist=[];
for i in range(1,len(sys.argv)):
        server_name=sys.argv[i].replace(']','').replace('[','').replace(',','');
        serverlist.append(server_name);

for netsimBox in serverlist:
        try:
		print("###################################################################################");
                print("-----------------"+"Fetching data for "+netsimBox+"------------------------------");
		print("###################################################################################");
                
                netsimHost=netsimBox+".athtem.eei.ericsson.se"
                vm=paramiko.SSHClient()
                vm.set_missing_host_key_policy(paramiko.AutoAddPolicy())
                vm.connect(hostname=netsimHost,username='netsim',password='netsim')
                cmd = "ls /netsim/inst/*.dump";
                stdin,stdout,stderr = vm.exec_command(cmd);
                dumpfiles=stdout.read();
		print("--------------------------------"+"Check for crash dumps "+"-----------------------------");
		print(" Description : Checking if there are any erlang crash dumps on the NETSim VM. Usually crash dumps occur when there is a disgraceful exit of erlang code. ");
		print("----------------------------------------------------------------------------------------");
#               print("dumpfiles are",dumpfiles);
                if(dumpfiles==''):
                        print("No crash dumps found");
			print("###################################################################################");
                else:
                        dumpfiles=(dumpfiles.split("\n"));
                        print("dumpfiles are",len(dumpfiles));
                        print("-------------------------------Crash dumps-----------------------------------------");
                        for file_name in dumpfiles:
                                if(file_name!=''):
                                        print("filename: "+file_name);
                                        cmd='cat %s | head -5'%(file_name);
                                        #print(cmd);
                                        stdin,stdout,stderr=vm.exec_command(cmd);
                                        print(stdout.read());
					print("-------------------------------------------------------------");
			print("###################################################################################");
        except:
                print("No crash dumps found");
	try:
		print("--------------------------------"+"Backup File Size Check"+"-----------------------------------");
		print(" Description : Displays the amount of disk consumed by all CV's");
		cmd_backup="du -shc    /netsim/netsim_dbdir/simdir/netsim/netsimdir/LTE*/*/fs/d/configuration/cv/*|tail -1";
		stdin,stdout,stderr=vm.exec_command(cmd_backup);
                print(stdout.read());
                print("###################################################################################");

        except:
                print("No backup file size found as ERBS simulations are not present on the server.");
                print("###################################################################################");
        
	try:
		print("--------------------------------"+"Load Balancing"+"-------------------------------------");
		print(" Description : Displays the load balancing for the nodes present on the NETSim VM.");
		print("----------------------------------------------------------------------------------------");
                #print("********************Load Balancing********************");
                cmd2="echo '.show serverloadconfig'|~/inst/netsim_shell"
                stdin,stdout,stderr=vm.exec_command(cmd2);
                print(stdout.read());
		print("###################################################################################");
		
        except:
                print("Load balance not set properly");
		print("###################################################################################");
		

        try:
                cmd4="echo '.show simulations'|~/inst/netsim_shell";
		print("--------------------------------"+"Simulation check"+"-----------------------------------");
		print("Description : Checks if there are any extra simulations present on the NETSim VM other than rolled out simulations.");
		print("----------------------------------------------------------------------------------------");
#                print("*******************Check for duplicate sims********************");
                stdin,stdout,stderr=vm.exec_command(cmd4);
                sim_netsimdir=stdout.read();
                sims=sim_netsimdir.split("\n");
                simlist_netsimdir=[];
                for i in range(1,(len(sims)-2)):
                        simlist_netsimdir.append(sims[i]);
                cmd3="echo '.show simulations'|~/inst/netsim_shell|wc -l"
                link_cmd="cat /netsim/simdepContents/Simnet.Urls|wc -l";
                stdin,stdout,stderr=vm.exec_command(cmd3);
                sim_count=int(stdout.read())-2;
                stdin,stdout,stderr = vm.exec_command(link_cmd);
                link_count=stdout.read().strip("\n");
                link_count=int(link_count);
                extra_sim=[];

                if(link_count==sim_count):
                        print("Simulations rolled out properly.No extra simulations found");
			print("###################################################################################");
			
                else:
                        print("Unwanted simulations present in vm");
                        simlist_actual=[];
                        read_urlscmd="/netsim/simdepContents/Simnet.Urls";
                        stdin,stdout,stderr=vm.exec_command(read_urlscmd);
                        file=stdout.read();
                        data=file.split("\n");
                        for i in data:
                                i=i.split("/");
                                chunk=((i[-1].split('-'))[-1]);
                                i=((i[-1].strip(chunk)).rstrip("-"));
                                simlist_actual.append(i);
                        for i in simlist_netsimdir:
                                if(i in simlist_actual):
                                        continue;
                                else:
                                        extra_sim.append(i);
                        print("extra sims present are");
                        for i in extra_sim:
                                print(i);
			print("###################################################################################");
 

        except:
                print("no extra sims found");
        try:
		print("--------------------------------"+"Crontab check"+"---------------------------------------");
		print(" Description : Checking if there are any extra scripts included in the crontab");
		print("----------------------------------------------------------------------------------------");
                #print("******************crontab check**********************");
                flag=0;
                cmd="crontab -l";
                stdin,stdout,stderr = vm.exec_command(cmd);
                cronfiles=stdout.read();
                actual="# DO NOT EDIT THIS FILE - edit the master and reinstall.\n# (/tmp/periodic_hc_crontab installed on Fri Feb 22 11:06:31 2019)\n# (Cron version V5.0 -- $Id: crontab.c,v 1.12 2004/01/23 18:56:42 vixie Exp $)\n00 * * * * sh /netsim/inst/netsimbase/inst/timezone_offset.sh > /netsim/inst/DSTChangeApply.log\n##############################Netsim RAM cleanup######################################################\n0,15,30,45 * * * * echo -e '.e rpc:multicall(nodes(),erlang,spawn,[fun() -> [erlang:garbage_collect(P)||P<-erlang:processes()] end]).'|/netsim/inst/netsim_shell > /dev/null 2>&1\n##############################Netsim RAM cleanup######################################################\n0 0 * * * /var/simnet/enm-ni-simdep/scripts/Cleanlog.sh > /dev/null 2>&1\n##############################Cleanup logs############################################################\n0,15,30,45 * * * * /netsim_users/pms/bin/genStats -r 15 >> /netsim_users/pms/logs/genStats_15min.log 2>&1\n0,15,30,45 * * * * /netsim_users/pms/bin/startPlaybacker.sh -r 15 >> /netsim_users/pms/logs/playbacker_15min.log 2>&1\n0 * * * * /netsim_users/pms/bin/rmPmFiles >> /netsim_users/pms/logs/rmFiles.log 2>&1\n0,15,30,45 * * * * /netsim_users/pms/bin/lte_rec.sh -r 15 -f CELLTRACE:UETRACE:CTUM >> /netsim_users/pms/logs/lte_rec_15min.log 2>&1\n* * * * * /netsim_users/pms/bin/lte_rec.sh -r 1 -f EBS:EBM >> /netsim_users/pms/logs/lte_rec_1min.log 2>&1\n* * * * * /netsim_users/hc/bin/genstat_report.sh -p true >> /netsim_users/pms/logs/periodic_healthcheck.log 2>&1";
                cronfiles_test=cronfiles.split("\n");

                acutal_test=actual.split("\n");
                for i in cronfiles_test:
                        if(i.startswith("#") or (i in actual)):
                                continue;
                        else:
                                flag=1;
                                print("extra script found in crontab ",i);
		
                if(flag==0):
                        print("No issue in crontab setting");
			print("###################################################################################");
        except:
                print("issue in fetching crontab values");
	try:
		print("--------------------------------"+"Root Crontab check"+"---------------------------------------");
                #print("******************crontab check**********************");
                flag_root=0;
                vm.connect(hostname=netsimHost,username='root',password='shroot')
                cmd="crontab -l";
                stdin,stdout,stderr = vm.exec_command(cmd);
                cronfiles_root=stdout.read();
                #print("cronfiles are "+cronfiles_root);
                cronfiles_root_test=cronfiles_root.split("\n");
                actual_root="0 * * * * echo 3 > /proc/sys/vm/drop_caches\n0 0 * * * /netsim_users/pms/bin/limitbw -n -c >>/netsim_users/pms/logs/limitbw.log 2>&1\n20 0 * * * /netsim_users/pms/bin/limitbw -n -g >> /netsim_users/pms/logs/limitbw.log 2>&1\n@reboot /netsim_users/pms/bin/limitbw -n -c >> /netsim_users/pms/logs/limitbw.log 2>&1\n00 */2 * * * /netsim_users/pms/bin/timesync";
                acutal_root=actual.split("\n");
                for i in cronfiles_root_test:
                        #print("i is",i);

                        if(i.startswith("#") or (i in actual_root)):
                                continue;
                        else:
                                flag_root=1;
                                print("extra script found in root crontab "+i);

                if(flag_root==0):
                        print("No issue in root crontab setting");
                        print("###################################################################################");

        except:
                print("issue in fetching root crontab values");

	try:
		print("###################################################################################");
		print("--------------------------------"+"Bandwidth"+"-----------------------------------------");
		print("Description: Displays the information of node bandwidth on NETSim VM");
		print("----------------------------------------------------------------------------------------");
#		print("###################################################################################");
		#print("Bandwidth of the nodes present on the server");
		vm=paramiko.SSHClient()
		vm.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        	vm.connect(hostname=netsimHost,username='root',password='shroot')
		cmd="/netsim_users/pms/bin/limitbw -n -c"
		#print("cmd is ",cmd);
		stdin,stdout,stderr = vm.exec_command(cmd);
		#print("error is "+stderr.read());
		output_bw=stdout.read();
#		print("output is "+output_bw);
		dump_bw=output_bw.split("\n");
		
#		print(dump_bw);
	        if(len(dump_bw)==2 and dump_bw[0]==" Reading IP addresses" and dump_bw[1]==''):
			print("No bandwidth set on the server");
                else:
        		for i in dump_bw:
	        	    print(i);
	        	print("###################################################################################");
		#print("type is ",type(output_bw));
		
	except:
		print("Problem with fetching bandwidth");
	try:
                print("----------------------"+"Check for Kernal page/resource allocation issue"+"-------------");
                print("Description: Checks for any infra issue on the server");
		print("----------------------------------------------------------------------------------------");
                cmd_kernel="/var/log/messages|grep -i DWARF2 unwinder";
                stdin,stdout,stderr=vm.exec_command(cmd_kernel);
                kernel_output=stdout.read();
		if(kernel_output==''):
			print("No Kernal page/resource allocation issue present on the server");
		else:
			print("This is an issue from Infra perspective, which had been handled by changing the scheduling priority of resources on the VMs.");
                	print("###################################################################################");

        except:
                print("Problem with fetching the details.Please check whether server connection is established properly");
                print("###################################################################################")

