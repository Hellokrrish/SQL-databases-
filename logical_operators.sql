# 1.Get all the details of products that belong to "Clothing" category and price less than 700.

SELECT
  *
FROM
  product
WHERE
  category LIKE "clothing"
  AND price < 700;

# 2.Get all the details of products that belong to "Denim" brand with rating greater than 4.

SELECT
  *
FROM
  product
WHERE
  brand LIKE "Denim"
  AND rating > 4;


# 3.Get all the best-rated products with price less than or equal to 1000.
 Note: Assume that the products with rating greater than 4.0 as best rated products.


SELECT
  *
FROM
  product
WHERE
  rating > 4.0
  AND price <= 1000;


# 4.Get all the products that satisfy all the given conditions

rating is above 3.6 and
price is less than 1000 and
belongs to "Puma" brand


SELECT
  *
FROM
  product
WHERE
  rating > 3.6
  AND price < 1000
  AND brand LIKE "Puma";


# 5.Get all the products that belong to any of the following brands.

Puma
Denim
Nike

SELECT
  *
FROM
  product
WHERE
  brand LIKE "Puma"
  OR brand LIKE "Denim"
  OR brand LIKE "Nike";


# 6. Get all the details of products that follow any of the below conditions

brand is "Redmi" with a rating greater than 4
products that belong to the "OnePlus" brand.

SELECT
  *
FROM
  product
WHERE
  brand LIKE "Redmi"
  AND rating > 4
  OR brand LIKE "OnePlus";


# 7.Get the cakes from any of the following brands with a rating greater than 4.0.

 Cadbury
 Britannia
 Note: Consider the products that have "Cake" in name as cakes.

SELECT
  *
FROM
  product
WHERE
  (
    brand LIKE "Cadbury"
    OR brand LIKE "Britannia"
  )
  AND rating > 4.0
  AND name LIKE "%Cake%";


# 8.Get all the details of the products from the product table which follows any of the following conditions

brand is "Puma" and rating greater than 3.5
brand is "Denim" and rating greater than 4.0 

SELECT
  *
FROM
  product
WHERE
  brand = "Puma"
  AND rating > 3.5
  OR brand = "Denim"
  AND rating > 4.0;


# 9.Get all the shirts available in any of the following brands, excluding the black color shirts.
 Puma
 Nike
 Levi's

# Note: 
You can assume that:
1. Products containing “Shirt” in the name are considered as shirts.
 2. Black color shirts contain "Black" in their names.'''

SELECT
  *
FROM
  product
WHERE
  (
    brand = "Puma"
    OR brand = "Nike"
    OR brand = "Levi's"
  )
  AND (
    name LIKE "%Shirt%"
    AND NOT name LIKE "%Black%"
  );