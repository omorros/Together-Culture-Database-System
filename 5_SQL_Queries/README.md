# 5. SQL Queries

This section contains the ten SQL SELECT queries written to evaluate the functionality of the Together Culture database.
Each query includes the SQL command and an explanation of what it demonstrates.
All queries are also available in the raw `.txt` file (`TogetherCulture_SQL_Queries.txt`) located in this folder.

---

## Query Overview

The queries were designed to align with the **mapping questions** from the previous section and are grouped by business purpose:

| **Business Area**                  | **Queries** | **Objective**                                                   |
| ---------------------------------- | ----------- | --------------------------------------------------------------- |
| **General Usage Patterns**         | Q1–Q3       | Identify trends in workspace and member activity.               |
| **Event Participation**            | Q4–Q5       | Analyse event attendance and tag-based interests.               |
| **Workspace Utilisation**          | Q6          | Evaluate workspace performance and efficiency.                  |
| **Member Engagement**              | Q7–Q8       | Track changes in user participation over time.                  |
| **Diversity and Loyalty Analysis** | Q9–Q10      | Find users who engage across multiple areas or book frequently. |

---

## Query 1 – Patterns of Member Space Usage Over Time

```sql
SELECT DATE_FORMAT(timeslot.start_time, '%Y-%m') AS usage_month, 
       COUNT(userbooking.user_id) AS total_usage
FROM userbooking
JOIN timeslot ON userbooking.timeslot_id = timeslot.timeslot_id
GROUP BY usage_month
ORDER BY usage_month;
```

**Explanation:**
Tracks how many bookings occur each month to analyze long-term space usage trends and seasonal variations.

---

## Query 2 – Weekly Peak Days

```sql
SELECT DAYNAME(timeslot.start_time) AS day_of_week, 
       COUNT(userbooking.user_id) AS total_attendance
FROM userbooking
JOIN timeslot ON userbooking.timeslot_id = timeslot.timeslot_id
GROUP BY day_of_week
ORDER BY total_attendance DESC;
```

**Explanation:**
Finds which days of the week are the busiest by counting user bookings per weekday.

---

## Query 3 – Busiest Times of Day

```sql
SELECT HOUR(timeslot.start_time) AS hour_of_day, 
       COUNT(userbooking.user_id) AS total_usage
FROM userbooking
JOIN timeslot ON userbooking.timeslot_id = timeslot.timeslot_id
GROUP BY hour_of_day
ORDER BY total_usage DESC;
```

**Explanation:**
Identifies the time periods with the highest workspace usage to support scheduling and capacity planning.

---

## Query 4 – Event Attendance

```sql
SELECT event.event_name, 
       COUNT(userbooking.event_id) AS total_attendance
FROM userbooking
JOIN event ON userbooking.event_id = event.event_id
GROUP BY event.event_name
ORDER BY total_attendance DESC;
```

**Explanation:**
Displays the total attendance per event to determine which events attract the most participants.

---

## Query 5 – Event Tags and Interests

```sql
SELECT eventtag.eventtag_name, 
       COUNT(event.event_id) AS event_count
FROM event
JOIN eventtag ON event.event_tags = eventtag.eventtag_id
GROUP BY eventtag.eventtag_name
ORDER BY event_count DESC;
```

**Explanation:**
Analyzes event tags to understand which topics or categories are most common or popular among members.

---

## Query 6 – Workspace Utilization

```sql
SELECT workspace.workspace_type, 
       AVG(workspace.current_utilization) AS avg_utilization
FROM workspace
GROUP BY workspace.workspace_type
ORDER BY avg_utilization DESC;
```

**Explanation:**
Calculates the average utilization of each workspace type to evaluate performance and efficiency.

---

## Query 7 – Member Attendance Change

```sql
SELECT user_id, 
       DATE_FORMAT(timeslot.start_time, '%Y-%m') AS usage_month, 
       COUNT(userbooking.user_booking_id) AS total_bookings
FROM userbooking
JOIN timeslot ON userbooking.timeslot_id = timeslot.timeslot_id
WHERE user_id = 1
GROUP BY usage_month
ORDER BY usage_month;
```

**Explanation:**
Shows booking trends over time for a specific member to analyze engagement evolution.

---

## Query 8 – Engagement Trends

```sql
SELECT user_id, 
       COUNT(event_id) AS total_events
FROM userbooking
WHERE userbooking.timeslot_id IN (
    SELECT timeslot_id FROM timeslot WHERE start_time BETWEEN '2024-01-01' AND '2024-12-31'
)
GROUP BY user_id
ORDER BY total_events DESC;
```

**Explanation:**
Measures total event participation by user within a given year to assess engagement levels.

---

## Query 9 – Members Attending Multiple Types of Events

```sql
SELECT user.user_id, 
       user.full_name, 
       COUNT(DISTINCT event.event_tags) AS distinct_event_types
FROM userbooking
JOIN user ON userbooking.user_id = user.user_id
JOIN event ON userbooking.event_id = event.event_id
GROUP BY user.user_id, user.full_name
HAVING distinct_event_types > 1
ORDER BY distinct_event_types DESC;
```

**Explanation:**
Identifies users who attend multiple event categories, indicating diverse engagement interests.

---

## Query 10 – Frequent Workspace Bookers

```sql
SELECT user.user_id, 
       user.full_name, 
       COUNT(userbooking.workspace_id) AS total_workspace_bookings
FROM userbooking
JOIN user ON userbooking.user_id = user.user_id
WHERE userbooking.workspace_id IS NOT NULL
GROUP BY user.user_id, user.full_name
ORDER BY total_workspace_bookings DESC;
```

**Explanation:**
Finds the most active workspace users, useful for understanding demand and prioritizing loyal members.
