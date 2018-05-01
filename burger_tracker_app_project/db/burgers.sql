DROP TABLE burgers;
DROP TABLE deals;
DROP TABLE eateries;
DROP TABLE eatery_burgers;
DROP TABLE burger_in_deals;

CREATE TABLE burgers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  eatery_id INT8 references eateries(id)
);

CREATE TABLE deals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  day VARCHAR(255) not null,
  eatery_id INT8 references eateries(id)
);

CREATE TABLE eateries
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE eatery_burgers
(
  id SERIAL8 primary key,
  burger_id INT8 references burgers(id),
  eatery_id INT8 references eateries(id)
);

CREATE TABLE burger_in_deals
(
  id SERIAL8 primary key,
  burger_id INT8 references burgers(id),
  deal_id INT8 references deals(id)
)
