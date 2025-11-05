# 1. Requirement Analysis

## 1.1 Brief Introduction

Together Culture is a community organization located in Cambridge that supports creative and entrepreneurial growth. They have shared spaces where they bring people together to learn and collaborate. The main goal is to motivate and empower the members to create and innovate in their community.

As the company keeps growing exponentially, they need to find a better way to manage everything. From managing all the workspaces and resources that they have, to tracking members and organizing different types of events. A well-structured database can help and make this task way easier and more efficient. The project aims to create a database that helps Together Culture stay organized and support their mission. The database we will create will help them track memberships, manage bookings, plan the events and understand the member involvement.

Making sure members have a great experience and understanding the community needs in general, Together Culture will be able to put more time and energy into supporting creativity and growth. The project will begin by analysing the questions and documents provided by Together Culture and determining which fields need to be stored in the database. During this process we will consider the needs of the organization, and this will allow us to add additional entities or attributes if the database requires them to increase the flexibility of the system. Next, we will create an Extended Entity Relationship Diagram (EERD) to understand how all the data will be organized and related, and a table schema to define the structure of the database. We will then ensure that the design map all possible questions provided by Together Culture as this will mean that our database structure matches the client's needs. As an individual task, each team member will then use the provided database software to create tables based on the final schema. Finally, each team member will write ten SQL SELECT queries to demonstrate database functionality. Eight of the questions will be chosen from a list of questions provided by Together Culture and based on the team members' own analysis of the organization's needs, two additional questions will be created. All these steps ensure that the database design meets the requirements of Together Culture.

---

## 1.2 List of Data Fields (Entities and their Attributes)

| **Entity**            | **Attributes**                                                                                                                                                                              |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **User**              | user_id_PK, membership_type, join_date, expiry_date, address, membership_status, waitlist, full_name, email_address, phone_number, password, last_attendance_date, user_tags, benefit_id_FK |
| **UserBooking**       | user_booking_id_PK, user_id_FK, event_id_FK, workspace_id_FK, timeslot_id_FK, total_price                                                                                                   |
| **Event**             | event_id_PK, event_name, location, maximum_capacity, ticket_quantity, event_tags                                                                                                            |
| **Ticket**            | ticket_id_PK, event_id_FK, ticket_quantity, ticket_price                                                                                                                                    |
| **TimeSlot**          | timeslot_id_PK, start_time, end_time, isAvailable                                                                                                                                           |
| **Workspace**         | workspace_id_PK, private_public, workspace_type, average_capacity, max_capacity, usage_count, current_utilization                                                                           |
| **MailChimp**         | mail_id_PK, user_id_FK, prospective_id_FK, view_password, referral_source, materials_needs, creative_goals, member_rating                                                                   |
| **Benefits**          | benefit_id_PK, time_bank, classes                                                                                                                                                           |
| **ProspectiveMember** | prospective_id_PK, mail_id_FK, interaction_type, interaction_date                                                                                                                           |
| **Tag**               | tag_id_PK, tag_name, tag_type                                                                                                                                                               |
