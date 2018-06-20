DROP TABLE items;
DROP TABLE manufacturers;
DROP TABLE groups;


CREATE TABLE groups (
  id SERIAL8 primary key,
  name VARCHAR(255),
  email_address VARCHAR(255)
);

CREATE TABLE manufacturers (
  id SERIAL8 primary key,
  name VARCHAR(255),
  email_address VARCHAR(255)
);

CREATE TABLE items (
  id SERIAL8 primary key,
  name VARCHAR(255),
  price float,
  group_id INT8 REFERENCES groups(id),
  manufacturer_id INT8 REFERENCES manufacturers(id),
  sell_price float,
  quantity INT4
);
