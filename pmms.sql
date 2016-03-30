

CREATE TABLE IF NOT EXISTS `building` (
	`building_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`building_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`total_rooms` int(5) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `room` (
	`room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`room_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`room_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`room_building_id` int(11) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`room_id`)
	CONSTRAINT `FK_room_building_id` FOREIGN KEY (`room_building_id`) REFERENCES `building` (`building_id`),
	INDEX `index_room_building_id` (`room_building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `college` (
	`college_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`telephone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`extension` int(11) NOT NULL,
	`fax` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`directline` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`website` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`facebook` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`tweeter` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`youtube` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`linkedin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `department` (
	`department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`extension` int(11) NOT NULL,
	`email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`website` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`department_college_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`department_id`),
	CONSTRAINT `FK_department_college_id` FOREIGN KEY (`department_college_id`) REFERENCES `college` (`college_id`),
	INDEX `index_dept_college_id` (`department_college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `systemuser` (
	`systemuser_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`user_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`user_middle_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`user_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`user_gender` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
	`systemuser_depart_id` int(10) unsigned NOT NULL,
	`systemuser_password` text NOT NULL,
	`systemuser_type` varchar(30) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`systemuser_id`),
	CONSTRAINT `FK_systemuser_depart_id` FOREIGN KEY (`systemuser_depart_id`) REFERENCES department (`department_id`),
	INDEX `index_syste_depart_id` (`systemuser_depart_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `machinery` (
	`machinery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`serial_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`machinery_room_id` int(10) unsigned NOT NULL,
	`brand` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
	`model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`machinery_id`),
	CONSTRAINT `FK_machinery_room_id` FOREIGN KEY (`machinery_room_id`) REFERENCES `room` (`room_id`),
	INDEX `index_machinery_room_id` (`machinery_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE IF NOT EXISTS `request` (
	`request_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`field_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`priority` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`status` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`request_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`category` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`submitted_by` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`assigned_to` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`contact_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`comments` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `laboratory_equip` (
	`lab_equip_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`serial_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`lab_equip_room_id` int(10) unsigned NOT NULL,
	`brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`lab_equip_id`),
	CONSTRAINT `FK_lab_equip_room_id` FOREIGN KEY (`lab_equip_room_id`) REFERENCES `room` (`room_id`),
	INDEX `index_lab_equip_room_id` (`lab_equip_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `office_equip` (
	`office_equip_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`serial_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`office_equip_room_id` int(10) unsigned NOT NULL,
	`brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`office_equip_id`),
	CONSTRAINT `FK_office_equip_room_id` FOREIGN KEY (`office_equip_room_id`) REFERENCES `room` (`room_id`),
	INDEX `index_office_equip_room_id` (`office_equip_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `vehicle` (
	`vehicle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`engine_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`chasis_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`plate_number` varchar (20) COLLATE utf8_unicode_ci NOT NULL,
	`vehicle_depart_id` int(10) unsigned NOT NULL,
	`brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`vehicle_id`),
	CONSTRAINT `FK_vehicle_depart_id` FOREIGN KEY (`vehicle_depart_id`) REFERENCES department (`department_id`),
	INDEX `index_vehicle_depart_id` (`vehicle_depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `vehicle_department` (
	`vehicle_department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`vehicle_department_veh_id` int(10) unsigned NOT NULL, 
	`vehicle_department_dept_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`vehicle_department_id`),
	CONSTRAINT `FK_vehicle_department_veh_id` FOREIGN KEY (`vehicle_department_veh_id`) REFERENCES vehicle (`vehicle_id`),
	CONSTRAINT `FK_vehicle_department_dept_id` FOREIGN KEY (`vehicle_department_dept_id`) REFERENCES department (`department_id`),
	INDEX `index_vehicle_department_veh_id` (`vehicle_department_veh_id`),
	INDEX `index_vehicle_department_dept_id` (`vehicle_department_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `furniture` (
	`furniture_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`model_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`furniture_room_id` int(10) unsigned NOT NULL,
	`brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`lab_equip_id`),
	CONSTRAINT `FK_furniture_room_id` FOREIGN KEY (`furniture_room_id`) REFERENCES `room` (`room_id`),
	INDEX `index_furniture_room_id` (`furniture_room_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `software` (
	`software_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
	`version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	`software_depart_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`software_id`),
	CONSTRAINT `FK_software_depart_id` FOREIGN KEY (`software_depart_id`) REFERENCES `department` (`department_id`),
	INDEX `index_software_depart_id` (`software_depart_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
