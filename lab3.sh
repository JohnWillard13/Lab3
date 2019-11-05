#!/bin/bash

clear
while true; do
	clear
	echo Hello, $USER
	echo Today is $(date '+%d/%m/%Y %H:%M:%S')
	echo ====================
	echo      Main Menu
	echo ====================
	echo 1. OS Info
	echo 2. Network
	echo 3. User Info
	echo 4. File Ops
	echo 5. Find Files
	echo 6. Exit

	read -p "Enter your choice: " CHOICE
	clear
	case $CHOICE in
		1)
			echo a. Type of OS
			echo b. Free and Used Memory
			echo c. Disk Usage
			echo d. Uptime
			read -p "Choice: " osCHOICE
			clear		
			if [ "$osCHOICE" == "a" ]
			then	
				uname -a;
				read -p "Press ENTER to continue..."
				
			elif [ "$osCHOICE" == "b" ]
			then
				free;
				read -p "Press ENTER to continue..."

			elif [ "$osCHOICE" == "c" ]
			then
				df;
				read -p "Press ENTER to continue..."

			elif [ "$osCHOICE" == "d" ]
			then
				uptime;
				read -p "Press ENTER to continue..."
			else
				echo Invalid option.
				read -p "Press ENTER to continue..."	
	
			fi	
		;;
		
		2)
			ifconfig;
			read -p "Press ENTER to continue..."
		;;
		
		3)
			echo a. List accounts logged in
			echo b. List last logged in accounts
			read -p "Choice: " uCHOICE
			clear
			if [ "$uCHOICE" == "a" ]
			then
				who;
				read -p "Press ENTER to continue..."
			elif [ "$uCHOICE" == "b" ]
			then
				last;
				read -p "Press ENTER to continue..."
			else
				echo Invalid option.
				read -p "Press ENTER to continue..."
			fi
			
		;;

		4)	
			echo a. Create a File
			echo b. Delete a File
			echo c. Create a Directory
			echo d. Delete a Directory
			echo e. Compress a File
			echo f. Decompress a File
			read -p "Choice: " fCHOICE
			clear
			if [ "$fCHOICE" == "a" ]
			then
				read -p "Name of file to be created: " nFILE
				clear
				touch "$nFILE"
				echo File created at:;
				readlink -f "$nFILE";
				read -p "Press ENTER to continue..."
			
			elif [ "$fCHOICE" == "b" ]
			then
				read -p "Name of file to be removed: " dFILE
				clear
				if [ -f $dFILE ]
				then
					echo File being removed from:;
					readlink -f "$dFILE";
					rm "$dFILE";
					read -p "Press ENTER to continue..."
				else
					echo File not found.
					read -p "Press ENTER to continue..."
				fi

			elif [ "$fCHOICE" == "c" ]
			then
				read -p "Name of directory to be created: " nDIR
				clear
				mkdir "$nDIR";
				echo Directory created at:;
				readlink -f "$nDIR";
				read -p "Press ENTER to continue..."
			
			elif [ "$fCHOICE" == "d" ]
			then
				read -p "Name of directory to be removed: " rDIR
				clear
				if [ -d $rDIR ]
				then
					echo Directory being removed from:;
					readlink -f "$rDIR";
					rm -rf "$rDIR";
					read -p "Press ENTER to continue..."
				else
					echo Directory not found.
					read -p "Press ENTER to continue..."
				fi		
	
			elif [ "$fCHOICE" == "e" ]
			then
				read -p "Name the compressed file: " cNAME
				read -p "Name of file or path to file: " cNP
				clear
				tar -czvf $cNAME.tar.gz $cNP;
				echo File compressed.
				read -p "Press ENTER to continue..."

			elif [ "$fCHOICE" == "f" ]
			then
				read -p "Name of compressed file to extract: " eNAME
				clear
				tar -xzvf $eNAME.tar.gz;
				echo File extracted.
				read -p "Press ENTER to continue..."
			else
				clear
				echo Invalid option.
				read -p "Press ENTER to continue..."
			fi
		;;

		5)
			echo a. Find files modified in last X days
			echo b. Final files with certain extension
			read -p "Option: " lNAME
			clear

			if [ "$lNAME" == "a" ]
			then
				read -p "How many days do you want to go back: " DAYS
				clear
				find . -mtime -$DAYS;
				read -p "Press ENTER to continue..."
			
			elif [ "$lNAME" == "b" ]
			then
				read -p "Enter the extension (without the period): " EXT
				clear
				find . -type f -name "*.$EXT"
				read -p "Press ENTER to continue..."
			else
				clear
				echo Invalid option.
				read -p "Press ENTER to continue..."
			fi
				
		;;

		6)	
			read -p "Are you sure you wish to exit? y/n: " SURE
			if [ "$SURE" == "y" ]
			then
				clear
				exit 1
			
			elif [ "$SURE" == "n" ]
			then
				clear
				read -p "Press ENTER to return the the menu..."
			
			else
				clear
				echo Invalid option.
				read -p "Press ENTER to continue..."
			fi
		;;
esac
done
