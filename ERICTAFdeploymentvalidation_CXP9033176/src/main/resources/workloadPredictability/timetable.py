#!/usr/bin/python
#from sixty_network import sixty_k_network
from fifteen_network import fifteen_k_network
from forty_network import forty_k_network
profileDataFifteen, profileDataForty={},{}
for item in fifteen_k_network["fifteen_k_network"]:
    if fifteen_k_network["fifteen_k_network"][item] != {}:
        for profile in fifteen_k_network["fifteen_k_network"][item]:
            data=""
            if "TOTAL_NODES" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                data+="\n\tTOTAL_NODES: "+str(fifteen_k_network['fifteen_k_network'][item][profile]['TOTAL_NODES'])+"\n"
                try:
                    data+="\tSUPPORTED_NODE_TYPES: "+str(fifteen_k_network['fifteen_k_network'][item][profile]['SUPPORTED_NODE_TYPES'])+"\n"
                except:
                        pass
                if "SCHEDULED_DAYS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_DAYS"]+"\n"
                if "SCHEDULED_TIMES_STRINGS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            if "NUM_NODES" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                data+="\n\tNUM_NODES: "+str(fifteen_k_network["fifteen_k_network"][item][profile]["NUM_NODES"])+"\n"
                if "SCHEDULED_DAYS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_DAYS"])+"\n"
                if "SCHEDULED_TIMES_STRINGS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            else:
                data+="\n\tNUM_NODES=NA"+"\n"
                if "SCHEDULED_DAYS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_DAYS"]+"\n"
                if "SCHEDULED_TIMES_STRINGS" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in fifteen_k_network["fifteen_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(fifteen_k_network["fifteen_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            profileDataFifteen[profile]=data
for item in forty_k_network["forty_k_network"]:
    if forty_k_network["forty_k_network"][item] != {}:
        for profile in forty_k_network["forty_k_network"][item]:
            data=""
            if "TOTAL_NODES" in forty_k_network["forty_k_network"][item][profile].keys():
                data+="\n\tTOTAL_NODES: "+str(forty_k_network['forty_k_network'][item][profile]['TOTAL_NODES'])+"\n"
		try:
                    data+="\tSUPPORTED_NODE_TYPES: "+str(forty_k_network['forty_k_network'][item][profile]['SUPPORTED_NODE_TYPES'])+"\n"
		except:
			pass
                if "SCHEDULED_DAYS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_DAYS"])+"\n"
                if "SCHEDULED_TIMES_STRINGS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            if "NUM_NODES" in forty_k_network["forty_k_network"][item][profile].keys():
                data+="\n\tNUM_NODES: "+str(forty_k_network["forty_k_network"][item][profile]["NUM_NODES"])+"\n"
                if "SCHEDULED_DAYS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_DAYS"])+"\n"
                if "SCHEDULED_TIMES_STRINGS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            else:
                data+="\n\tNUM_NODES=NA"+"\n"
                if "SCHEDULED_DAYS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_DAYS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_DAYS"])+"\n"
                if "SCHEDULED_TIMES_STRINGS" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULED_TIMES_STRINGS "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULED_TIMES_STRINGS"])+"\n"
                if "SCHEDULE_SLEEP" in forty_k_network["forty_k_network"][item][profile].keys():
                    data+="\tSCHEDULE_SLEEP "+str(forty_k_network["forty_k_network"][item][profile]["SCHEDULE_SLEEP"])+"\n"
            profileDataForty[profile]=data
for item in profileDataFifteen.keys():
	profileDataForty[item]=profileDataFifteen[item]
for item in profileDataForty:
	print item," ",profileDataForty[item]
