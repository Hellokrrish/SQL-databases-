CREATE VIEW user_details AS
SELECT
  id,
  name,
  age,
  gender,
  pincode
FROM
  user;




CREATE VIEW user_order_details AS
SELECT
  user.id AS user_id,
  user.name,
  user.age,
  user.gender,
  user.pincode,
  order_details.order_id,
  order_details.total_amount
FROM
  user
  INNER JOIN order_details ON order_details.customer_id = user.id;






SELECT
  user_id,
  pincode,
  SUM(total_amount) AS total_amount_spent
FROM
  location_order_details
GROUP BY
  user_id
HAVING
  total_amount_spent > 50000;





SELECT
  name,
  (
    SELECT
      AVG(rating)
    FROM
      product
  ) - rating AS rating_variance
FROM
  product;





SELECT
  name,
  (
    SELECT
      AVG(rating)
    FROM
      product
    WHERE
      category = "MOBILE"
  ) - rating AS rating_variance
FROM
  product
WHERE
  category = "MOBILE";




SELECT
  name,
  rating
FROM
  product
WHERE
  category = "WATCH"
  AND rating >(
    SELECT
      AVG(rating)
    FROM
      product
    WHERE
      category = "WATCH"
  );





SELECT
  customer_id,
  AVG(total_amount) AS avg_amount_spent
FROM
  order_details
GROUP BY
  customer_id
HAVING
  AVG(total_amount) > (
    SELECT
      AVG(total_amount)
    FROM
      order_details
  );




SELECT
  order_id
FROM
  order_details
WHERE
  order_id IN (
    SELECT
      order_id
    FROM
      order_product
    WHERE
      product_id IN (291, 292, 293, 294, 296)
  )
  AND order_id NOT IN (
    SELECT
      DISTINCT op.order_id
    FROM
      order_product op
      JOIN product p ON op.product_id = p.product_id
    WHERE
      p.name LIKE '%Screen Guard%'
  );



  


