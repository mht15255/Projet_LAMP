
CREATE USER 'prestataire'@'%' IDENTIFIED BY 'prestataire';
CREATE USER 'con'@'localhost' IDENTIFIED BY 'con';
GRANT select ON libautodb.* TO 'con'@'localhost';
GRANT select ON libautodb.* TO 'prestataire'@'localhost';
GRANT select ON libautodb.* TO 'con'@'%';
GRANT select ON libautodb.* TO 'prestataire'@'%';
