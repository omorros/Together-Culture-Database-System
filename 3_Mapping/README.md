# 3. Mapping

The following table shows how Together Culture’s business questions were mapped to the entities in the database model.
This mapping ensures that every relevant operational question can be answered directly through database queries, demonstrating the system’s ability to meet the organisation’s analytical needs.

---

## General Usage Patterns

| **Question**                                                 | **Maps To**               | **Explanation**                                                           |
| ------------------------------------------------------------ | ------------------------- | ------------------------------------------------------------------------- |
| 1. What times of day are the busiest?                        | User, User Bookings       | Attendance dates and booking timestamps can track long-term usage trends. |
| 2. Which days of the week see the highest member attendance? | User Bookings             | Extract the days of the week data from booking timestamp.                 |
| 3. What times of day are the busiest?                        | Time slots, User Bookings | Timeslot data reveals peak times.                                         |
| 4. How do usage patterns vary between weekdays and weekends? | User Bookings             | Compare booking trends by day type.                                       |
| 5. Are there any seasonal variations in space usage?         | User Bookings             | Group bookings by month or season.                                        |

---

## Individual Member Usage

| **Question**                                                                            | **Maps To**         | **Explanation**                                                           |
| --------------------------------------------------------------------------------------- | ------------------- | ------------------------------------------------------------------------- |
| 1. When are individual members visiting the space most frequently?                      | User, User Bookings | Track attendance and booking frequency per user.                          |
| 2. Can we track if a particular member's attendance has changed over time?              | User, User Bookings | Historical data and the last_attendance_date field allow change tracking. |
| 3. Has a member's usage increased significantly, indicating higher engagement?          | User Bookings       | Compare booking count over different time periods.                        |
| 4. Has a member been absent for an extended period, suggesting possible attrition risk? | User                | The absence period can be derived from the last attendance date.          |
| 5. Can we generate alerts for unusual changes in individual member attendance patterns? | User Bookings       | Attendance pattern anomalies can be identified with booking trends.       |

---

## Event Participation and Interests

| **Question**                                                                                              | **Maps To**           | **Explanation**                                                     |
| --------------------------------------------------------------------------------------------------------- | --------------------- | ------------------------------------------------------------------- |
| 1. What types of events are members most interested in (e.g., wellbeing, citizenship, making activities)? | Events, Tags          | Tags help track interest areas linked to events.                    |
| 2. Can we use a system of tags to track areas of interest for members?                                    | Tags, User Bookings   | Tags linked to users and events support interest tracking.          |
| 3. How many events has each member attended within a specific period?                                     | User Bookings         | Filter bookings by date range and count events.                     |
| 4. Which events have the highest attendance rates?                                                        | Events, User Bookings | Count bookings per event.                                           |
| 5. Can we identify trends in event participation among different member segments?                         | Events, User          | Participation trends can be analysed across member attributes.      |
| 6. How do event interests correlate with members' overall engagement and space usage?                     | Events, User Bookings | Event participation and booking data allow engagement correlations. |

---

## Audience Segmentation and Personalization

| **Question**                                                                                  | **Maps To**                     | **Explanation**                                            |
| --------------------------------------------------------------------------------------------- | ------------------------------- | ---------------------------------------------------------- |
| 1. Can we segment potential members based on their interests and interactions before joining? | Prospective Members, Tags       | Use tags linked to interactions for segmentation.          |
| 2. How effective are our current acquisition strategies based on engagement data?             | Mail Chimp, Prospective Members | Engagement metrics can evaluate acquisition effectiveness. |
| 3. What is the average volume of digital engagements before converting to membership?         | Mail Chimp, Prospective Members | Count engagements leading to memberships.                  |
| 4. Can we track and respond to potential members' interests more effectively?                 | Mail Chimp, Tags                | Use interaction data tied to tags.                         |
| 5. How can we personalize communication with members based on their segmented interests?      | Tags, Mail Chimp                | Link communication preferences to tags.                    |

---

## Space Utilisation and Capacity Planning

| **Question**                                                                              | **Maps To**               | **Explanation**                                                          |
| ----------------------------------------------------------------------------------------- | ------------------------- | ------------------------------------------------------------------------ |
| 1. What is the average capacity utilisation of the space at different times?              | Workspaces                | Capacity metrics and timeslot data measure utilization.                  |
| 2. How can we optimise workspace allocation to ensure a dynamic and integrated community? | Workspaces                | Compare capacity metrics against booking patterns.                       |
| 3. Are there specific areas within the space that are underutilised?                      | Workspaces                | Identify workspaces with consistently low usage.                         |
| 4. How can we avoid having segregated areas and promote mixing of different disciplines?  | Not mapped                | Requires qualitative input (e.g., user feedback) beyond database design. |
| 5. How can we back up our capacity estimates with data for future planning?               | Workspaces, User Bookings | Aggregating historical booking data.                                     |

---

## Reporting and Data Integration

| **Question**                                                                                        | **Maps To**         | **Explanation**                                                          |
| --------------------------------------------------------------------------------------------------- | ------------------- | ------------------------------------------------------------------------ |
| 1. Can we generate detailed reports on student member activity for organisational members like ARU? | User, User Bookings | Filter user data by attributes and generate reports.                     |
| 2. Can we automate data entry processes and report generation to reduce manual efforts?             | Not mapped          | Relates to external tools (e.g., automation scripts) rather than schema. |
| 3. How easily can we pull reports from the CRM that provide the necessary insights?                 | Not mapped          | Depends on the CRM's integration, outside database scope.                |
| 4. Are there any data integrity issues we need to address during integration?                       | All entities        | Ensure relational integrity across schema.                               |

---

## User Journey and Acquisition

| **Question**                                                                                        | **Maps To**                     | **Explanation**                                                      |
| --------------------------------------------------------------------------------------------------- | ------------------------------- | -------------------------------------------------------------------- |
| 1. How can we better track potential members' interactions before they join?                        | Prospective Members, Mail Chimp | Interaction types and dates help track potential members.            |
| 2. What tools can help us gather useful data on digital engagements?                                | Not mapped                      | Requires information about external tools, beyond the database.      |
| 3. What additional insights can tools like Mouseflow and Hotjar provide to improve user engagement? | Not mapped                      | These tools are external and not represented in the database schema. |
