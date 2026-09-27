1.Display the names and phone numbers of all guests:

Query:select guest_name,phone from guests;
+---------------+------------+
| guest_name    | phone      |
+---------------+------------+
| Rahul Patil   | 9876543210 |
| Pooja Shinde  | 8765432109 |
| Amit Deshmukh | 7654321098 |
+---------------+------------+

2.Find all rooms of type 'Single'.

Query:select * from rooms where room_type='single';
+---------+-----------+--------------+-----------+
| room_id | room_type | price_per_nt | status    |
+---------+-----------+--------------+-----------+
|       1 | Single    |      1500.00 | Available |
+---------+-----------+--------------+-----------+

3.List rooms with a price greater than 2000.

Query: select * from rooms where price_per_nt>2000;
+---------+-----------+--------------+-----------+
| room_id | room_type | price_per_nt | status    |
+---------+-----------+--------------+-----------+
|       2 | Double    |      2500.00 | Available |
|       3 | Deluxe    |      4000.00 | Available |
+---------+-----------+--------------+-----------+

4.Show all rooms with an 'Available' status.

Query:select * from rooms where status='available';
+---------+-----------+--------------+-----------+
| room_id | room_type | price_per_nt | status    |
+---------+-----------+--------------+-----------+
|       1 | Single    |      1500.00 | Available |
|       2 | Double    |      2500.00 | Available |
|       3 | Deluxe    |      4000.00 | Available |
+---------+-----------+--------------+-----------+

5.Count the total number of guests in the database.

Query: select count(*) from guests;
+----------+
| count(*) |
+----------+
|        3 |
+----------+

6.Calculate the average price of all rooms (price_per_nt).

Query: select avg(price_per_nt) from rooms;
+-------------------+
| avg(price_per_nt) |
+-------------------+
|       2666.666667 |
+-------------------+

7.Find all rooms whose price is less than the total sum of all room prices using a subquery.

Query:
mysql> select * from rooms where price_per_nt<(select sum(price_per_nt) from rooms);
+---------+-----------+--------------+-----------+
| room_id | room_type | price_per_nt | status    |
+---------+-----------+--------------+-----------+
|       1 | Single    |      1500.00 | Available |
|       2 | Double    |      2500.00 | Available |
|       3 | Deluxe    |      4000.00 | Available |
+---------+-----------+--------------+-----------+

8.Find all rooms whose price is greater than the minimum price of all rooms using a subquery.

Query: select * from rooms where price_per_nt>(select min(price_per_nt) from rooms);
+---------+-----------+--------------+-----------+
| room_id | room_type | price_per_nt | status    |
+---------+-----------+--------------+-----------+
|       2 | Double    |      2500.00 | Available |
|       3 | Deluxe    |      4000.00 | Available |
+---------+-----------+--------------+-----------+

9.Display the booking ID, guest name, and room type for all bookings.

Query: select b.booking_id,g.guest_name,r.room_type from bookings b join guests g on b.guest_id=g.guest_id join rooms r on b.room_id=r.room_id;
+------------+--------------+-----------+
| booking_id | guest_name   | room_type |
+------------+--------------+-----------+
|          1 | Rahul Patil  | Double    |
|          2 | Pooja Shinde | Single    |
+------------+--------------+-----------+

10.Show all guest names and their check-in dates.

Query: select g.guest_name,b.check_in from guests g join bookings b on g.guest_id=b.guest_id;
+--------------+------------+
| guest_name   | check_in   |
+--------------+------------+
| Rahul Patil  | 2026-09-10 |
| Pooja Shinde | 2026-09-12 |
+--------------+------------+

11.Find all booking details for the guest named 'Rahul Patil'.

Query:select b.booking_id,g.guest_name,r.room_type,b.check_in,b.check_out from bookings b join guests g on b.guest_id=g.guest_id join rooms r on b.room_id=r.room_id where g.guest_name='rahul patil';
+------------+-------------+-----------+------------+------------+
| booking_id | guest_name  | room_type | check_in   | check_out  |
+------------+-------------+-----------+------------+------------+
|          1 | Rahul Patil | Double    | 2026-09-10 | 2026-09-13 |
+------------+-------------+-----------+------------+------------+

12.List the guest names and phone numbers for anyone who booked a 'Double' room.

Query: select g.guest_name,g.phone,r.room_type from bookings b join guests g on b.guest_id=g.guest_id join rooms r on b.room_id=r.room_id where r.room_type='Double';
+-------------+------------+-----------+
| guest_name  | phone      | room_type |
+-------------+------------+-----------+
| Rahul Patil | 9876543210 | Double    |
+-------------+------------+-----------+

13.Display bookings where the check-in date is '2026-09-10'.

Query:select b.booking_id, g.guest_name, r.room_type, b.check_in from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where b.check_in = '2026-09-10';
+------------+-------------+-----------+------------+
| booking_id | guest_name  | room_type | check_in   |
+------------+-------------+-----------+------------+
|          1 | Rahul Patil | Double    | 2026-09-10 |
+------------+-------------+-----------+------------+

14.Find bookings where guest names start with the letter 'R'

Query:select b.booking_id, g.guest_name, r.room_type, b.check_in from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where g.guest_name like 'R%';
+------------+-------------+-----------+------------+
| booking_id | guest_name  | room_type | check_in   |
+------------+-------------+-----------+------------+
|          1 | Rahul Patil | Double    | 2026-09-10 |
+------------+-------------+-----------+------------+

15. Count how many rooms exist for each room type using GROUP BY

Query:select room_type, count(*) as total_rooms from rooms group by room_type;
+-----------+-------------+
| room_type | total_rooms |
+-----------+-------------+
| Single    |           1 |
| Double    |           1 |
| Deluxe    |           1 |
+-----------+-------------+

16. Count how many bookings each guest has made

Query:select g.guest_name, count(b.booking_id) as total_bookings from guests g left join bookings b on g.guest_id = b.guest_id group by g.guest_id, g.guest_name;
+---------------+----------------+
| guest_name    | total_bookings |
+---------------+----------------+
| Rahul Patil   |              1 |
| Pooja Shinde  |              1 |
| Amit Deshmukh |              0 |
+---------------+----------------+

17. Find the total number of bookings received for each room type

Query:select r.room_type, count(b.booking_id) as booking_count from rooms r left join bookings b on r.room_id = b.room_id group by r.room_type;
+-----------+---------------+
| room_type | booking_count |
+-----------+---------------+
| Single    |             1 |
| Double    |             1 |
| Deluxe    |             0 |
+-----------+---------------+

18. List all guests, including those who have not booked any room yet using a LEFT JOIN

Query:select g.guest_name, g.phone, b.booking_id, r.room_type from guests g left join bookings b on g.guest_id = b.guest_id left join rooms r on b.room_id = r.room_id;
+---------------+------------+------------+-----------+
| guest_name    | phone      | booking_id | room_type |
+---------------+------------+------------+-----------+
| Rahul Patil   | 9876543210 |          1 | Double    |
| Pooja Shinde  | 8765432109 |          2 | Single    |
| Amit Deshmukh | 7654321098 |       NULL | NULL      |
+---------------+------------+------------+-----------+

19. Calculate the total stay duration (in days) for each booking using DATEDIFF

Query:select b.booking_id, g.guest_name, r.room_type, datediff(b.check_out, b.check_in) as stay_days from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id;
+------------+--------------+-----------+-----------+
| booking_id | guest_name   | room_type | stay_days |
+------------+--------------+-----------+-----------+
|          1 | Rahul Patil  | Double    |         3 |
|          2 | Pooja Shinde | Single    |         3 |
+------------+--------------+-----------+-----------+

20. Retrieve a complete summary of all reservations showing guest name, room type, price per night, and stay dates

Query:select g.guest_name, r.room_type, r.price_per_nt, b.check_in, b.check_out from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id;
+--------------+-----------+--------------+------------+------------+
| guest_name   | room_type | price_per_nt | check_in   | check_out  |
+--------------+-----------+--------------+------------+------------+
| Rahul Patil  | Double    |      2500.00 | 2026-09-10 | 2026-09-13 |
| Pooja Shinde | Single    |      1500.00 | 2026-09-12 | 2026-09-15 |
+--------------+-----------+--------------+------------+------------+

21. Inner join between bookings and guests to get guest names and booking dates

Query:select g.guest_name, b.check_in, b.check_out from bookings b join guests g on b.guest_id = g.guest_id;
+--------------+------------+------------+
| guest_name   | check_in   | check_out  |
+--------------+------------+------------+
| Rahul Patil  | 2026-09-10 | 2026-09-13 |
| Pooja Shinde | 2026-09-12 | 2026-09-15 |
+--------------+------------+------------+

22. Inner join between bookings and rooms to get room types and prices

Query:select b.booking_id, r.room_type, r.price_per_nt from bookings b join rooms r on b.room_id = r.room_id;
+------------+-----------+--------------+
| booking_id | room_type | price_per_nt |
+------------+-----------+--------------+
|          2 | Single    |      1500.00 |
|          1 | Double    |      2500.00 |
+------------+-----------+--------------+

23. Three-table join to show booking ID, guest name, and room type

Query:select b.booking_id, g.guest_name, r.room_type from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id;
+------------+--------------+-----------+
| booking_id | guest_name   | room_type |
+------------+--------------+-----------+
|          1 | Rahul Patil  | Double    |
|          2 | Pooja Shinde | Single    |
+------------+--------------+-----------+

24. Left join to show all guests and their bookings (including guests with no bookings)

Query:select g.guest_name, b.booking_id, b.check_in from guests g left join bookings b on g.guest_id = b.guest_id;
+---------------+------------+------------+
| guest_name    | booking_id | check_in   |
+---------------+------------+------------+
| Rahul Patil   |          1 | 2026-09-10 |
| Pooja Shinde  |          2 | 2026-09-12 |
| Amit Deshmukh |       NULL | NULL       |
+---------------+------------+------------+

25. Left join to show all rooms and their booking details

Query:select r.room_type, b.booking_id, b.check_out from rooms r left join bookings b on r.room_id = b.room_id;
+-----------+------------+------------+
| room_type | booking_id | check_out  |
+-----------+------------+------------+
| Single    |          2 | 2026-09-15 |
| Double    |          1 | 2026-09-13 |
| Deluxe    |       NULL | NULL       |
+-----------+------------+------------+

26. Join with a WHERE clause to find bookings for 'Rahul Patil'

Query:select b.booking_id, g.guest_name, r.room_type from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where g.guest_name = 'Rahul Patil';
+------------+-------------+-----------+
| booking_id | guest_name  | room_type |
+------------+-------------+-----------+
|          1 | Rahul Patil | Double    |
+------------+-------------+-----------+

27. Join with a WHERE clause to find bookings for 'Double' rooms

Query:select b.booking_id, g.guest_name, r.room_type from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where r.room_type = 'Double';
+------------+-------------+-----------+
| booking_id | guest_name  | room_type |
+------------+-------------+-----------+
|          1 | Rahul Patil | Double    |
+------------+-------------+-----------+

28. Join with check-in date filtering

Query:select b.booking_id, g.guest_name, r.room_type, b.check_in from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where b.check_in = '2026-09-10';
+------------+-------------+-----------+------------+
| booking_id | guest_name  | room_type | check_in   |
+------------+-------------+-----------+------------+
|          1 | Rahul Patil | Double    | 2026-09-10 |
+------------+-------------+-----------+------------+

29. Join with sorting by check-in date ascending

Query:select b.booking_id, g.guest_name, r.room_type, b.check_in from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id order by b.check_in asc;
+------------+--------------+-----------+------------+
| booking_id | guest_name   | room_type | check_in   |
+------------+--------------+-----------+------------+
|          1 | Rahul Patil  | Double    | 2026-09-10 |
|          2 | Pooja Shinde | Single    | 2026-09-12 |
+------------+--------------+-----------+------------+

30. Join with sorting by room price descending

Query:select b.booking_id, g.guest_name, r.room_type, r.price_per_nt from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id order by r.price_per_nt desc;
+------------+--------------+-----------+--------------+
| booking_id | guest_name   | room_type | price_per_nt |
+------------+--------------+-----------+--------------+
|          1 | Rahul Patil  | Double    |      2500.00 |
|          2 | Pooja Shinde | Single    |      1500.00 |
+------------+--------------+-----------+--------------+

31. Join with GROUP BY to count how many bookings each guest has made

Query:select g.guest_name, count(b.booking_id) as total_bookings from guests g left join bookings b on g.guest_id = b.guest_id group by g.guest_id, g.guest_name;
+---------------+----------------+
| guest_name    | total_bookings |
+---------------+----------------+
| Rahul Patil   |              1 |
| Pooja Shinde  |              1 |
| Amit Deshmukh |              0 |
+---------------+----------------+

32. Join with GROUP BY to find total price generated per room type

Query:select r.room_type, sum(r.price_per_nt) as total_price from rooms r join bookings b on r.room_id = b.room_id group by r.room_type;
+-----------+-------------+
| room_type | total_price |
+-----------+-------------+
| Single    |     1500.00 |
| Double    |     2500.00 |
+-----------+-------------+

33. Left join to find guests who have NOT made any bookings yet

Query:select g.guest_name, g.phone from guests g left join bookings b on g.guest_id = b.guest_id where b.booking_id is null;
+---------------+------------+
| guest_name    | phone      |
+---------------+------------+
| Amit Deshmukh | 7654321098 |
+---------------+------------+

34. Left join to find rooms that have NEVER been booked

Query:select r.room_id, r.room_type from rooms r left join bookings b on r.room_id = b.room_id where b.booking_id is null;
+---------+-----------+
| room_id | room_type |
+---------+-----------+
|       3 | Deluxe    |
+---------+-----------+

35. Join with LIKE operator for guest names starting with 'R'

Query:select b.booking_id, g.guest_name, r.room_type from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where g.guest_name like 'R%';
+------------+-------------+-----------+
| booking_id | guest_name  | room_type |
+------------+-------------+-----------+
|          1 | Rahul Patil | Double    |
+------------+-------------+-----------+

36. Join showing guest phone numbers along with their room types

Query:select g.guest_name, g.phone, r.room_type from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id;
+--------------+------------+-----------+
| guest_name   | phone      | room_type |
+--------------+------------+-----------+
| Rahul Patil  | 9876543210 | Double    |
| Pooja Shinde | 8765432109 | Single    |
+--------------+------------+-----------+

37. Join with multiple conditions in WHERE clause (room type and price filter)

Query:select b.booking_id, g.guest_name, r.room_type, r.price_per_nt from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id where r.room_type = 'Double' and r.price_per_nt > 2000;
+------------+-------------+-----------+--------------+
| booking_id | guest_name  | room_type | price_per_nt |
+------------+-------------+-----------+--------------+
|          1 | Rahul Patil | Double    |      2500.00 |
+------------+-------------+-----------+--------------+

38. Join with GROUP BY to count total bookings received for each room type

Query:select r.room_type, count(b.booking_id) as booking_count from rooms r left join bookings b on r.room_id = b.room_id group by r.room_type;
+-----------+---------------+
| room_type | booking_count |
+-----------+---------------+
| Single    |             1 |
| Double    |             1 |
| Deluxe    |             0 |
+-----------+---------------+

39. Join ordered by guest name alphabetically

Query:select g.guest_name, r.room_type, b.check_in from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id order by g.guest_name asc;
+--------------+-----------+------------+
| guest_name   | room_type | check_in   |
+--------------+-----------+------------+
| Pooja Shinde | Single    | 2026-09-12 |
| Rahul Patil  | Double    | 2026-09-10 |
+--------------+-----------+------------+

40. Complete reservation summary join query showing all key details

Query:select g.guest_name, r.room_type, r.price_per_nt, b.check_in, b.check_out from bookings b join guests g on b.guest_id = g.guest_id join rooms r on b.room_id = r.room_id;
+--------------+-----------+--------------+------------+------------+
| guest_name   | room_type | price_per_nt | check_in   | check_out  |
+--------------+-----------+--------------+------------+------------+
| Rahul Patil  | Double    |      2500.00 | 2026-09-10 | 2026-09-13 |
| Pooja Shinde | Single    |      1500.00 | 2026-09-12 | 2026-09-15 |
+--------------+-----------+--------------+------------+------------+


