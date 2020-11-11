DROP TABLE IF EXISTS admin ;
CREATE TABLE admin(
	aid 		VARCHAR(32)		PRIMARY KEY,
	password 	VARCHAR(32)
);
INSERT INTO admin(aid,password) VALUES("admin","admin");

ALTER TABLE emp ADD photo VARCHAR(100) DEFAULT 'nophoto.jpg';
ALTER TABLE emp ADD note text;
ALTER TABLE emp DROP COLUMN photo;