CREATE TABLE "Airbnb listings1"
(
    list_id INT PRIMARY KEY,
    host_id INT,
    host_name VARCHAR(50) not null,
    neighbourhood_group VARCHAR(50),
    neighbourhood VARCHAR(50),
    room_type VARCHAR(50),
    price FLOAT,
    minimum_nights INT,
    number_Of_reviews INT,
    last_review DATE,
    reviews_per_month FLOAT,
    calculated_host_listings_count INT,
    availability_365 INT
);
select*from "Airbnb listings1"

INSERT INTO "Airbnb listings1"
(list_id, host_id, host_name, neighbourhood_group, neighbourhood, room_type, price, minimum_nights, number_of_reviews, last_review, reviews_per_month, calculated_host_listings_count, availability_365)
VALUES
(13894339, 5143901, 'Erin', 'Brooklyn', 'Greenpoint', 'Entire home/apt', 10000, 5, 5, '7/27/2017', 0.2, 1, 0),
(9528920, 3906464, 'Amy', 'Manhattan', 'Lower East Side', 'Private room', 9999, 99, 6, '1/1/2016', 0.1, 1, 83),
(23377410, 18128455, 'Rum', 'Manhattan', 'Tribeca', 'Entire home/apt', 8500, 30, 2, '9/18/2018', 0.2, 1, 251),
(34895693, 262534951, 'Sandra', 'Brooklyn', 'East Flatbush', 'Private room', 7500, 1, 8, '7/7/2019', 6.2, 2, 179),
(2110145, 2151325, 'Jay & Liz', 'Manhattan', 'Upper West Side', 'Entire home/apt', 6000, 14, 17, '2/17/2015', 0.3, 1, 359),
(33397385, 16105313, 'Debra', 'Manhattan', 'Midtown', 'Entire home/apt', 5100, 30, 1, '6/22/2019', 1.0, 2, 343),
(2919330, 14908606, 'Bianca', 'Brooklyn', 'Bedford Stuyvesant', 'Private room', 5000, 6, 10, '1/2/2016', 0.2, 1, 363),
(20654227, 100069033, 'Sarah2', 'Brooklyn', 'Cypress Hills', 'Entire home/apt', 5000, 2, 4, '1/3/2018', 0.2, 1, 0),
(21238053, 153497815, 'SarahB', 'Brooklyn', 'Bedford Stuyvesant', 'Entire home/apt', 5000, 2, 8, '12/9/2017', 0.4, 1, 0),
(30035166, 172611460, 'Rasmus', 'Manhattan', 'Harlem', 'Entire home/apt', 5000, 1, 2, '2/23/2019', 0.4, 2, 150);

#average price range offered by Airbnb listings

SELECT AVG(Price) as AveragePrice
FROM "Airbnb listings1";

#analyze reviews scored by guests who have used an Airbnb

SELECT 'number_of_reviews', AVG(reviews_per_month) as AverageReviewsPerMonth
FROM "Airbnb listings1";

#booking based on their popularity

SELECT AVG(availability_365) as AverageAvailability365
FROM "Airbnb listings1";

#investigate listing host data

SELECT host_name, COUNT(List_id) as HostListingsCount
FROM "Airbnb listings1"
GROUP BY host_name;

#correlation between listing prices and other factors

SELECT Price, number_of_reviews, availability_365
FROM "Airbnb listings1";

#top-performing hosts in terms of booking count 

SELECT host_name, COUNT(List_id) as HostListingsCount, SUM(number_of_reviews) as TotalReviews
FROM "Airbnb listings1"
GROUP BY host_name;

#trends in listing prices over time, considering factors such as the location or the property type.

SELECT last_review, room_type, AVG(Price) as AveragePrice
FROM "Airbnb listings1"
GROUP BY last_review, room_type;

#number of nights booked or the availability of the listing

SELECT Price, minimum_nights, availability_365
FROM "Airbnb listings1";