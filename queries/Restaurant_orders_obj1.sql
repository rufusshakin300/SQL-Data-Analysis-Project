#obj-1
# View the menu_items table and write a query to find the number of items on the menu
select count(*)  from  menu_items;
#What are the least and most expensive items on the menu?
-- most expensive items 
Select * from menu_items
order by price desc
limit 5;
-- least expensive items
Select * from menu_items
order by price asc
limit 5;
# How many Italian dishes are on the menu?
 Select Count(category) as italian_dishes from menu_items
 where category ='Italian';
# What are the least and most expensive Italian dishes on the menu?
-- most expensive
Select * from menu_items
where category ='Italian'
order by price desc
limit 5;
-- least expensive
Select * from menu_items
where category ='Italian'
order by price asc
limit 5;
# How many dishes are in each category?
Select distinct category,count(item_name) from menu_items
group by category;
# What is the average dish price within each category
select distinct category,avg(price) from  menu_items
group by category;