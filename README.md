# MongoBackup
Bash script to make backups of a Mongo DB. This can be automated via a Cronjob

Provide the host and port through which the connection needs to be established to the DB
The app_name can be any name
Time stamp states the frequency of the backups
The backup gets named with the app_name + timestamp
Out_path represents the location where the output will be created
During the backup process, the DB gets locked and just after the process completion it gets unlocked
Every backup gets created with the default name "dump" and it is moved to a seperate folder to include the name we require
This is converted to a tar file for ease of handling
