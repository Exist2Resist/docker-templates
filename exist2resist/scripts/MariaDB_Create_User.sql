SET @user = 'admin';
SET @secret = 'somesecret';
SET @database = 'nextcloud'
CREATE USER @user IDENTIFIED BY @secret;
GRANT USAGE ON *.* TO @database@'%' IDENTIFIED BY @secret;
GRANT ALL PRIVILEGES ON @database.* TO @user@'%' identified BY @secret;
