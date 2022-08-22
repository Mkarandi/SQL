DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;


CREATE TABLE card_holder (
  cardholder_id INT PRIMARY KEY NOT NULL,
  card_holder_name VARCHAR(255)
  
);

CREATE TABLE credit_card (
  card VARCHAR(25) PRIMARY KEY NOT NULL,
  cardholder_id INT,
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(cardholder_id)
  
);


CREATE TABLE merchant_category (
    id_merchant_category INT PRIMARY KEY NOT NULL,
    id_merchant_name VARCHAR(25)
    
);
CREATE TABLE merchant (
  merchant_id INT PRIMARY KEY NOT NULL,
  merchant_name VARCHAR(255),
  id_merchant_category INT,
  FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id_merchant_category)
  
);



CREATE TABLE transaction (
  transaction_id VARCHAR(25) PRIMARY KEY NOT NULL,
  date TIMESTAMP NOT NULL,
  amount FLOAT NOT NULL,
  card VARCHAR(25),
  FOREIGN KEY (card) REFERENCES credit_card(card),
  merchant_id INT,
  FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
  
);

