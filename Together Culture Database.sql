-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 03:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `togetherculture`
--

-- --------------------------------------------------------

--
-- Table structure for table `benefit`
--

CREATE TABLE `benefit` (
  `benefit_id` int(11) NOT NULL,
  `time_bank` varchar(50) DEFAULT NULL,
  `classes` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `benefit`
--

INSERT INTO `benefit` (`benefit_id`, `time_bank`, `classes`) VALUES
(1, '10 hours', 'Mindfulness Session'),
(2, '15 hours', 'Creative Writing Workshop'),
(3, '20 hours', 'Entrepreneurship Coaching'),
(4, '8 hours', 'Networking Events'),
(5, '12 hours', 'Yoga Sessions'),
(6, '5 hours', 'One-on-One Mentoring'),
(7, '10 hours', 'Mindfulness Session'),
(8, '15 hours', 'Creative Writing Workshop'),
(9, '20 hours', 'Entrepreneurship Coaching'),
(10, '8 hours', 'Networking Events'),
(11, '12 hours', 'Yoga Sessions');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `maximum_capacity` int(11) DEFAULT NULL,
  `ticket_quantity` int(11) DEFAULT NULL,
  `event_tags` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `location`, `maximum_capacity`, `ticket_quantity`, `event_tags`) VALUES
(1, 'Digital Orientation', 'The Tech Hall', 30, 25, 1),
(2, 'Watercolor Painting Class', 'Creative Studio', 20, 18, 3),
(3, 'Mindfulness Workshop', 'Wellness Room', 15, 12, 4),
(4, 'Startup Pitching Event', 'Innovation Hub', 50, 45, 2),
(5, 'Community Networking Night', 'The Main Hall', 100, 90, 5);

-- --------------------------------------------------------

--
-- Table structure for table `eventtag`
--

CREATE TABLE `eventtag` (
  `eventtag_id` int(11) NOT NULL,
  `eventtag_name` varchar(50) DEFAULT NULL,
  `eventtag_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventtag`
--

INSERT INTO `eventtag` (`eventtag_id`, `eventtag_name`, `eventtag_type`) VALUES
(1, 'Community Networking', 'Event Type'),
(2, 'Startup Pitching', 'Event Type'),
(3, 'Art Workshop', 'Event Type'),
(4, 'Yoga and Wellness', 'Event Type'),
(5, 'Business Development', 'Event Type'),
(6, 'Creative Expression', 'Event Type'),
(7, 'Community Networking', 'Event Type'),
(8, 'Startup Pitching', 'Event Type'),
(9, 'Art Workshop', 'Event Type'),
(10, 'Yoga and Wellness', 'Event Type'),
(11, 'Business Development', 'Event Type'),
(12, 'Creative Expression', 'Event Type');

-- --------------------------------------------------------

--
-- Table structure for table `mailchimp`
--

CREATE TABLE `mailchimp` (
  `mail_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `view_password` varchar(255) DEFAULT NULL,
  `referral_source` varchar(100) DEFAULT NULL,
  `materials_needs` tinyint(1) DEFAULT NULL,
  `creative_goals` varchar(255) DEFAULT NULL,
  `member_rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mailchimp`
--

INSERT INTO `mailchimp` (`mail_id`, `user_id`, `view_password`, `referral_source`, `materials_needs`, `creative_goals`, `member_rating`) VALUES
(1, 1, 'securepass1', 'Social Media', 1, 'Grow my startup', 4.5),
(2, 2, 'securepass2', 'Event Ad', 0, 'Explore art', 4),
(3, 3, 'securepass3', 'Website', 1, 'Join creative workshops', 4.8);

-- --------------------------------------------------------

--
-- Table structure for table `prospectivemember`
--

CREATE TABLE `prospectivemember` (
  `prospective_id` int(11) NOT NULL,
  `mail_id` int(11) DEFAULT NULL,
  `interaction_type` varchar(50) DEFAULT NULL,
  `interaction_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prospectivemember`
--

INSERT INTO `prospectivemember` (`prospective_id`, `mail_id`, `interaction_type`, `interaction_date`) VALUES
(1, 1, 'Signed up via Webinar', '2023-12-01'),
(2, 2, 'Attended Art Workshop', '2023-11-20'),
(3, 3, 'Joined Networking Night', '2023-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `ticket_quantity` int(11) DEFAULT NULL,
  `ticket_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `event_id`, `ticket_quantity`, `ticket_price`) VALUES
(1, 1, 10, 25),
(2, 2, 5, 50),
(3, 3, 15, 20),
(4, 4, 12, 15),
(5, 5, 8, 40);

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `timeslot_id` int(11) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`timeslot_id`, `start_time`, `end_time`, `isAvailable`) VALUES
(1, '2023-12-10', '2023-12-10', 1),
(2, '2023-12-10', '2023-12-10', 1),
(3, '2023-12-10', '2023-12-10', 0),
(4, '2023-12-10', '2023-12-10', 1),
(5, '2023-12-10', '2023-12-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `membership_type` varchar(50) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `membership_status` varchar(20) DEFAULT NULL,
  `waitlist` tinyint(1) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_attendance_date` date DEFAULT NULL,
  `user_tags` int(11) DEFAULT NULL,
  `benefit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `membership_type`, `join_date`, `expiry_date`, `address`, `membership_status`, `waitlist`, `full_name`, `email_address`, `phone_number`, `password`, `last_attendance_date`, `user_tags`, `benefit_id`) VALUES
(1, 'Premium', '2023-09-20', '2024-09-20', '20 Hills Road, Cambridge', 'Active', 1, 'Joe Bloggs', 'joe.bloggs@gmail.com', '0123456789', 'securepass', '2023-12-01', 1, 1),
(2, 'Standard', '2023-08-01', '2024-08-01', '25 Trumpington Street, Cambridge', 'Active', 0, 'Jane Doe', 'jane.doe@gmail.com', '0987654321', 'password123', '2023-11-30', 2, 2),
(3, 'Basic', '2023-07-02', '2024-07-02', '22 Market Square, Cambridge', 'Active', 1, 'Emma Smith', 'emma.smith@gmail.com', '0112233445', 'mypassword', '2023-12-05', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `userbooking`
--

CREATE TABLE `userbooking` (
  `user_booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `workspace_id` int(11) DEFAULT NULL,
  `timeslot_id` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userbooking`
--

INSERT INTO `userbooking` (`user_booking_id`, `user_id`, `event_id`, `workspace_id`, `timeslot_id`, `total_price`) VALUES
(1, 1, 1, 2, 1, 15),
(2, 2, 3, 3, 2, 10),
(3, 3, 2, 4, 3, 20),
(4, 1, 5, 5, 4, 25),
(5, 2, 4, 1, 5, 18);

-- --------------------------------------------------------

--
-- Table structure for table `usertag`
--

CREATE TABLE `usertag` (
  `usertag_id` int(11) NOT NULL,
  `usertag_name` varchar(50) DEFAULT NULL,
  `usertag_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertag`
--

INSERT INTO `usertag` (`usertag_id`, `usertag_name`, `usertag_type`) VALUES
(1, 'Community Builder', 'Interest'),
(2, 'Entrepreneur', 'Profession'),
(3, 'Artist', 'Interest'),
(4, 'Wellness Enthusiast', 'Interest'),
(5, 'Startup Founder', 'Profession'),
(6, 'Freelancer', 'Profession');

-- --------------------------------------------------------

--
-- Table structure for table `workspace`
--

CREATE TABLE `workspace` (
  `workspace_id` int(11) NOT NULL,
  `private_public` varchar(10) DEFAULT NULL,
  `workspace_type` varchar(50) DEFAULT NULL,
  `average_capacity` int(11) DEFAULT NULL,
  `workspace_capacity` int(11) DEFAULT NULL,
  `usage_count` int(11) DEFAULT NULL,
  `current_utilization` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspace`
--

INSERT INTO `workspace` (`workspace_id`, `private_public`, `workspace_type`, `average_capacity`, `workspace_capacity`, `usage_count`, `current_utilization`) VALUES
(1, 'Private', 'Focus Room', 5, 10, 6, 60.00),
(2, 'Public', 'Co-working Space', 30, 50, 20, 40.00),
(3, 'Private', 'Executive Suite', 3, 8, 2, 25.00),
(4, 'Public', 'Event Hall', 50, 100, 30, 60.00),
(5, 'Private', 'Workshop Space', 15, 25, 10, 40.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benefit`
--
ALTER TABLE `benefit`
  ADD PRIMARY KEY (`benefit_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_tags` (`event_tags`);

--
-- Indexes for table `eventtag`
--
ALTER TABLE `eventtag`
  ADD PRIMARY KEY (`eventtag_id`);

--
-- Indexes for table `mailchimp`
--
ALTER TABLE `mailchimp`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prospectivemember`
--
ALTER TABLE `prospectivemember`
  ADD PRIMARY KEY (`prospective_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`timeslot_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `benefit_id` (`benefit_id`),
  ADD KEY `fk_user_usertag` (`user_tags`);

--
-- Indexes for table `userbooking`
--
ALTER TABLE `userbooking`
  ADD PRIMARY KEY (`user_booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `timeslot_id` (`timeslot_id`);

--
-- Indexes for table `usertag`
--
ALTER TABLE `usertag`
  ADD PRIMARY KEY (`usertag_id`);

--
-- Indexes for table `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`workspace_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `benefit`
--
ALTER TABLE `benefit`
  MODIFY `benefit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eventtag`
--
ALTER TABLE `eventtag`
  MODIFY `eventtag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mailchimp`
--
ALTER TABLE `mailchimp`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prospectivemember`
--
ALTER TABLE `prospectivemember`
  MODIFY `prospective_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timeslot`
--
ALTER TABLE `timeslot`
  MODIFY `timeslot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userbooking`
--
ALTER TABLE `userbooking`
  MODIFY `user_booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usertag`
--
ALTER TABLE `usertag`
  MODIFY `usertag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `workspace`
--
ALTER TABLE `workspace`
  MODIFY `workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_tags`) REFERENCES `eventtag` (`eventtag_id`);

--
-- Constraints for table `mailchimp`
--
ALTER TABLE `mailchimp`
  ADD CONSTRAINT `mailchimp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `prospectivemember`
--
ALTER TABLE `prospectivemember`
  ADD CONSTRAINT `prospectivemember_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `mailchimp` (`mail_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_usertag` FOREIGN KEY (`user_tags`) REFERENCES `usertag` (`usertag_id`),
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`benefit_id`) REFERENCES `benefit` (`benefit_id`);

--
-- Constraints for table `userbooking`
--
ALTER TABLE `userbooking`
  ADD CONSTRAINT `userbooking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `userbooking_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `userbooking_ibfk_3` FOREIGN KEY (`workspace_id`) REFERENCES `workspace` (`workspace_id`),
  ADD CONSTRAINT `userbooking_ibfk_4` FOREIGN KEY (`timeslot_id`) REFERENCES `timeslot` (`timeslot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
