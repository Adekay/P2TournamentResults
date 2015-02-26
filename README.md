This is Project 2 - Tournament Results
Version : 1.0.0
Author : Timothee Hack
==================================================================


PREREQUISITES :
---------------------

This program requires the installation of a preconfigured Virtual Machine provided by Udacity.
To make sure you have everything set up correctly, please follow the steps outlined in this link :
https://www.udacity.com/wiki/ud197/install-vagrant



INSTALLATION :
---------------------

1) Install the contents of this project into the "tournament" folder linked to your vagrant installation. This will automatically copy the contents into the VM.
2) Log into Vagrant using a command shell and the command "Vagrant ssh"
3) Go into the "tournament" folder using "cd tournament"
4) Log into the database using the command "psql tournament"
5) Within the psql shell, use the following command to create the database tables "\i tournament.sql"
6) Exit the psql shell using the command "\q"


RUNNING THE PROGRAM : 
---------------------

To run the program, follow the following steps :
1) Log into Vagrant using a command shell and the command "Vagrant ssh"
2) Go into the "tournament" folder using "cd tournament"
3) Run the project's unit tests using the command "python tournament_test.py"

The unit test script will run and output that all the tests were completed successfully
