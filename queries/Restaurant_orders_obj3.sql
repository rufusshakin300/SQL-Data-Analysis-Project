

# obj-3
# Combine the menu_items and order_details tables into a single table
Select * from order_details
Left join menu_items on menu_items.menu_item_id = order_details.item_id;
# What were the least and most ordered items? What categories were they in?
-- most ordered items
Select item_name, count(order_details_id) num_purchased, category
from order_details
Left join menu_items on menu_items.menu_item_id = order_details.item_id 
group by item_name,category
order by num_purchased desc;

-- least ordered items
Select item_name, count(order_details_id) num_purchased,category
from order_details
Left join menu_items on menu_items.menu_item_id = order_details.item_id 
group by item_name,category
order by num_purchased asc;

# What were the top 5 orders that spent the most money?
Select  od.order_id,sum(mi.price) total_cost from order_details od
left join menu_items mi on od.item_id = mi.menu_item_id
group by od.order_id
order by total_cost desc limit 5;
# View the details of the highest spend order. Which specific items were purchased?
Select *
from order_details od
left join menu_items mi on od.item_id = mi.menu_item_id
where order_id=440;
Select count(*)
from order_details od
left join menu_items mi on od.item_id = mi.menu_item_id
where order_id=440;

Select category, count(item_id) num_items
from order_details od
left join menu_items mi on od.item_id = mi.menu_item_id
where od.order_id=440
group by category;
#BONUS: View the details of the top 5 highest spend orders
SELECT 
order_id ,category,
COUNT(od.item_id) num_items
FROM
    order_details od
        LEFT JOIN
    menu_items mi ON od.item_id = mi.menu_item_id
WHERE
    od.order_id IN (440 , 2075, 1957, 330, 2675)
GROUP BY category,order_id;
SELECT 
category,
COUNT(od.item_id) num_items
FROM
    order_details od
        LEFT JOIN
    menu_items mi ON od.item_id = mi.menu_item_id
WHERE
    od.order_id IN (440 , 2075, 1957, 330, 2675)
GROUP BY category;
/*
440	192.15
2075	191.05
1957	190.10
330	189.70
2675	185.10 
*/
