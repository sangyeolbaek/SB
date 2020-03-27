/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */
SELECT name
  FROM Facilities
 WHERE membercost > 0.0

/* Q2: How many facilities do not charge a fee to members? */
SELECT COUNT(*)
  FROM Facilities
 WHERE membercost = 0.0

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */
SELECT facid,
       name,
       membercost,
       monthlymaintenance
  FROM Facilities
 WHERE membercost > 0.0 AND  membercost < (monthlymaintenance * 0.2)


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */
SELECT *
  FROM Facilities
 WHERE facid IN (1, 5)

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */
SELECT name,
       CASE WHEN monthlymaintenance > 100 THEN 'expensive'
       ELSE 'cheap' END AS cheap_or_expensive
  FROM Facilities

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */
SELECT firstname, surname
  FROM Members
 WHERE memid = 37

/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
SELECT DISTINCT Facilities.name AS 'Court name',
                CONCAT(Members.surname, ', ', Members.firstname) AS 'Member full name'
  FROM Facilities JOIN Bookings
    ON Facilities.facid = Bookings.facid JOIN Members
    ON Bookings.memid = Members.memid
 WHERE Facilities.name LIKE 'Tennis Court %' and Members.memid != 0
 ORDER BY 2, 1

/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */
SELECT fac.name AS 'Facility',
       CASE WHEN book.memid > 0 THEN CONCAT(mem.firstname, mem.surname)
            ELSE 'GUEST' END AS 'Member name',
       CASE WHEN book.memid > 0 THEN fac.membercost
            ELSE fac.guestcost END AS 'Cost'
  FROM Facilities fac JOIN Bookings book
    ON fac.facid = book.facid JOIN Members mem
    ON book.memid = mem.memid
 WHERE book.starttime LIKE '2012-09-14%'
HAVING Cost > 30.0
 ORDER BY 3 DESC

/* Q9: This time, produce the same result as in Q8, but using a subquery. */
SELECT Sep14.name AS 'Facility',
       CASE WHEN Sep14.memid > 0 THEN CONCAT(Sep14.firstname, Sep14.surname)
            ELSE 'GUEST' END AS 'Member name',
       CASE WHEN Sep14.memid > 0 THEN Sep14.membercost
            ELSE Sep14.guestcost END AS 'Cost'
  FROM (
  	    SELECT fac.name,
  	           book.memid,
  	           mem.firstname,
  	           mem.surname,
  	           fac.membercost,
  	           fac.guestcost
  	           fac.facid
  	      FROM Facilities fac JOIN Bookings book
  	        ON fac.facid = book.facid JOIN Members mem
  	        ON book.memid = mem.memid
  	     WHERE book.starttime LIKE '2012-09-14%'
  	) Sep14
HAVING Cost > 30.0
 ORDER BY 3 DESC /* I tried */

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */
SELECT fac.name AS 'Facilities',
       CASE WHEN book.memid > 0 THEN fac.membercost * book.slots
            ELSE fac.membercost * book.slots END AS 'Revenue'
  FROM Facilities fac JOIN Bookings book
    ON fac.facid = book.facid
HAVING Revenue < 1000.0
 ORDER BY 2 DESC