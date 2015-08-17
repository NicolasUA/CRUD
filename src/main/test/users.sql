CREATE TABLE IF NOT EXISTS User (
  id int(8) UNSIGNED AUTO_INCREMENT,
  name varchar(25) DEFAULT NULL ,
  age INT DEFAULT 0,
  isAdmin BIT DEFAULT FALSE,
  createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT User (id, name, age, isAdmin, createdDate) VALUES (1, 'Nicolas', 18, TRUE , '2005-12-05 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (2, 'Vasya', 15, FALSE , '2005-12-07 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (3, 'Maxim', 25, TRUE, '2005-12-06 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (4, 'Masha', 26, FALSE , '2005-12-05 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (5, 'Petya', 25, FALSE , '2005-12-05 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (6, 'Gosha', 24, FALSE , '2005-12-07 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (7, 'Katya', 25, FALSE , '2005-12-08 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (8, 'Dima', 26, TRUE, '2005-12-03 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (9, 'Sasha', 26, FALSE , '2005-12-03 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (10, 'Lena', 25, FALSE , '2005-12-08 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (11, 'Dasha', 25, FALSE , '2005-12-09 00:00:00');
INSERT User (id, name, age, isAdmin, createdDate) VALUES (12, 'Rita', 24, TRUE, '2005-12-12 00:00:00');


COMMIT;