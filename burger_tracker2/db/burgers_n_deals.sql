DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE days;
DROP TABLE eateries;
DROP TABLE types_of_burgers;

CREATE TABLE eateries
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE days
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);


CREATE TABLE burgers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  eatery_id INT8 references eateries(id)
);

CREATE TABLE type_of_burgers
(
  id SERIAL8 primary key,
  burger_id INT8 references burgers(id),
  filling_id INT8 references fillings(id)
);

CREATE TABLE deals
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  burger_id INT8 unique references burgers(id),
  day_id INT8 references days(id)
  );
