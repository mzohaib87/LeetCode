/* Write your T-SQL query statement below */

With capital_buy as
(
    Select stock_name,sum(price) as buy_price
    from Stocks
    where operation='Buy'
    group by stock_name
),
capital_sell as
(
    Select stock_name,sum(price) as sell_price
    from Stocks
    where operation='Sell'
    group by stock_name
)

Select c1.stock_name as stock_name, c2.sell_price-c1.buy_price as capital_gain_loss
from (Select * from capital_buy) c1 join (Select * from capital_sell) c2
on c1.stock_name=c2.stock_name;

