rm juniperpmcounter.sh

while read -r line
do
	if [[ $line == "EOF" ]]
	then
	while read -r line
		do
    		echo $line >> juniperpmcounter.sh

		done < script1.sh
	echo "EOF" >> juniperpmcounter.sh

	fi

	echo $line >> juniperpmcounter.sh

done < ciscopmcounter.sh
