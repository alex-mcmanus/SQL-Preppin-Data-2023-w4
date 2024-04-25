with newtable as (
select *
from pd2023_wk04_january

    pivot(min(value) for demographic
    in ('Ethnicity', 'Account Type','Date of Birth')) as p
        (id, joining_day, ethnicity, AT, DOB))

    select * 
from newtable;

with allmonths as(
SELECT *, 'pd2023_wk04_january' AS Month
FROM pd2023_wk04_january
UNION ALL
SELECT *, 'pd2023_wk05_february' AS Month
FROM pd2023_wk04_february
UNION ALL
SELECT *, 'pd2023_wk06_march' AS Month
FROM pd2023_wk04_march
UNION ALL
SELECT *, 'pd2023_wk07_april' AS Month
FROM pd2023_wk04_april
UNION ALL
SELECT *, 'pd2023_wk08_may' AS Month
FROM pd2023_wk04_may
UNION ALL
SELECT *, 'pd2023_wk09_june' AS Month
FROM pd2023_wk04_june
UNION ALL
SELECT *, 'pd2023_wk10_july' AS Month
FROM pd2023_wk04_july
UNION ALL
SELECT *, 'pd2023_wk11_august' AS Month
FROM pd2023_wk04_august
UNION ALL
SELECT *, 'pd2023_wk12_september' AS Month
FROM pd2023_wk04_september
UNION ALL
SELECT *, 'pd2023_wk13_october' AS Month
FROM pd2023_wk04_october
UNION ALL
SELECT *, 'pd2023_wk14_november' AS Month
FROM pd2023_wk04_november
UNION ALL
SELECT *, 'pd2023_wk15_december' AS Month
FROM pd2023_wk04_december)

, unpivoted_table as(
select ID
    , demographic
    , value
    , to_date(joining_day || '-' || split_part(month, '_', 3) || '-' ||'2023', 'dd-mmmm-yyyy') as Joining_Date
    
from allmonths)

select *
from unpivoted_table
pivot(min(value) for demographic
    in ('Ethnicity', 'Account Type','Date of Birth')) as p
        (id, ethnicity, AT, DOB, joining_date);


