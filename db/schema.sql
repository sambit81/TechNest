--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT 'Hey ! I am using TechBlog.',
  `rdate` timestamp NULL DEFAULT NULL,
  `profile` varchar(100) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);


--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `link` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`tid`)
);


--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
);


--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT 'default_post_pic.jpg',
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`catId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `cid` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Table structure for table `liked`
--

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`lid`),
  KEY `pid_idx` (`pid`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `comment` text,
  `userName` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `commentPid` int DEFAULT NULL,
  `commentUid` int DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `postId_idx` (`commentPid`),
  KEY `userId_idx` (`commentUid`),
  CONSTRAINT `commentPid` FOREIGN KEY (`commentPid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commentUid` FOREIGN KEY (`commentUid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);