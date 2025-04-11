# 1.Get all the products from "Roadster", "Levi's" or "Puma" brands.
Note:  Output must contain rows in the ascending order of price of the product. If two products are of same price, then sort by name in the alphabetical order.


SELECT
  *
FROM
  product
WHERE
  brand IN ("Roadster", "Levi's", "Puma")
ORDER BY
  price ASC,
  name ASC;

# 2.Get all the products that are in the price range of 750 to 1000.

Note: Include the products with price 750 and 1000 as well.
Output must contain rows in the ascending order ofpriceof the product. If two products are of same price, then sort bynamein the alphabetical order.



SELECT
  *
FROM
  product
WHERE
  price BETWEEN 750
  AND 1000
ORDER BY
  price ASC,
  name ASC;



# 3.User wants to purchase clothes that have high-rating and low-cost.
Get the products from the "Clothing" category as per the user requirements, i.e.,
NOTE:
Keep highly-rated products at the top
Sort the price from low to high


SELECT
  *
FROM
  product
WHERE
  category LIKE "Clothing"
ORDER BY
  rating DESC,
  price ASC;



# 4.List all the distinct brands available.
Note: Output must contain rows in the alphabetical order of name of the brand.


SELECT
  DISTINCT brand
FROM
  product
ORDER BY
  brand ASC;



# 5. User has checked first 10 products keeping highly-rated products at the top. Help the user check the details of next 10 products.
Note: If two products have the same rating, then sort bynamein the alphabetical order.



SELECT
  *
FROM
  product
ORDER BY
  rating DESC,
  name ASC
LIMIT
  10 OFFSET 10;




# 6.Get all the details of the products from producttable whose

brand is Puma or Denim and
rating greater than 4
Get products with lowest price first



SELECT
  *
FROM
  product
WHERE
  brand IN ("Puma", "Denim")
  AND rating > 4
ORDER BY
  price ASC;