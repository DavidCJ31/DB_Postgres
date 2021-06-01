\c :v2
COPY registrosnuevos(region ,country ,item_type ,sales_channel ,order_priority , order_date , order_id , ship_date , units_sold , unit_price , unit_cost , total_revenue, total_cost, total_profit)
FROM :v1
DELIMITER ','
CSV HEADER;

\pset tuples_only on
select pg_sleep(5);
\pset tuples_only off
\q