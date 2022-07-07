--Create customer table

CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    free_film_fan_member BOOLEAN,
    adult BOOLEAN,
    ticket_id INTEGER NOT NULL
);

--If wanted todelete customer table
--DROP TABLE customer

--Create movie table
CREATE TABLE IF NOT EXISTS movie (
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR(255) NOT NULL,
    adult BOOLEAN
);

--Create concession table
CREATE TABLE IF NOT EXISTS concession (
    concession_id SERIAL,
    concession_name VARCHAR(255) NOT NULL,
    concession_price FLOAT NOT NULL,
    stock_qty INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
); 



--Create ticket table
CREATE TABLE IF NOT EXISTS ticket (
    ticket_id SERIAL NOT NULL,
    purchase_date DATE DEFAULT CURRENT_DATE,
    price FLOAT NOT NULL,
    movie_title VARCHAR(255) NOT NULL,
    theater_number INTEGER,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES customer(customer_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);


