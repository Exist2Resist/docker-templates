CREATE USER admin IDENTIFIED BY 'somesecret';
GRANT USAGE ON *.* TO nextcloud@'%' IDENTIFIED BY 'somesecret';
GRANT ALL PRIVILEGES ON nextcloud.* TO admin19@'%' identified BY 'somesecret';
