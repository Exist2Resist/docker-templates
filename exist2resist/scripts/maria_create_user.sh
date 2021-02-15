CREATE USER admin IDENTIFIED BY 'somesecret';
GRANT USAGE ON *.* TO nextcloud@'%' IDENTIFIED BY 'somesecret';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nx_admin'@'%' identified BY 'somesecret';
