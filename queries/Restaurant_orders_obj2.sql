# obj-2
# View the order_details table. What is the date range of the table?
SELECT * FROM order_details;

SELECT MIN(order_date) AS earliest_order, MAX(order_date) AS latest_order
FROM restaurant_db.order_details;

#How many orders were made within this date range? 
SELECT COUNT(distinct order_id) 
FROM restaurant_db.order_details;


# How many items were ordered within this date range?
SELECT COUNT(*) 
FROM restaurant_db.order_details;


#Which orders had the most number of items?
select distinct order_id,count(item_id) as no_item from order_details
group by order_id
order by no_item desc;
#How many orders had more than 12 items?
SELECT 
    COUNT(*)
FROM
    (SELECT DISTINCT
        order_id, COUNT(item_id) AS no_item
    FROM
        order_details
    GROUP BY order_id
    HAVING  no_item > 12) AS Num_orders;