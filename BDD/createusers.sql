
CREATE USER 'prestataire'@'%' IDENTIFIED BY 'prestataire';
CREATE USER 'concessionnaire'@'localhost' IDENTIFIED BY 'concess';
CREATE USER 'prestataire'@'localhost' IDENTIFIED BY 'prestataire';
CREATE USER 'concessionnaire'@'%' IDENTIFIED BY 'concess';
GRANT select ON libautodb.* TO 'concessionnaire'@'localhost';
GRANT select ON libautodb.* TO 'prestataire'@'localhost';
GRANT select ON libautodb.* TO 'concessionnaire'@'%';
GRANT select ON libautodb.* TO 'prestataire'@'%';
