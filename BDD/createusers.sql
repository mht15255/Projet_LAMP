
CREATE USER 'prestataire'@'%' IDENTIFIED BY 'prestataire';
CREATE USER 'concess'@'localhost' IDENTIFIED BY 'concess';
CREATE USER 'prestataire'@'localhost' IDENTIFIED BY 'prestataire';
CREATE USER 'concess'@'%' IDENTIFIED BY 'concess';
GRANT select ON libautodb.* TO 'concess'@'localhost';
GRANT select ON libautodb.* TO 'prestataire'@'localhost';
GRANT select ON libautodb.* TO 'concess'@'%';
GRANT select ON libautodb.* TO 'prestataire'@'%';
