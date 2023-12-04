# create random password
PASSWDDB="$(openssl rand -base64 12)"
# replace "-" with "_" for database username
MAINDB=${USER_NAME//[^a-zA-Z0-9]/_}
# create database and user
mysql -e "CREATE DATABASE $MAINDB"
mysql -e "GRANT ALL PRIVILEGES ON $MAINDB.* TO $MAINDB@localhost IDENTIFIED BY '$PASSWDDB!'"

