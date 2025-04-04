# lessthan or equal to:
SELECT
  *
FROM
  product
WHERE
  price <= 1000;


  # greatherthan:
SELECT
  *
FROM
  product
WHERE
  rating > 4.0;

# equalto or Like or contains:
SELECT
  *
FROM
  product
WHERE
  brand LIKE "Puma";

# equalto or Like or contains:
SELECT
  *
FROM
  product
WHERE
  name LIKE "%Jeans";  ----------> here "%.... " means starts with any character from one to more.


# equalto or Like or contains:
SELECT
  *
FROM
  product
WHERE
  name LIKE "Bourbon%";----------------->  here ".....% " means ends with any character from one to more.


# equalto or Like or contains:
SELECT
  *
FROM
  product
WHERE
  name LIKE "%Chips%";-------> here  "%.....% "  means start and end with any charcter but in between must have chips.



# equalto or Like or contains:
SELECT
  *
FROM
  product
WHERE
  name LIKE "%h_r_";------> here"_ _" means exactly one character after the h and r.



