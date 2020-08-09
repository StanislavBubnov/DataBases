
USE fns;

SHOW TABLES;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS taxes;
DROP TABLE IF EXISTS income;
DROP TABLE IF EXISTS estate;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS flats;
DROP TABLE IF EXISTS other_estate;
DROP TABLE IF EXISTS areas;
DROP TABLE IF EXISTS messages;

CREATE TABLE users (
  id int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  taxpayer_number bigint(200) NOT NULL COMMENT 'ИНН',
  first_name varchar(100) NOT NULL COMMENT 'Имя пользователя',
  last_name varchar(100) NOT NULL COMMENT 'Фамилия пользователя',
  email varchar(100) NOT NULL COMMENT 'Почта',
  phone varchar(100) NOT NULL COMMENT 'Телефон',
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  UNIQUE KEY phone (phone),
  UNIQUE KEY taxpayer_number (taxpayer_number)
) COMMENT='Пользователи';

CREATE TABLE profiles (
  user_id int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  gender char(1) NOT NULL COMMENT 'Пол',
  birthday date DEFAULT NULL COMMENT 'Дата рождения',
  city varchar(130) DEFAULT NULL COMMENT 'Город проживания',
  country varchar(130) DEFAULT NULL COMMENT 'Страна проживания',
  address text NOT NULL COMMENT 'Адрес',
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (user_id)
) COMMENT='Профили';

CREATE TABLE taxes (
  user_id int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  total_taxes int (12) NOT NULL COMMENT 'Итого налог',
  PRIMARY KEY (user_id)
) COMMENT='Налоги';

CREATE TABLE income (
  id SERIAL PRIMARY KEY COMMENT 'Идентификатор строки',
  user_id int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  income int (100) NOT NULL COMMENT 'Доход',
  tax_income int (100) NOT NULL COMMENT 'Уплаченный налог на доход'
) COMMENT='Доход';

CREATE TABLE estate (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  user_id int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  car_id int unsigned NOT NULL  COMMENT 'Ссылка на авто',
  flats_id int unsigned NOT NULL  COMMENT 'Ссылка на квартиры',
  other_estate_id int unsigned NOT NULL  COMMENT 'Ссылка на нежилые помещения',
  areas_id int unsigned NOT NULL  COMMENT 'Ссылка на землю',
  PRIMARY KEY (id),
  KEY car_id (car_id),
  KEY areas (areas_id),
  KEY flats (flats_id),
  KEY other_estate (other_estate_id)
) COMMENT='Собственность налогоплательщиков';


CREATE TABLE cars (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID авто',
  model varchar(100) NOT NULL COMMENT 'Модель авто',
  car_power int (10) COMMENT 'Мощность авто', 
  date_of_issue datetime COMMENT 'Дата изготовления',
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (id)
);

CREATE TABLE flats (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID авто',
  address text NOT NULL COMMENT 'Адрес',
  area int (10) COMMENT 'Площадь', 
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (id)
) COMMENT='Квартира';

CREATE TABLE other_estate (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID нежилого помещения',
  address text NOT NULL COMMENT 'Адрес',
  area int (10) COMMENT 'Площадь', 
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (id)
) COMMENT='Нежилое помещение';

CREATE TABLE areas (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID земли',
  address text NOT NULL COMMENT 'Адрес',
  area int (10) COMMENT 'Площадь', 
  created_at datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  PRIMARY KEY (id)
) COMMENT='Земля';

CREATE TABLE messages (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  from_user_id int(10) unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) COMMENT='Сообщения';


ALTER TABLE profiles ADD CONSTRAINT profiles_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE income ADD CONSTRAINT income_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE taxes ADD CONSTRAINT taxes_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT messages_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE estate ADD CONSTRAINT estate_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE estate ADD CONSTRAINT cars_id_estate_fk FOREIGN KEY (car_id) REFERENCES cars(id);
ALTER TABLE estate ADD CONSTRAINT flats_id_estate_fk FOREIGN KEY (flats_id) REFERENCES flats(id);
ALTER TABLE estate ADD CONSTRAINT areas_id_estate_fk FOREIGN KEY (areas_id) REFERENCES areas(id);
ALTER TABLE estate ADD CONSTRAINT other_estate_id_estate_fk FOREIGN KEY (other_estate_id) REFERENCES other_estate(id);

ALTER TABLE users ADD INDEX users_first_name_idx(first_name);
ALTER TABLE users ADD INDEX users_last_name_idx(last_name);
ALTER TABLE users ADD INDEX users_email_idx(email);
ALTER TABLE users ADD INDEX users_phone_idx(phone);



