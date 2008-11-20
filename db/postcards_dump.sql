# CocoaMySQL dump
# Version 0.7b5
# http://cocoamysql.sourceforge.net
#
# Host: localhost (MySQL 5.0.51a-log)
# Database: bort
# Generation Time: 2008-11-16 16:51:15 +1100
# ************************************************************

# Dump of table links
# ------------------------------------------------------------

CREATE TABLE `links` (
  `id` int(11) NOT NULL auto_increment,
  `postcard_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('1','2','Hoc Mai Foundation','http://www.hocmai.org',NULL,NULL);
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('2','10','Uganda gorillas','www.uganda.org',NULL,'2008-11-16 03:44:28');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('3','14',NULL,'www.one.com','2008-11-15 07:57:30','2008-11-15 07:57:30');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('4','14',NULL,'www.two.com','2008-11-15 07:57:30','2008-11-15 07:57:30');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('5','14',NULL,'','2008-11-15 07:57:30','2008-11-15 07:57:30');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('6','15','One link','www.1.com','2008-11-15 08:14:30','2008-11-15 08:14:30');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('7','15','Two link','www.2.com','2008-11-15 08:14:30','2008-11-15 08:14:30');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('9','10','A new link','www.newlink.com.au','2008-11-16 02:41:24','2008-11-16 03:44:28');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('11','10','Third link','www.3rdlink.com','2008-11-16 03:44:28','2008-11-16 03:44:28');
INSERT INTO `links` (`id`,`postcard_id`,`title`,`url`,`created_at`,`updated_at`) VALUES ('12','11','','','2008-11-16 04:45:12','2008-11-16 04:45:12');


# Dump of table open_id_authentication_associations
# ------------------------------------------------------------

CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL auto_increment,
  `issued` int(11) default NULL,
  `lifetime` int(11) default NULL,
  `handle` varchar(255) default NULL,
  `assoc_type` varchar(255) default NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table open_id_authentication_nonces
# ------------------------------------------------------------

CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) default NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table passwords
# ------------------------------------------------------------

CREATE TABLE `passwords` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `reset_code` varchar(255) default NULL,
  `expiration_date` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `passwords` (`id`,`user_id`,`reset_code`,`expiration_date`,`created_at`,`updated_at`) VALUES ('1','1','527b56ce4ba1b5f3ae1eb640b7e5b7e2ca52e597','2008-11-26 04:19:37','2008-11-12 04:19:37','2008-11-12 04:19:37');


# Dump of table postcards
# ------------------------------------------------------------

CREATE TABLE `postcards` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` text,
  `organisation` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `tips` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `photo_file_name` varchar(255) default NULL,
  `photo_content_type` varchar(255) default NULL,
  `photo_file_size` int(11) default NULL,
  `photo_updated_at` datetime default NULL,
  `user_id` int(11) default NULL,
  `country` varchar(255) default NULL,
  `votes_count` int(11) default '0',
  `approved` tinyint(1) default '0',
  `location` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('1','Test one','This is the description','Hoc Mai','www.hocmai.org','These are some tips','2008-11-12 06:28:00','2008-11-14 06:56:44',NULL,NULL,NULL,NULL,'1',NULL,'1','0',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('2','Vietnam','<p>This is the<strong> description</strong></p>','Hoc Main','http://www.hocmai.org','<p>These are some tips</p>\r\n<ul>\r\n<li>This</li>\r\n<li>That</li>\r\n<li>The other</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>','2008-11-12 11:25:00','2008-11-16 02:09:20',NULL,NULL,NULL,NULL,'1',NULL,'0','0',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('4','test','<p>test</p>','test','test','<p>test</p>','2008-11-13 08:09:52','2008-11-16 04:58:27','n841390532_443283_5632.jpg','image/jpeg','57804','2008-11-13 08:09:52','1',NULL,'0','1',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('6','A test card 2','<p>This is the description</p>','hoc mau','ldkhfgq','<p>kfjghdf;gh;</p>','2008-11-13 08:55:47','2008-11-16 02:10:39','n841390532_443283_5632.jpg','image/jpeg','57804','2008-11-13 08:55:46','1',NULL,'0','1',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('8','A nother postcard','','','','','2008-11-13 09:07:31','2008-11-16 00:55:24','n841390532_443283_5632.jpg','image/jpeg','57804','2008-11-13 09:07:31','1',NULL,'0','0',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('9','My postcard','<p>This is the description of the amazing trip I took</p>','My trip.org','','<p>These are some things I wished I\'d known!</p>','2008-11-13 09:43:26','2008-11-16 00:55:24','Photo_2.jpg','image/jpeg','57625','2008-11-13 09:43:26','2',NULL,'0','0',NULL);
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('10','No country for old men','<p>This was a trip I made as part of my ICA.</p>','NTGPE','','<p>Somethings I wished I\'d known would include:</p>\r\n<ul>\r\n<li>Do this</li>\r\n<li>Do that</li>\r\n</ul>','2008-11-16 02:41:24','2008-11-16 04:05:06','Photo_7.jpg','image/jpeg','63133','2008-11-16 04:05:06','2','Australia','0','1','Oenpelli');
INSERT INTO `postcards` (`id`,`title`,`description`,`organisation`,`url`,`tips`,`created_at`,`updated_at`,`photo_file_name`,`photo_content_type`,`photo_file_size`,`photo_updated_at`,`user_id`,`country`,`votes_count`,`approved`,`location`) VALUES ('11','Fred test again ...','<p>This is the description</p>','','','','2008-11-16 04:45:12','2008-11-16 04:45:12',NULL,NULL,NULL,NULL,'2','Afghanistan','0','0','');


# Dump of table roles
# ------------------------------------------------------------

CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `roles` (`id`,`name`) VALUES ('1','admin');


# Dump of table roles_users
# ------------------------------------------------------------

CREATE TABLE `roles_users` (
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `roles_users` (`role_id`,`user_id`) VALUES ('1','1');


# Dump of table schema_migrations
# ------------------------------------------------------------

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `schema_migrations` (`version`) VALUES ('20080929171348');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081112062717');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081112105654');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081112105747');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081112112327');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081113074754');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081113080421');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081113085436');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114012821');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114034111');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114034605');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114045452');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114063556');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114065513');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081114092021');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081115063636');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081115074819');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081115094700');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081115225220');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081116005148');
INSERT INTO `schema_migrations` (`version`) VALUES ('20081116054918');


# Dump of table sessions
# ------------------------------------------------------------

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `sessions` (`id`,`session_id`,`data`,`created_at`,`updated_at`) VALUES ('7','04b2a685936b5610b98f90f45d849015','BAh7CDoOcmV0dXJuX3RvMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMdXNlcl9pZGkG\n','2008-11-13 09:36:26','2008-11-13 09:38:07');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`created_at`,`updated_at`) VALUES ('9','6702e464b5110b94c520e99aed1826bf','BAh7CDoOcmV0dXJuX3RvMDoMdXNlcl9pZGkHIgpmbGFzaElDOidBY3Rpb25D\nb250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2008-11-13 11:12:26','2008-11-14 07:07:40');
INSERT INTO `sessions` (`id`,`session_id`,`data`,`created_at`,`updated_at`) VALUES ('25','51881fd25893e4e63cc9adf57e9fd2a8','BAh7CDoOcmV0dXJuX3RvMDoMdXNlcl9pZGkGIgpmbGFzaElDOidBY3Rpb25D\nb250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2008-11-16 04:58:11','2008-11-16 04:58:27');


# Dump of table taggings
# ------------------------------------------------------------

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('1','1','2','Postcard','2008-11-12 11:27:28');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('2','2','2','Postcard','2008-11-12 11:27:28');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('3','3','4','Postcard','2008-11-13 08:09:53');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('4','2','6','Postcard','2008-11-13 08:55:47');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('5','4','6','Postcard','2008-11-13 08:55:47');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('6','5','6','Postcard','2008-11-13 08:55:47');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('7','6','9','Postcard','2008-11-13 09:43:26');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('8','5','9','Postcard','2008-11-13 09:43:26');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('13','2','12','Postcard','2008-11-15 07:18:37');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('14','5','12','Postcard','2008-11-15 07:18:37');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('15','2','13','Postcard','2008-11-15 07:20:44');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('16','5','13','Postcard','2008-11-15 07:20:44');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('17','9','10','Postcard','2008-11-16 02:41:24');
INSERT INTO `taggings` (`id`,`tag_id`,`taggable_id`,`taggable_type`,`created_at`) VALUES ('18','10','10','Postcard','2008-11-16 02:41:24');


# Dump of table tags
# ------------------------------------------------------------

CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `tags` (`id`,`name`) VALUES ('1','vietnam');
INSERT INTO `tags` (`id`,`name`) VALUES ('2','hanoi');
INSERT INTO `tags` (`id`,`name`) VALUES ('3','test');
INSERT INTO `tags` (`id`,`name`) VALUES ('4','uganda');
INSERT INTO `tags` (`id`,`name`) VALUES ('5','elective');
INSERT INTO `tags` (`id`,`name`) VALUES ('6','africa');
INSERT INTO `tags` (`id`,`name`) VALUES ('7','fred');
INSERT INTO `tags` (`id`,`name`) VALUES ('8','other');
INSERT INTO `tags` (`id`,`name`) VALUES ('9','outback');
INSERT INTO `tags` (`id`,`name`) VALUES ('10','indigenous');


# Dump of table tiny_mce_photos
# ------------------------------------------------------------

CREATE TABLE `tiny_mce_photos` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `user_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `size` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `thumbnail` varchar(255) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `identity_url` varchar(255) default NULL,
  `name` varchar(100) default '',
  `email` varchar(100) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `remember_token` varchar(40) default NULL,
  `activation_code` varchar(40) default NULL,
  `state` varchar(255) NOT NULL default 'passive',
  `remember_token_expires_at` datetime default NULL,
  `activated_at` datetime default NULL,
  `deleted_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`,`login`,`identity_url`,`name`,`email`,`crypted_password`,`salt`,`remember_token`,`activation_code`,`state`,`remember_token_expires_at`,`activated_at`,`deleted_at`,`created_at`,`updated_at`) VALUES ('1','admin',NULL,'Fred Hersch','fredhersch@gmail.com','3670b63e1d7b3714c15c5540dace0e3158041ea9','e9eaed0afb57810262a48ca327d6d2f2e1356cb4',NULL,NULL,'active',NULL,'2008-11-12 04:18:39',NULL,'2008-11-12 04:18:39','2008-11-12 04:18:39');
INSERT INTO `users` (`id`,`login`,`identity_url`,`name`,`email`,`crypted_password`,`salt`,`remember_token`,`activation_code`,`state`,`remember_token_expires_at`,`activated_at`,`deleted_at`,`created_at`,`updated_at`) VALUES ('2','fredhersch',NULL,'','fredhersch@med.usyd.edu.au','e1299eaf6df22d3cce37ab183cd9c19de42ffff5','ef4e461d8b1ef163c8596fd14e0e5b7c3b2a70eb',NULL,NULL,'active',NULL,'2008-11-13 09:33:48',NULL,'2008-11-13 09:33:20','2008-11-15 12:30:43');
INSERT INTO `users` (`id`,`login`,`identity_url`,`name`,`email`,`crypted_password`,`salt`,`remember_token`,`activation_code`,`state`,`remember_token_expires_at`,`activated_at`,`deleted_at`,`created_at`,`updated_at`) VALUES ('3','joebloggs',NULL,'','joe@usyd.edu.au','5425246f84bae3a7feb23021302376585b7c38fc','9cf15845c3d57694f3eae2f1b434533d29b238bf',NULL,'e02c7d6c873f32a93c0d60f1e77b2001710553ef','pending',NULL,NULL,NULL,'2008-11-16 04:22:19','2008-11-16 04:22:19');
INSERT INTO `users` (`id`,`login`,`identity_url`,`name`,`email`,`crypted_password`,`salt`,`remember_token`,`activation_code`,`state`,`remember_token_expires_at`,`activated_at`,`deleted_at`,`created_at`,`updated_at`) VALUES ('4','fhersch',NULL,'','fher6965@med.usyd.edu.au','a2b5de53e07c98ce03e74b1b6d5db173102a9f63','dc82f1483ea2435505c0519111b453663f1bc913',NULL,'1f5d1807307e4ff97e66a20336c1c5a6826cc13f','pending',NULL,NULL,NULL,'2008-11-16 04:24:04','2008-11-16 04:24:04');


# Dump of table votes
# ------------------------------------------------------------

CREATE TABLE `votes` (
  `id` int(11) NOT NULL auto_increment,
  `postcard_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('1','1',NULL,'2008-11-14 04:56:11','2008-11-14 04:56:11');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('2','10',NULL,'2008-11-14 05:15:36','2008-11-14 05:15:36');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('3','10',NULL,'2008-11-14 05:22:31','2008-11-14 05:22:31');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('4','10',NULL,'2008-11-14 05:40:56','2008-11-14 05:40:56');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('5','10',NULL,'2008-11-14 05:52:24','2008-11-14 05:52:24');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('6','10',NULL,'2008-11-14 06:06:33','2008-11-14 06:06:33');
INSERT INTO `votes` (`id`,`postcard_id`,`user_id`,`created_at`,`updated_at`) VALUES ('7','3',NULL,'2008-11-14 07:07:27','2008-11-14 07:07:27');


