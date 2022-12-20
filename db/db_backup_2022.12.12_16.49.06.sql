SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
-- -------------------------------------------

-- -------------------------------------------

-- START BACKUP

-- -------------------------------------------

-- -------------------------------------------

-- TABLE `migration`

-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_about`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_about`;
CREATE TABLE IF NOT EXISTS `tbl_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intro` text NOT NULL,
  `address` text NOT NULL,
  `education` text NOT NULL,
  `location` text NOT NULL,
  `work` text NOT NULL,
  `hobbies` text NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-about-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-about-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_chapter`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_chapter`;
CREATE TABLE IF NOT EXISTS `tbl_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-chapter-created_by_id` (`created_by_id`),
  KEY `idx-chapter-course_id` (`course_id`),
  CONSTRAINT `fk-chapter-course_id` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-chapter-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_course`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_course`;
CREATE TABLE IF NOT EXISTS `tbl_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-course-created_by_id` (`created_by_id`),
  KEY `idx-trainer-trainer_id` (`trainer_id`),
  CONSTRAINT `fk-course-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-trainer-trainer_id` FOREIGN KEY (`trainer_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_dept`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE IF NOT EXISTS `tbl_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `field` varchar(25) DEFAULT NULL,
  `school_name` varchar(25) DEFAULT NULL,
  `hod_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-dept-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-dept-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_discussion`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_discussion`;
CREATE TABLE IF NOT EXISTS `tbl_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `user_id` int(11) DEFAULT 1,
  `replied_to` int(11) DEFAULT 1,
  `model` varchar(255) NOT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-discussion-created_by_id` (`created_by_id`),
  KEY `idx-discussion-model` (`model`),
  KEY `idx-discussion-replied_to` (`replied_to`),
  CONSTRAINT `fk-discussion-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-discussion-replied_to` FOREIGN KEY (`replied_to`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_email_tempalte`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_email_tempalte`;
CREATE TABLE IF NOT EXISTS `tbl_email_tempalte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `html` text NOT NULL,
  `json` text NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-tempalte-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-tempalte-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_feed`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_feed`;
CREATE TABLE IF NOT EXISTS `tbl_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-feed-created_by_id` (`created_by_id`),
  KEY `idx-feed-title` (`title`),
  CONSTRAINT `fk-feed-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_follow`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_follow`;
CREATE TABLE IF NOT EXISTS `tbl_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-follow-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-follow-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_image`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_image`;
CREATE TABLE IF NOT EXISTS `tbl_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-image-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-image-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_like`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_like`;
CREATE TABLE IF NOT EXISTS `tbl_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-like-created_by_id` (`created_by_id`),
  KEY `idx-like-model` (`model`),
  CONSTRAINT `fk-like-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_log`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE IF NOT EXISTS `tbl_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `action` text DEFAULT NULL,
  `message` text NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `type_id` tinyint(3) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx-log-created_by_id` (`created_by_id`),
  KEY `idx-log-message` (`message`(768)),
  CONSTRAINT `fk-log-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_message`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE IF NOT EXISTS `tbl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-message-created_by_id` (`created_by_id`),
  KEY `idx-message-user_id` (`user_id`),
  CONSTRAINT `fk-message-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-message-user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_notification`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_notification`;
CREATE TABLE IF NOT EXISTS `tbl_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `type_id` tinyint(3) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `model` varchar(25) DEFAULT NULL,
  `model_id` int(10) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx-notification-created_by_id` (`created_by_id`),
  KEY `idx-notification-to_user_id` (`to_user_id`),
  CONSTRAINT `fk-notification-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-notification-to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_skill`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_skill`;
CREATE TABLE IF NOT EXISTS `tbl_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `skill` varchar(25) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 1,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-skill-model` (`model`),
  KEY `idx-skill-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-skill-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_social_link`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_social_link`;
CREATE TABLE IF NOT EXISTS `tbl_social_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-social_link-created_by_id` (`created_by_id`),
  CONSTRAINT `fk-social_link-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;


-- -------------------------------------------

-- TABLE `tbl_user`

-- -------------------------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `roll_id` tinyint(3) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `dob` date DEFAULT NULL,
  `authKey` varchar(10) NOT NULL,
  `accessToken` varchar(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;




INSERT INTO `migration` (`version`,`apply_time`) VALUES
("m000000_000000_base","1668647197"),
("m220330_162243_create_tbl_user","1668647198"),
("m220401_163852_create_tbl_dept","1668647198"),
("m220403_083451_create_tbl_notification","1668647198"),
("m220419_154955_create_tbl_course","1668647199"),
("m220421_154646_create_tbl_feed","1668647199"),
("m220421_155013_create_tbl_chapter","1668647199"),
("m220421_155808_create_tbl_image","1668647199"),
("m220421_160242_create_tbl_discussion","1668647199"),
("m220421_160759_create_tbl_follow","1668647199"),
("m220421_161110_create_tbl_social_link","1668647199"),
("m220421_161515_create_tbl_like","1668647199"),
("m220421_161721_create_tbl_skill","1668647199"),
("m220527_214327_create_tbl_message","1668647199"),
("m220530_165007_create_tbl_email_template","1668647199"),
("m221101_025801_create_tbl_about","1668647199"),
("m221203_080854_create_new_tbl_log","1670055618"),
("m221206_165017_add_new_column_type_id_in_tbl_log","1670345779");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_chapter` (`id`,`title`,`desciption`,`dificulty`,`course_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","Inventore reiciendis ipsum rerum possimus debitis","<ul>
	<li><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#docsTabsOverview\">Overview</a></li>
	<li><a href=\"https://mdbootstrap.com/docs/standard/components/cards/\" target=\"_blank\">Card docs</a></li>
</ul>

<h2>Profiles</h2>

<h1>Bootstrap&nbsp;5&nbsp;Profile&nbsp;page &amp; profile cards</h1>

<p>Responsive profile pages and cards built with Bootstrap 5. User profile card, profile picture, followers, avatars, comments, social stats, edit profile form.</p>

<hr />
<h2>Basic profile card</h2>

<p>A simple profile <a href=\"https://mdbootstrap.com/docs/standard/components/cards/\">card</a> template with <a href=\"https://mdbootstrap.com/docs/standard/extended/chat/\">chat</a> option, <a href=\"https://mdbootstrap.com/docs/standard/extended/avatar/\">square avatar</a> and stat counters.</p>

<p><img alt=\"Generic placeholder image\" src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp\" style=\"width:180px\" /></p>

<p>Danny McLoan</p>

<p>Senior Journalist</p>

<p>Articles</p>

<p>41</p>

<p>Followers</p>

<p>976</p>

<p>Rating</p>

<p>8.5</p>

<ul>
	<li><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#mdb_0f751b4b859032f6446e192881b1e8f097dd8a65\">HTML</a></li>
</ul>

<pre>
<code>&lt;section class=&quot;vh-100&quot; style=&quot;background-color: #9de2ff;&quot;&gt;
  &lt;div class=&quot;container py-5 h-100&quot;&gt;
    &lt;div class=&quot;row d-flex justify-content-center align-items-center h-100&quot;&gt;
      &lt;div class=&quot;col col-md-9 col-lg-7 col-xl-5&quot;&gt;
        &lt;div class=&quot;card&quot; style=&quot;border-radius: 15px;&quot;&gt;
          &lt;div class=&quot;card-body p-4&quot;&gt;
            &lt;div class=&quot;d-flex text-black&quot;&gt;
              &lt;div class=&quot;flex-shrink-0&quot;&gt;
                &lt;img src=&quot;https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp&quot;
                  alt=&quot;Generic placeholder image&quot; class=&quot;img-fluid&quot;
                  style=&quot;width: 180px; border-radius: 10px;&quot;&gt;
              &lt;/div&gt;
              &lt;div class=&quot;flex-grow-1 ms-3&quot;&gt;
                &lt;h5 class=&quot;mb-1&quot;&gt;Danny McLoan&lt;/h5&gt;
                &lt;p class=&quot;mb-2 pb-1&quot; style=&quot;color: #2b2a2a;&quot;&gt;Senior Journalist&lt;/p&gt;
                &lt;div class=&quot;d-flex justify-content-start rounded-3 p-2 mb-2&quot;
                  style=&quot;background-color: #efefef;&quot;&gt;
                  &lt;div&gt;
                    &lt;p class=&quot;small text-muted mb-1&quot;&gt;Articles&lt;/p&gt;
                    &lt;p class=&quot;mb-0&quot;&gt;41&lt;/p&gt;
                  &lt;/div&gt;
                  &lt;div class=&quot;px-3&quot;&gt;
                    &lt;p class=&quot;small text-muted mb-1&quot;&gt;Followers&lt;/p&gt;
                    &lt;p class=&quot;mb-0&quot;&gt;976&lt;/p&gt;
                  &lt;/div&gt;
                  &lt;div&gt;
                    &lt;p class=&quot;small text-muted mb-1&quot;&gt;Rating&lt;/p&gt;
                    &lt;p class=&quot;mb-0&quot;&gt;8.5&lt;/p&gt;
                  &lt;/div&gt;
                &lt;/div&gt;
                &lt;div class=&quot;d-flex pt-1&quot;&gt;
                  &lt;button type=&quot;button&quot; class=&quot;btn btn-outline-primary me-1 flex-grow-1&quot;&gt;Chat&lt;/button&gt;
                  &lt;button type=&quot;button&quot; class=&quot;btn btn-primary flex-grow-1&quot;&gt;Follow&lt;/button&gt;
                &lt;/div&gt;
              &lt;/div&gt;
            &lt;/div&gt;
          &lt;/div&gt;
        &lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/section&gt;</code></pre>

<hr />
<h2>eCommerce profile card</h2>

<p>A <a href=\"https://mdbootstrap.com/docs/standard/design-blocks/ecommerce/\">eCommerce</a> profile card with a <a href=\"https://mdbootstrap.com/docs/standard/components/rating/\">star rating</a> number of <a href=\"https://mdbootstrap.com/docs/standard/extended/comments/\">comments</a> / <a href=\"https://mdbootstrap.com/docs/standard/extended/testimonials/\">testimonial reviews</a> and a &quot;Book now&quot; call to action button. The CTA in this case could be integrated with a <a href=\"https://mdbootstrap.com/docs/standard/plugins/calendar/\">calendar</a> schedule.</p>

<p>Exquisite hand henna tattoo</p>

<p>3 hrs</p>

<p>$90</p>

<p><img alt=\"Generic placeholder image\" src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-2.webp\" style=\"width:70px\" /></p>

<p>@sheisme</p>

<ul>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
</ul>

<hr />
<p>52 comments</p>

<hr />
<h2>User profile page template</h2>

<p>A full user profile layout, with a circle <a href=\"https://mdbootstrap.com/docs/standard/extended/avatar/\">profile picture</a> in the header, projects section with <a href=\"https://mdbootstrap.com/docs/standard/extended/social-media/\">social icons</a>, a detailed <a href=\"https://mdbootstrap.com/docs/standard/extended/bootstrap-address-form/\">address section</a> and experience cards using <a href=\"https://mdbootstrap.com/docs/standard/components/progress/\">progress bars</a> to indicate skill level.</p>

<ol>
	<li><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#\">Home</a></li>
	<li><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#\">User</a></li>
	<li>User Profile</li>
</ol>

<p><img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp\" style=\"width:150px\" /></p>

<p>John Smith</p>

<p>Full Stack Developer</p>

<p>Bay Area, San Francisco, CA</p>

<ul>
	<li>
	<p>https://mdbootstrap.com</p>
	</li>
	<li>
	<p>mdbootstrap</p>
	</li>
	<li>
	<p>@mdbootstrap</p>
	</li>
	<li>
	<p>mdbootstrap</p>
	</li>
	<li>
	<p>mdbootstrap</p>
	</li>
</ul>

<p>Full Name</p>

<p>Johnatan Smith</p>

<hr />
<p>Email</p>

<p>example@example.com</p>

<hr />
<p>Phone</p>

<p>(097) 234-5678</p>

<hr />
<p>Mobile</p>

<p>(098) 765-4321</p>

<hr />
<p>Address</p>

<p>Bay Area, San Francisco, CA</p>

<p>assigment Project Status</p>

<p>Web Design</p>

<p>Website Markup</p>

<p>One Page</p>

<p>Mobile Template</p>

<p>Backend API</p>

<p>assigment Project Status</p>

<p>Web Design</p>

<p>Website Markup</p>

<p>One Page</p>

<p>Mobile Template</p>

<p>Backend API</p>

<hr />
<h2>Project cards with attending users</h2>

<p>The list of attendance in this example is indicated by <a href=\"https://mdbootstrap.com/docs/standard/extended/avatar/\">profile pictures</a> of users that joined the event.</p>

<h3>Program Title</h3>

<p>| Created by <strong>MDBootstrap</strong> on 11 April , 2021</p>

<hr />
<p>settings</p>

<p>program link</p>

<p>program link |</p>

<p><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\"><img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-2.webp\" style=\"width:35px\" /> </a></p>

<h3>Company Culture</h3>

<p>| Public | Updated by <strong>MDBootstrap</strong> on 11 April , 2021</p>

<hr />
<p>settings</p>

<p>program link</p>

<p>program link |</p>

<p><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\"><img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-2.webp\" style=\"width:35px\" /> </a> <a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\"> <img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-3.webp\" style=\"width:35px\" /> </a> <a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\"> <img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-4.webp\" style=\"width:35px\" /> </a> <a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\"> <img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp\" style=\"width:35px\" /> </a></p>

<hr />
<h2>Personal profile with edit icon</h2>

<p>Responsive profile card design with a clickable update option for the user. Check out the <a href=\"https://mdbootstrap.com/docs/standard/forms/input-fields/\">inputs</a> documentation, to integrate &amp; make this template interactive.</p>

<p><img alt=\"avatar\" src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp\" style=\"width:80px\" /></p>

<p>Marie Horwitz</p>

<p>Web Designer</p>

<p>&nbsp;</p>

<p>Information</p>

<hr />
<p>Email</p>

<p>info@example.com</p>

<p>Phone</p>

<p>123 456 789</p>

<p>Projects</p>

<hr />
<p>Recent</p>

<p>Lorem ipsum</p>

<p>Most Viewed</p>

<p>Dolor sit amet</p>

<hr />
<h2>Edit button on profile page</h2>

<p>An elegant profile page layout, with an edit button, about section and a <a href=\"https://mdbootstrap.com/docs/standard/extended/gallery/\">photo gallery</a>.</p>

<p><img alt=\"Generic placeholder image\" src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp\" style=\"width:150px\" /></p>

<p>Andy Horwitz</p>

<p>New York</p>

<p>253</p>

<p>Photos</p>

<p>1026</p>

<p>Followers</p>

<p>478</p>

<p>Following</p>

<p>About</p>

<p>Web Developer</p>

<p>Lives in New York</p>

<p>Photographer</p>

<p>Recent photos</p>

<p><a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\">Show all</a></p>

<p><img alt=\"image 1\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp\" /></p>

<p><img alt=\"image 1\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp\" /></p>

<p><img alt=\"image 1\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp\" /></p>

<p><img alt=\"image 1\" src=\"https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(114).webp\" /></p>

<hr />
<h2>Profile card with statistics</h2>

<p>A light design for any profile card, with <a href=\"https://mdbootstrap.com/docs/standard/extended/social-media/\">social buttons</a> and basic stats.</p>

<p><img src=\"https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp\" style=\"width:100px\" /></p>

<p>Julie L. Arsenault</p>

<p>@Programmer | <a href=\"https://mdbootstrap.com/docs/standard/extended/profiles/#!\">mdbootstrap.com</a></p>

<p>8471</p>

<p>Wallets Balance</p>

<p>8512</p>

<p>Income amounts</p>

<p>4751</p>

<p>Total Transactions</p>

<hr />
<h2>Related resources</h2>
","1","1","2022-12-04 20:13:37","3","2022-12-04 20:13:37");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_course` (`id`,`name`,`desciption`,`dificulty`,`trainer_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","Breanna Britt","<p>sdkfsl kdmflskmf lsdkmflskdmclskmd clskmlcxk mlskmdflskmflskmdflekf</p>
","1","3","2022-12-04 20:13:05","3","2022-12-04 20:13:05"),
("2","Lana Wolfe","<p>sdkfsl kdmflskmf lsdkmflskdmclskmd clskmlcxk mlskmdflskmflskmdflekf</p>
","3","1","2022-12-07 22:40:05","1","2022-12-07 22:40:05"),
("3","Breanna Britt","<p>sdkfsl kdmflskmf lsdkmflskdmclskmd clskmlcxk mlskmdflskmflskmdflekf</p>
","1","1","2022-12-11 14:18:43","1","2022-12-11 14:18:43");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_discussion` (`id`,`message`,`user_id`,`replied_to`,`model`,`model_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","dasedrtfygu","1","1","app\\models\\Feed","2","2022-12-10 12:08:19","1","2022-12-10 12:08:19");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_email_tempalte` (`id`,`title`,`html`,`json`,`created_by_id`,`created_on`,`updated_on`) VALUES
("10","Hillary Dorsey","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; }
    </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table id=\"u_body\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\">Heading</h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text.</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:45px; v-text-anchor:middle; width:120px;\" arcsize=\"9%\"  stroke=\"f\" fillcolor=\"#3AAEE0\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #3AAEE0; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">Button Text</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":1,\"u_content_button\":1},\"body\":{\"id\":\"-4HyWGKW8H\",\"rows\":[{\"id\":\"Y66AWmLDJZ\",\"cells\":[1],\"columns\":[{\"id\":\"FxOzXRRJfh\",\"contents\":[{\"id\":\"5A6ITezOVX\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"Heading\"}},{\"id\":\"KA53b862Jw\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text.</p>\"}},{\"id\":\"SHWK4W4qJs\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#3AAEE0\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_1\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">Button Text</span>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 12:58:47","2022-12-10 12:58:47"),
("11","Olivia Gilbert","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-50 {
    width: 250px !important;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; }
    </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #ffffff;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table id=\"u_body\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #ffffff;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #ffffff;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-size: 22px;\">Discover a New Way to Test Head!</h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text.</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>



<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"250\" style=\"width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-50\" style=\"max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:63px;\" arcsize=\"11%\"  stroke=\"f\" fillcolor=\"#2dc26b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #2dc26b; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">Yes</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
<!--[if (mso)|(IE)]><td align=\"center\" width=\"250\" style=\"width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-50\" style=\"max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:56px;\" arcsize=\"11%\"  stroke=\"f\" fillcolor=\"#e03e2d\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #e03e2d; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">no</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":3,\"u_row\":2,\"u_content_heading\":1,\"u_content_text\":1,\"u_content_button\":2},\"body\":{\"id\":\"NdXMLqWxaw\",\"rows\":[{\"id\":\"BRXRE65pFA\",\"cells\":[1],\"columns\":[{\"id\":\"6TxBfq4iit\",\"contents\":[{\"id\":\"41R6TiXAHv\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"center\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"Discover a New Way to Test Head!\"}},{\"id\":\"T5bAi12-mG\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"center\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text.</p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"6E8XZpnlZV\",\"cells\":[1,1],\"columns\":[{\"id\":\"A2Vu3qTBbW\",\"contents\":[{\"id\":\"OXF7W8mBjf\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#2dc26b\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_1\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">Yes</span>\",\"calculatedWidth\":63,\"calculatedHeight\":37}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"borderRadius\":\"0px\",\"_meta\":{\"htmlID\":\"u_column_2\",\"htmlClassNames\":\"u_column\"}}},{\"id\":\"ELJzZK27NB\",\"contents\":[{\"id\":\"orsJ5dnt3T\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#e03e2d\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_2\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">no</span>\",\"calculatedWidth\":56,\"calculatedHeight\":37}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"borderRadius\":\"0px\",\"_meta\":{\"htmlID\":\"u_column_3\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"_meta\":{\"htmlID\":\"u_row_2\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#ffffff\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:18:20","2022-12-10 13:18:20"),
("14","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:42","2022-12-10 13:31:42"),
("15","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:42","2022-12-10 13:31:42"),
("16","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:42","2022-12-10 13:31:42"),
("17","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:42","2022-12-10 13:31:42"),
("18","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:42","2022-12-10 13:31:42"),
("19","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("20","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("21","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("22","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("23","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("24","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("25","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("26","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("27","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("28","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("29","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("30","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("31","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("32","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:31:43","2022-12-10 13:31:43"),
("33","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:32:08","2022-12-10 13:32:08"),
("34","Hillary Dorsey","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; }
    </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table id=\"u_body\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\">Heading</h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text.</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:45px; v-text-anchor:middle; width:120px;\" arcsize=\"9%\"  stroke=\"f\" fillcolor=\"#3AAEE0\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #3AAEE0; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">Button Text</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":1,\"u_content_button\":1},\"body\":{\"id\":\"-4HyWGKW8H\",\"rows\":[{\"id\":\"Y66AWmLDJZ\",\"cells\":[1],\"columns\":[{\"id\":\"FxOzXRRJfh\",\"contents\":[{\"id\":\"5A6ITezOVX\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"Heading\"}},{\"id\":\"KA53b862Jw\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text.</p>\"}},{\"id\":\"SHWK4W4qJs\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#3AAEE0\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_1\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">Button Text</span>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:32:21","2022-12-10 13:32:21"),
("35","Olivia Gilbert","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-50 {
    width: 250px !important;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } #u_body a { color: #0000ee; text-decoration: underline; }
    </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #ffffff;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table id=\"u_body\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #ffffff;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #ffffff;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-size: 22px;\">Discover a New Way to Test Head!</h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text.</p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>



<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"250\" style=\"width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-50\" style=\"max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:63px;\" arcsize=\"11%\"  stroke=\"f\" fillcolor=\"#2dc26b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #2dc26b; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">Yes</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
<!--[if (mso)|(IE)]><td align=\"center\" width=\"250\" style=\"width: 250px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-50\" style=\"max-width: 320px;min-width: 250px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-radius: 0px;-webkit-border-radius: 0px; -moz-border-radius: 0px;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
<div align=\"center\">
  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:56px;\" arcsize=\"11%\"  stroke=\"f\" fillcolor=\"#e03e2d\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->  
    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #e03e2d; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">
      <span style=\"display:block;padding:10px 20px;line-height:120%;\"><span style=\"font-size: 14px; line-height: 16.8px;\">no</span></span>
    </a>
  <!--[if mso]></center></v:roundrect><![endif]-->
</div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":3,\"u_row\":2,\"u_content_heading\":1,\"u_content_text\":1,\"u_content_button\":2},\"body\":{\"id\":\"NdXMLqWxaw\",\"rows\":[{\"id\":\"BRXRE65pFA\",\"cells\":[1],\"columns\":[{\"id\":\"6TxBfq4iit\",\"contents\":[{\"id\":\"41R6TiXAHv\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"center\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"Discover a New Way to Test Head!\"}},{\"id\":\"T5bAi12-mG\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"center\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text.</p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"6E8XZpnlZV\",\"cells\":[1,1],\"columns\":[{\"id\":\"A2Vu3qTBbW\",\"contents\":[{\"id\":\"OXF7W8mBjf\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#2dc26b\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_1\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">Yes</span>\",\"calculatedWidth\":63,\"calculatedHeight\":37}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"borderRadius\":\"0px\",\"_meta\":{\"htmlID\":\"u_column_2\",\"htmlClassNames\":\"u_column\"}}},{\"id\":\"ELJzZK27NB\",\"contents\":[{\"id\":\"orsJ5dnt3T\",\"type\":\"button\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"href\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"buttonColors\":{\"color\":\"#FFFFFF\",\"backgroundColor\":\"#e03e2d\",\"hoverColor\":\"#FFFFFF\",\"hoverBackgroundColor\":\"#3AAEE0\"},\"size\":{\"autoWidth\":true,\"width\":\"100%\"},\"textAlign\":\"center\",\"lineHeight\":\"120%\",\"padding\":\"10px 20px\",\"border\":{},\"borderRadius\":\"4px\",\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_button_2\",\"htmlClassNames\":\"u_content_button\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"font-size: 14px; line-height: 16.8px;\\\">no</span>\",\"calculatedWidth\":56,\"calculatedHeight\":37}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"borderRadius\":\"0px\",\"_meta\":{\"htmlID\":\"u_column_3\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"_meta\":{\"htmlID\":\"u_row_2\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#ffffff\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:32:25","2022-12-10 13:32:25"),
("36","0","<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">
<head>
<!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <meta name=\"x-apple-disable-message-reformatting\">
  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->
  <title></title>
  
    <style type=\"text/css\">
      @media only screen and (min-width: 520px) {
  .u-row {
    width: 500px !important;
  }
  .u-row .u-col {
    vertical-align: top;
  }

  .u-row .u-col-100 {
    width: 500px !important;
  }

}

@media (max-width: 520px) {
  .u-row-container {
    max-width: 100% !important;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .u-row .u-col {
    min-width: 320px !important;
    max-width: 100% !important;
    display: block !important;
  }
  .u-row {
    width: 100% !important;
  }
  .u-col {
    width: 100% !important;
  }
  .u-col > div {
    margin: 0 auto;
  }
}
body {
  margin: 0;
  padding: 0;
}

table,
tr,
td {
  vertical-align: top;
  border-collapse: collapse;
}

p {
  margin: 0;
}

.ie-container table,
.mso-container table {
  table-layout: fixed;
}

* {
  line-height: inherit;
}

a[x-apple-data-detectors=\'true\'] {
  color: inherit !important;
  text-decoration: none !important;
}

table, td { color: #000000; } </style>
  
  

</head>

<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">
  <!--[if IE]><div class=\"ie-container\"><![endif]-->
  <!--[if mso]><div class=\"mso-container\"><![endif]-->
  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">
  <tbody>
  <tr style=\"vertical-align: top\">
    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">
    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->
    

<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">
  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">
    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">
      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->
      
<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->
<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">
  <div style=\"height: 100%;width: 100% !important;\">
  <!--[if (!mso)&(!IE)]><!--><div style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->
  
<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:12px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-size: 22px;\"><span style=\"text-decoration: underline;\"><strong>Test Heading</strong></span></h1>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">
  <tr>
    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">
      
      <img align=\"center\" border=\"0\" src=\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>
      
    </td>
  </tr>
</table>

      </td>
    </tr>
  </tbody>
</table>

<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">
  <tbody>
    <tr>
      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">
        
  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">
    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>
  </div>

      </td>
    </tr>
  </tbody>
</table>

  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->
  </div>
</div>
<!--[if (mso)|(IE)]></td><![endif]-->
      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
    </div>
  </div>
</div>


    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
    </td>
  </tr>
  </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
","{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":2,\"u_content_image\":1},\"body\":{\"id\":\"BvEYb0XCa2\",\"rows\":[{\"id\":\"8X8Cp7slPu\",\"cells\":[1],\"columns\":[{\"id\":\"pTKYu4s7LO\",\"contents\":[{\"id\":\"gaty9CEkn1\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"12px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<span style=\\\"text-decoration: underline;\\\"><strong>Test Heading</strong></span>\"}},{\"id\":\"_bz7Sa-YXi\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}},{\"id\":\"TM5D9uMXZf\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://gorilla-email-storage.s3.amazonaws.com/1670656982636-Screenshot_20221029_014336.png\",\"width\":727,\"height\":579},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}},{\"id\":\"eTYJP2Gyw1\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_2\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. This is a new Text block. Change the text. </p>\"}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"cover\",\"position\":\"center\"},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":\"no-repeat\",\"size\":\"custom\",\"position\":\"center\"},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":11}","1","2022-12-10 13:32:28","2022-12-10 13:32:28");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_feed` (`id`,`title`,`desciption`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","New laptop","","2022-12-03 14:51:26","2","2022-12-03 14:51:26"),
("2","Tiles","","2022-12-04 20:17:53","3","2022-12-04 20:17:53"),
("3","Meme","","2022-12-04 20:21:07","3","2022-12-04 20:21:07"),
("4","Fugiat eaque quam nobis amet vel ipsam et molest","Ratione quasi doloremque unde maxime placeat enim non voluptas obcaecati proident elit id dicta commodo commodi quis consequatur Ut","2022-12-04 20:25:34","1","2022-12-04 20:25:34"),
("5","Voluptates quia facere dignissimos beatae impedit","Magna modi modi esse qui praesentium","2022-12-05 22:16:23","10","2022-12-05 22:16:23"),
("6","Ratione sit excepteur asperiores ut earum","Aliquip culpa sunt consequat Voluptate unde sunt ex sed reprehenderit sed irure laboriosam ipsum et proident dolor praesentium","2022-12-05 22:17:44","1","2022-12-05 22:17:44");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_follow` (`id`,`model`,`model_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("5","app\\models\\Users","2","2022-12-03 17:12:54","1","2022-12-03 17:12:54"),
("6","app\\models\\Users","3","2022-12-03 17:12:56","1","2022-12-03 17:12:56"),
("7","app\\models\\Users","4","2022-12-03 17:12:59","1","2022-12-03 17:12:59"),
("8","app\\models\\Users","1","2022-12-04 19:31:02","2","2022-12-04 19:31:02"),
("9","app\\models\\Users","3","2022-12-04 19:31:05","2","2022-12-04 19:31:05"),
("10","app\\models\\Users","1","2022-12-04 19:31:28","4","2022-12-04 19:31:28"),
("11","app\\models\\Users","3","2022-12-04 19:31:31","4","2022-12-04 19:31:31"),
("12","app\\models\\Users","4","2022-12-04 19:31:33","4","2022-12-04 19:31:33"),
("13","app\\models\\Users","1","2022-12-04 19:31:57","3","2022-12-04 19:31:57"),
("15","app\\models\\Users","4","2022-12-04 19:32:00","3","2022-12-04 19:32:00"),
("16","app\\models\\Users","3","2022-12-04 19:32:02","3","2022-12-04 19:32:02"),
("17","app\\models\\Users","3","2022-12-04 20:59:18","5","2022-12-04 20:59:18"),
("19","app\\models\\Users","4","2022-12-04 20:59:26","5","2022-12-04 20:59:26"),
("20","app\\models\\Users","5","2022-12-04 20:59:31","5","2022-12-04 20:59:31");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_image` (`id`,`name`,`folder`,`model`,`model_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","1-1670059286.jpg","Feed","app\\models\\Feed","1","2022-12-03 14:51:26","2","2022-12-03 14:51:26"),
("2","2-1670156949.jpg","Users","app\\models\\Users","2","2022-12-04 17:59:09","1","2022-12-04 17:59:09"),
("3","1-1670161363.jpg","Users","app\\models\\Users","1","2022-12-04 19:12:43","1","2022-12-04 19:12:43"),
("4","3-1670161635.jpg","Users","app\\models\\Users","3","2022-12-04 19:17:15","1","2022-12-04 19:17:15"),
("5","4-1670161657.jpg","Users","app\\models\\Users","4","2022-12-04 19:17:37","1","2022-12-04 19:17:37"),
("6","2-1670161674.jpg","Users","app\\models\\Users","2","2022-12-04 19:17:54","1","2022-12-04 19:17:54"),
("7","5-1670165157.jpg","Users","app\\models\\Users","5","2022-12-04 20:15:57","1","2022-12-04 20:15:57"),
("8","2-1670165273.jpg","Feed","app\\models\\Feed","2","2022-12-04 20:17:53","3","2022-12-04 20:17:53"),
("9","3-1670165467.jpg","Feed","app\\models\\Feed","3","2022-12-04 20:21:07","3","2022-12-04 20:21:07"),
("10","4-1670165734.jpg","Feed","app\\models\\Feed","4","2022-12-04 20:25:34","1","2022-12-04 20:25:34"),
("11","6-1670256261.jpg","Users","app\\models\\Users","6","2022-12-05 21:34:21","1","2022-12-05 21:34:21"),
("12","7-1670256276.jpg","Users","app\\models\\Users","7","2022-12-05 21:34:36","1","2022-12-05 21:34:36"),
("13","8-1670256285.jpg","Users","app\\models\\Users","8","2022-12-05 21:34:45","1","2022-12-05 21:34:45"),
("14","9-1670256302.jpg","Users","app\\models\\Users","9","2022-12-05 21:35:02","1","2022-12-05 21:35:02"),
("15","10-1670256340.jpg","Users","app\\models\\Users","10","2022-12-05 21:35:40","1","2022-12-05 21:35:40"),
("16","11-1670256365.jpg","Users","app\\models\\Users","11","2022-12-05 21:36:05","1","2022-12-05 21:36:05"),
("17","12-1670256380.jpg","Users","app\\models\\Users","12","2022-12-05 21:36:20","1","2022-12-05 21:36:20"),
("18","13-1670256404.jpg","Users","app\\models\\Users","13","2022-12-05 21:36:44","1","2022-12-05 21:36:44"),
("19","14-1670256423.jpg","Users","app\\models\\Users","14","2022-12-05 21:37:03","1","2022-12-05 21:37:03"),
("20","15-1670256437.jpg","Users","app\\models\\Users","15","2022-12-05 21:37:17","1","2022-12-05 21:37:17"),
("21","16-1670256479.jpg","Users","app\\models\\Users","16","2022-12-05 21:37:59","1","2022-12-05 21:37:59"),
("22","17-1670256487.jpg","Users","app\\models\\Users","17","2022-12-05 21:38:07","1","2022-12-05 21:38:07"),
("23","18-1670256502.jpg","Users","app\\models\\Users","18","2022-12-05 21:38:22","1","2022-12-05 21:38:22"),
("24","19-1670256511.jpg","Users","app\\models\\Users","19","2022-12-05 21:38:31","1","2022-12-05 21:38:31"),
("25","20-1670256523.jpg","Users","app\\models\\Users","20","2022-12-05 21:38:43","1","2022-12-05 21:38:43"),
("26","21-1670256537.jpg","Users","app\\models\\Users","21","2022-12-05 21:38:57","1","2022-12-05 21:38:57"),
("27","22-1670256547.jpg","Users","app\\models\\Users","22","2022-12-05 21:39:07","1","2022-12-05 21:39:07"),
("28","23-1670256560.jpg","Users","app\\models\\Users","23","2022-12-05 21:39:20","1","2022-12-05 21:39:20"),
("29","24-1670256591.png","Users","app\\models\\Users","24","2022-12-05 21:39:51","1","2022-12-05 21:39:51"),
("30","25-1670256619.png","Users","app\\models\\Users","25","2022-12-05 21:40:19","1","2022-12-05 21:40:19"),
("31","26-1670256744.jpg","Users","app\\models\\Users","26","2022-12-05 21:42:24","1","2022-12-05 21:42:24"),
("32","27-1670257837.png","Users","app\\models\\Users","27","2022-12-05 22:00:37","1","2022-12-05 22:00:37"),
("33","28-1670257852.png","Users","app\\models\\Users","28","2022-12-05 22:00:52","1","2022-12-05 22:00:52"),
("34","29-1670257862.jpg","Users","app\\models\\Users","29","2022-12-05 22:01:02","1","2022-12-05 22:01:02"),
("35","30-1670257873.jpg","Users","app\\models\\Users","30","2022-12-05 22:01:13","1","2022-12-05 22:01:13"),
("36","32-1670257884.jpg","Users","app\\models\\Users","32","2022-12-05 22:01:24","1","2022-12-05 22:01:24"),
("37","34-1670257898.jpg","Users","app\\models\\Users","34","2022-12-05 22:01:38","1","2022-12-05 22:01:38"),
("38","35-1670257907.jpg","Users","app\\models\\Users","35","2022-12-05 22:01:47","1","2022-12-05 22:01:47"),
("39","36-1670257916.jpg","Users","app\\models\\Users","36","2022-12-05 22:01:56","1","2022-12-05 22:01:56"),
("40","37-1670257924.jpg","Users","app\\models\\Users","37","2022-12-05 22:02:04","1","2022-12-05 22:02:04"),
("41","38-1670257938.jpg","Users","app\\models\\Users","38","2022-12-05 22:02:18","1","2022-12-05 22:02:18"),
("42","39-1670257946.jpg","Users","app\\models\\Users","39","2022-12-05 22:02:26","1","2022-12-05 22:02:26"),
("43","40-1670257954.jpg","Users","app\\models\\Users","40","2022-12-05 22:02:34","1","2022-12-05 22:02:34"),
("44","41-1670257962.jpg","Users","app\\models\\Users","41","2022-12-05 22:02:42","1","2022-12-05 22:02:42"),
("45","42-1670257975.jpg","Users","app\\models\\Users","42","2022-12-05 22:02:55","1","2022-12-05 22:02:55"),
("46","43-1670257983.jpg","Users","app\\models\\Users","43","2022-12-05 22:03:03","1","2022-12-05 22:03:03"),
("47","44-1670257990.jpg","Users","app\\models\\Users","44","2022-12-05 22:03:10","1","2022-12-05 22:03:10"),
("48","45-1670257999.jpg","Users","app\\models\\Users","45","2022-12-05 22:03:19","1","2022-12-05 22:03:19"),
("49","46-1670258008.jpg","Users","app\\models\\Users","46","2022-12-05 22:03:28","1","2022-12-05 22:03:28"),
("50","47-1670258026.png","Users","app\\models\\Users","47","2022-12-05 22:03:46","1","2022-12-05 22:03:46"),
("51","5-1670258783.png","Feed","app\\models\\Feed","5","2022-12-05 22:16:23","10","2022-12-05 22:16:23"),
("52","6-1670258864.png","Feed","app\\models\\Feed","6","2022-12-05 22:17:44","1","2022-12-05 22:17:44"),
("53","91-1670553505.png","Users","app\\models\\Users","91","2022-12-09 08:08:25","1","2022-12-09 08:08:25"),
("54","3-1670748523.jpg","Course","app\\models\\Course","3","2022-12-11 14:18:43","1","2022-12-11 14:18:43");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_like` (`id`,`model`,`model_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("3","app\\models\\Feed","3","2022-12-04 20:21:29","1","2022-12-04 20:21:29"),
("4","app\\models\\Feed","2","2022-12-04 20:21:35","1","2022-12-04 20:21:35"),
("5","app\\models\\Feed","2","2022-12-04 20:21:39","1","2022-12-04 20:21:39"),
("6","app\\models\\Feed","3","2022-12-04 20:23:19","3","2022-12-04 20:23:19"),
("7","app\\models\\Feed","3","2022-12-04 20:23:22","3","2022-12-04 20:23:22"),
("8","app\\models\\Feed","3","2022-12-04 20:23:24","3","2022-12-04 20:23:24"),
("9","app\\models\\Feed","3","2022-12-04 20:23:26","3","2022-12-04 20:23:26"),
("10","app\\models\\Feed","3","2022-12-04 20:23:28","3","2022-12-04 20:23:28"),
("11","app\\models\\Feed","5","2022-12-05 22:16:34","10","2022-12-05 22:16:34"),
("12","app\\models\\Feed","5","2022-12-05 22:16:35","10","2022-12-05 22:16:35"),
("13","app\\models\\Feed","5","2022-12-05 22:16:36","10","2022-12-05 22:16:36"),
("14","app\\models\\Feed","5","2022-12-05 22:16:38","10","2022-12-05 22:16:38"),
("15","app\\models\\Feed","5","2022-12-05 22:16:39","10","2022-12-05 22:16:39");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_log` (`id`,`ip`,`action`,`message`,`created_by_id`,`created_on`,`type_id`) VALUES
("1","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'index\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063402.9579&NewLine;Array&NewLine;6278800","1","2022-12-03 16:00:02","0"),
("2","192.168.145.43","/Academy/web/user/index","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'index\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063409.1648&NewLine;Array&NewLine;6277712","2","2022-12-03 16:00:09","0"),
("3","127.0.0.1","/Academy/web/log/view?id=2","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\View::action in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\log\\view.php(16): yii\\base\\Component->__get(\'action\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'view\', Array, Object(app\\controllers\\LogController))
#5 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(59): yii\\base\\Controller->render(\'view\', Array)
#6 [internal function]: app\\controllers\\LogController->actionView(\'2\')
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/view\', Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#12 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#13 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670063526.3726&NewLine;Array&NewLine;6992400","1","2022-12-03 16:02:06","0"),
("4","192.168.145.43","/Academy/web/user/see-template?temp=1","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063605.5442&NewLine;Array&NewLine;6278512","2","2022-12-03 16:03:25","0"),
("5","192.168.145.43","/Academy/web/user/see-template?temp=2","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063605.6734&NewLine;Array&NewLine;6278512","2","2022-12-03 16:03:25","0"),
("6","192.168.145.43","/Academy/web/user/see-template?temp=3","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063605.759&NewLine;Array&NewLine;6278512","2","2022-12-03 16:03:25","0"),
("7","192.168.145.43","/Academy/web/site/view?id=1","yii\\base\\InvalidRouteException: Unable to resolve the request: site/view in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/view\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670063607.9275&NewLine;Array&NewLine;6500272","2","2022-12-03 16:03:27","0"),
("8","127.0.0.1","/Academy/web/log/index","ParseError: syntax error, unexpected single-quoted string \"created_by_id\", expecting \"]\" in C:\\xampp\\htdocs\\Academy\\views\\log\\index.php:43
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#3 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#4 [internal function]: app\\controllers\\LogController->actionIndex()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#10 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#11 {main}&NewLine;1&NewLine;ParseError&NewLine;1670063951.8263&NewLine;Array&NewLine;6877760","1","2022-12-03 16:09:11","0"),
("9","127.0.0.1","/Academy/web/log/index","yii\\base\\ErrorException: Undefined variable $model in C:\\xampp\\htdocs\\Academy\\views\\log\\index.php:40
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(40): yii\\base\\ErrorHandler->handleError(2, \'Undefined varia...\', \'C:\\\\xampp\\\\htdocs...\', 40)
#1 [internal function]: yii\\base\\View->{closure}(Object(app\\models\\Log), 8, 0, Object(yii\\grid\\DataColumn))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(250): call_user_func(Object(Closure), Object(app\\models\\Log), 8, 0, Object(yii\\grid\\DataColumn))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(264): yii\\grid\\DataColumn->getDataCellValue(Object(app\\models\\Log), 8, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\DataColumn->renderDataCellContent(Object(app\\models\\Log), 8, 0)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(app\\models\\Log), 8, 0)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 8, 0)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')
#11 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#15 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#20 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#21 [internal function]: app\\controllers\\LogController->actionIndex()
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#26 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#27 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#28 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670063958.0869&NewLine;Array&NewLine;8101664","1","2022-12-03 16:09:18","0"),
("10","127.0.0.1","/Academy/web/log/index","TypeError: substr(): Argument #2 ($offset) must be of type int, string given in C:\\xampp\\htdocs\\Academy\\views\\log\\index.php:39
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(39): substr(\'yii\\\\base\\\\ErrorE...\', \'\\n\', true)
#1 [internal function]: yii\\base\\View->{closure}(Object(app\\models\\Log), 9, 0, Object(yii\\grid\\DataColumn))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(250): call_user_func(Object(Closure), Object(app\\models\\Log), 9, 0, Object(yii\\grid\\DataColumn))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\DataColumn.php(264): yii\\grid\\DataColumn->getDataCellValue(Object(app\\models\\Log), 9, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\DataColumn->renderDataCellContent(Object(app\\models\\Log), 9, 0)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(app\\models\\Log), 9, 0)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 9, 0)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')
#11 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#15 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(48): yii\\base\\Widget::widget(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#20 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#21 [internal function]: app\\controllers\\LogController->actionIndex()
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#26 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#27 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#28 {main}&NewLine;1&NewLine;TypeError&NewLine;1670064050.4254&NewLine;Array&NewLine;8070120","1","2022-12-03 16:10:50","0"),
("11","127.0.0.1","/Academy/web/user/see-template?temp=1","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670064201.6993&NewLine;Array&NewLine;6279552","1","2022-12-03 16:13:21","0"),
("12","127.0.0.1","/Academy/web/user/see-template?temp=2","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670064201.829&NewLine;Array&NewLine;6279552","1","2022-12-03 16:13:21","0"),
("13","127.0.0.1","/Academy/web/user/see-template?temp=3","ParseError: syntax error, unexpected token \"catch\" in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:162
Stack trace:
#0 [internal function]: yii\\BaseYii::autoload(\'app\\\\controllers...\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(661): class_exists(\'app\\\\controllers...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(620): yii\\base\\Module->createControllerByID(\'user\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(546): yii\\base\\Module->createController(\'see-template\')
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;ParseError&NewLine;1670064201.9389&NewLine;Array&NewLine;6279552","1","2022-12-03 16:13:21","0"),
("14","192.168.145.43","/Academy/web/site/view?id=1","yii\\base\\InvalidRouteException: Unable to resolve the request: site/view in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/view\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670064425.7087&NewLine;Array&NewLine;6650408","2","2022-12-03 16:17:05","0"),
("15","127.0.0.1","/Academy/web/site/create-email-template","TypeError: yii\\base\\View::{closure}(): Argument #2 ($model) must be of type app\\models\\Log, app\\models\\EmailTemplate given in C:\\xampp\\htdocs\\Academy\\views\\site\\_email_template.php:38
Stack trace:
#0 [internal function]: yii\\base\\View->{closure}(\'view\', Object(app\\models\\EmailTemplate), 1, 0, Object(hail812\\adminlte3\\yii\\grid\\ActionColumn))
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(219): call_user_func(Object(Closure), \'view\', Object(app\\models\\EmailTemplate), 1, 0, Object(hail812\\adminlte3\\yii\\grid\\ActionColumn))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(245): yii\\grid\\ActionColumn->createUrl(\'view\', Object(app\\models\\EmailTemplate), 1, 0)
#3 [internal function]: yii\\grid\\ActionColumn->yii\\grid\\{closure}(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(250): preg_replace_callback(\'/\\\\{([\\\\w\\\\-\\\\/]+)\\\\...\', Object(Closure), \'{view} {update}...\')
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\ActionColumn->renderDataCellContent(Object(app\\models\\EmailTemplate), 1, 0)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(app\\models\\EmailTemplate), 1, 0)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\EmailTemplate), 1, 0)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')
#12 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#16 C:\\xampp\\htdocs\\Academy\\views\\site\\_email_template.php(40): yii\\base\\Widget::widget(Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'_email_template\', Array, Object(app\\controllers\\SiteController))
#21 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#22 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#26 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#27 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#28 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#29 {main}&NewLine;1&NewLine;TypeError&NewLine;1670064960.9468&NewLine;Array&NewLine;8104568","1","2022-12-03 16:26:00","0"),
("16","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670064975.8192&NewLine;Array&NewLine;8669784","1","2022-12-03 16:26:15","0"),
("17","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670065000.8084&NewLine;Array&NewLine;8658688","1","2022-12-03 16:26:40","0"),
("18","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670065022.8462&NewLine;Array&NewLine;8635448","1","2022-12-03 16:27:02","0"),
("19","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670065057.6889&NewLine;Array&NewLine;8662520","1","2022-12-03 16:27:37","0"),
("20","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\ErrorException: Undefined variable $action in C:\\xampp\\htdocs\\Academy\\views\\site\\_email_template.php:32
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\site\\_email_template.php(32): yii\\base\\ErrorHandler->handleError(2, \'Undefined varia...\', \'C:\\\\xampp\\\\htdocs...\', 32)
#1 [internal function]: yii\\base\\View->{closure}(\'view\', Object(app\\models\\EmailTemplate), 1, 0, Object(yii\\grid\\ActionColumn))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(219): call_user_func(Object(Closure), \'view\', Object(app\\models\\EmailTemplate), 1, 0, Object(yii\\grid\\ActionColumn))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(245): yii\\grid\\ActionColumn->createUrl(\'view\', Object(app\\models\\EmailTemplate), 1, 0)
#4 [internal function]: yii\\grid\\ActionColumn->yii\\grid\\{closure}(Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\ActionColumn.php(250): preg_replace_callback(\'/\\\\{([\\\\w\\\\-\\\\/]+)\\\\...\', Object(Closure), \'{view} {update}...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\Column.php(111): yii\\grid\\ActionColumn->renderDataCellContent(Object(app\\models\\EmailTemplate), 1, 0)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(525): yii\\grid\\Column->renderDataCell(Object(app\\models\\EmailTemplate), 1, 0)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\EmailTemplate), 1, 0)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{items}\')
#13 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#17 C:\\xampp\\htdocs\\Academy\\views\\site\\_email_template.php(33): yii\\base\\Widget::widget(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'_email_template\', Array, Object(app\\controllers\\SiteController))
#22 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#23 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#26 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#27 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#28 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#29 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#30 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670065064.6207&NewLine;Array&NewLine;8133040","1","2022-12-03 16:27:44","0"),
("21","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670065147.3403&NewLine;Array&NewLine;8638152","1","2022-12-03 16:29:07","0"),
("22","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Message::getTime() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\navbar.php(102): yii\\base\\Component->__call(\'getTime\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(56): yii\\base\\View->render(\'navbar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670065183.7357&NewLine;Array&NewLine;8659400","1","2022-12-03 16:29:43","0"),
("23","127.0.0.1","/Academy/web/user/see-template?id=1","yii\\web\\BadRequestHttpException: Missing required parameters: temp in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Controller.php:202
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(51): yii\\web\\Controller->bindActionParams(Object(yii\\base\\InlineAction), Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'see-template\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#5 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#6 {main}&NewLine;1&NewLine;yii\\web\\HttpException:400&NewLine;1670065355.8419&NewLine;Array&NewLine;6579504","1","2022-12-03 16:32:35","0"),
("24","127.0.0.1","/Academy/web/user/see-template?id=1","yii\\web\\BadRequestHttpException: Missing required parameters: temp in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Controller.php:202
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(51): yii\\web\\Controller->bindActionParams(Object(yii\\base\\InlineAction), Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'see-template\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/see-templa...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#5 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#6 {main}&NewLine;1&NewLine;yii\\web\\HttpException:400&NewLine;1670065391.1955&NewLine;Array&NewLine;6579504","1","2022-12-03 16:33:11","0"),
("25","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","Error: Class \"DateRangePicker\" not found in C:\\xampp\\htdocs\\Academy\\views\\log\\index.php:48
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#4 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#5 [internal function]: app\\controllers\\LogController->actionIndex()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#11 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#12 {main}&NewLine;1&NewLine;Error&NewLine;1670066033.3072&NewLine;Array&NewLine;7394240","1","2022-12-03 16:43:53","0"),
("26","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\ErrorException: Undefined variable $model in C:\\xampp\\htdocs\\Academy\\views\\log\\index.php:50
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(50): yii\\base\\ErrorHandler->handleError(2, \'Undefined varia...\', \'C:\\\\xampp\\\\htdocs...\', 50)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#5 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#6 [internal function]: app\\controllers\\LogController->actionIndex()
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#12 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#13 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670066051.5337&NewLine;Array&NewLine;7775840","1","2022-12-03 16:44:11","0"),
("27","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(50): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066074.2076&NewLine;Array&NewLine;7858088","1","2022-12-03 16:44:34","0"),
("28","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(51): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066102.2378&NewLine;Array&NewLine;7889112","1","2022-12-03 16:45:02","0"),
("29","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(51): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066103.3271&NewLine;Array&NewLine;7858824","1","2022-12-03 16:45:03","0"),
("30","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(51): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066103.6385&NewLine;Array&NewLine;7858824","1","2022-12-03 16:45:03","0"),
("31","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(51): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066103.8978&NewLine;Array&NewLine;7858824","1","2022-12-03 16:45:03","0"),
("32","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(51): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066104.1414&NewLine;Array&NewLine;7858824","1","2022-12-03 16:45:04","0"),
("33","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066302.5882&NewLine;Array&NewLine;7885976","1","2022-12-03 16:48:22","0"),
("34","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066400.7735&NewLine;Array&NewLine;7886008","1","2022-12-03 16:50:00","0"),
("35","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066401.4953&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:01","0"),
("36","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066401.7527&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:01","0"),
("37","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066401.9883&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:01","0"),
("38","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066402.0502&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:02","0"),
("39","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066402.204&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:02","0"),
("40","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066402.3566&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:02","0"),
("41","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: You must install \'yiisoft/yii2-bootstrap\' extension for Bootstrap 3.x version support. Dependency to \'yii2-bootstrap\' has not been included with \'yii2-krajee-base\'. To resolve, you must add \'yiisoft/yii2-bootstrap\' to the \'require\' section of your application\'s composer.json file and then run \'composer update\'.

NOTE: This dependency change has been done since v2.0 of \'yii2-krajee-base\' because only one of \'yiisoft/yii2-bootstrap\' OR \'yiisoft/yii2-bootstrap4\' OR \'yiisoft/yii2-bootstrap5\' extensions can be installed. The developer can thus choose and control which bootstrap extension library to install. in C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\BootstrapTrait.php:235
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(107): kartik\\base\\InputWidget->initBsVersion()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066402.508&NewLine;Array&NewLine;7855720","1","2022-12-03 16:50:02","0"),
("42","127.0.0.1","/Academy/web/log/index","yii\\base\\InvalidConfigException: Either \'name\', or \'model\' and \'attribute\' properties must be specified. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\InputWidget.php:75
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\kartik-v\\yii2-krajee-base\\src\\InputWidget.php(108): yii\\widgets\\InputWidget->init()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): kartik\\base\\InputWidget->init()
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kartik\\\\daterang...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kartik\\\\daterang...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(49): yii\\base\\Widget::widget(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#12 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#13 [internal function]: app\\controllers\\LogController->actionIndex()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#19 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#20 {main}&NewLine;1&NewLine;yii\\base\\InvalidConfigException&NewLine;1670066476.8773&NewLine;Array&NewLine;8240776","1","2022-12-03 16:51:16","0"),
("43","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=2022-12-03%2005%3A00%3A00%20-%202022-12-03%2006%3A00%3A00&_pjax=%23p0","yii\\base\\ErrorException: Undefined array key \"log\" in C:\\xampp\\htdocs\\Academy\\models\\search\\Log.php:70
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\models\\search\\Log.php(70): yii\\base\\ErrorHandler->handleError(2, \'Undefined array...\', \'C:\\\\xampp\\\\htdocs...\', 70)
#1 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(42): app\\models\\search\\Log->search(Array)
#2 [internal function]: app\\controllers\\LogController->actionIndex()
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#8 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#9 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670067116.7883&NewLine;Array&NewLine;6892744","1","2022-12-03 17:01:56","0"),
("44","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=2022-12-03%2005%3A00%3A00%20-%202022-12-03%2006%3A00%3A00","yii\\base\\ErrorException: Undefined array key \"log\" in C:\\xampp\\htdocs\\Academy\\models\\search\\Log.php:70
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\models\\search\\Log.php(70): yii\\base\\ErrorHandler->handleError(2, \'Undefined array...\', \'C:\\\\xampp\\\\htdocs...\', 70)
#1 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(42): app\\models\\search\\Log->search(Array)
#2 [internal function]: app\\controllers\\LogController->actionIndex()
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#8 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#9 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670067116.8928&NewLine;Array&NewLine;6740496","1","2022-12-03 17:01:56","0"),
("45","127.0.0.1","/Academy/web/log/index?Log%5Bid%5D=&Log%5Bip%5D=&Log%5Baction%5D=&Log%5Bmessage%5D=&Log%5Bcreated_by_id%5D=&Log%5Bcreated_on%5D=2022-12-03%2005%3A00%3A00%20-%202022-12-03%2006%3A00%3A00","yii\\base\\InvalidArgumentException: Operator \'BETWEEN\' requires three operands. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\conditions\\BetweenCondition.php:93
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\QueryBuilder.php(1606): yii\\db\\conditions\\BetweenCondition::fromArrayDefinition(\'BETWEEN\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\QueryBuilder.php(1576): yii\\db\\QueryBuilder->createConditionFromArray(Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\QueryBuilder.php(1357): yii\\db\\QueryBuilder->buildCondition(Array, Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\QueryBuilder.php(235): yii\\db\\QueryBuilder->buildWhere(Array, Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(328): yii\\db\\QueryBuilder->build(Object(yii\\db\\Query))
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\Query.php(481): yii\\db\\ActiveQuery->createCommand(Object(yii\\db\\Connection))
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\ActiveQuery.php(352): yii\\db\\Query->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\Query.php(368): yii\\db\\ActiveQuery->queryScalar(\'COUNT(*)\', Object(yii\\db\\Connection))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\ActiveDataProvider.php(168): yii\\db\\Query->count(\'*\', NULL)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\BaseDataProvider.php(169): yii\\data\\ActiveDataProvider->prepareTotalCount()
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\ActiveDataProvider.php(105): yii\\data\\BaseDataProvider->getTotalCount()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\BaseDataProvider.php(101): yii\\data\\ActiveDataProvider->prepareModels()
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\BaseDataProvider.php(114): yii\\data\\BaseDataProvider->prepare()
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\data\\BaseDataProvider.php(155): yii\\data\\BaseDataProvider->getModels()
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(190): yii\\data\\BaseDataProvider->getCount()
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(158): yii\\widgets\\BaseListView->renderSummary()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{summary}\')
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\grid\\GridView->renderSection(\'{summary}\')
#18 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}\\n{item...\')
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#22 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(64): yii\\base\\Widget::widget(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#26 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#27 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#28 [internal function]: app\\controllers\\LogController->actionIndex()
#29 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#30 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#31 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#32 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#33 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#34 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#35 {main}&NewLine;1&NewLine;yii\\base\\InvalidArgumentException&NewLine;1670067175.9142&NewLine;Array&NewLine;8891184","1","2022-12-03 17:02:55","0"),
("46","127.0.0.1","/Academy/web/site/create-email-template","yii\\base\\ErrorException: Attempt to read property \"id\" on null in C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php:17
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php(17): yii\\base\\ErrorHandler->handleError(2, \'Attempt to read...\', \'C:\\\\xampp\\\\htdocs...\', 17)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(60): yii\\base\\View->render(\'sidebar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\SiteController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'\\r\\n<ul class=\"na...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(252): yii\\base\\Controller->render(\'_email_template\', Array)
#10 [internal function]: app\\controllers\\SiteController->actionCreateEmailTemplate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create-email-te...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/create-ema...\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670067417.6452&NewLine;Array&NewLine;8408600","0","2022-12-03 17:06:57","0"),
("47","127.0.0.1","/Academy/web/user/update?id=3","yii\\base\\ErrorException: Undefined variable $image in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:193
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(193): yii\\base\\ErrorHandler->handleError(2, \'Undefined varia...\', \'C:\\\\xampp\\\\htdocs...\', 193)
#1 [internal function]: app\\controllers\\UserController->actionUpdate(\'3\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'update\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/update\', Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#7 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#8 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670067617.7362&NewLine;Array&NewLine;7379664","1","2022-12-03 17:10:17","0"),
("48","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150282.4855&NewLine;Array&NewLine;6613712","1","2022-12-04 16:08:02","0"),
("49","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150284.7112&NewLine;Array&NewLine;6464200","1","2022-12-04 16:08:04","0"),
("50","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150284.8993&NewLine;Array&NewLine;6464200","1","2022-12-04 16:08:04","0"),
("51","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150285.0374&NewLine;Array&NewLine;6464200","1","2022-12-04 16:08:05","0"),
("52","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150287.7841&NewLine;Array&NewLine;6463552","1","2022-12-04 16:08:07","0"),
("53","127.0.0.1","/academy/web/debug/default/toolbar?tag=638c788fbe622","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150287.9049&NewLine;Array&NewLine;6465856","1","2022-12-04 16:08:07","0"),
("54","127.0.0.1","/academy/web/","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150288.7448&NewLine;Array&NewLine;6463552","1","2022-12-04 16:08:08","0"),
("55","127.0.0.1","/academy/web/debug/default/toolbar?tag=638c7890b4e19","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\Session::getenv in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\NewBaseController.php(21): yii\\base\\Component->__get(\'getenv\')
#1 C:\\xampp\\htdocs\\Academy\\controllers\\SiteController.php(79): app\\components\\NewBaseController->beforeAction(Object(yii\\base\\InlineAction))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(176): app\\controllers\\SiteController->beforeAction(Object(yii\\base\\InlineAction))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670150288.84&NewLine;Array&NewLine;6465856","1","2022-12-04 16:08:08","0"),
("56","127.0.0.1","/Academy/web/user/unshadow","Error: Call to a member function close() on int in C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php:532
Stack trace:
#0 [internal function]: app\\controllers\\UserController->actionUnshadow()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'unshadow\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/unshadow\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#6 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#7 {main}&NewLine;1&NewLine;Error&NewLine;1670152355.5738&NewLine;Array&NewLine;6672016","1","2022-12-04 16:42:35","0"),
("57","127.0.0.1","/Academy/web/log/index","yii\\base\\UnknownPropertyException: Setting unknown property: kop\\y2sp\\ScrollPager::grid in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:209
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(558): yii\\base\\Component->__set(\'grid\', Object(yii\\grid\\GridView))
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(107): yii\\BaseYii::configure(Object(kop\\y2sp\\ScrollPager), Array)
#2 [internal function]: yii\\base\\BaseObject->__construct(Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'kop\\\\y2sp\\\\Scroll...\', Array, Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'kop\\\\y2sp\\\\Scroll...\', Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(550): yii\\BaseYii::createObject(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(288): yii\\grid\\GridView->initColumns()
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\BaseObject.php(109): yii\\grid\\GridView->init()
#9 [internal function]: yii\\base\\BaseObject->__construct(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(419): ReflectionClass->newInstanceArgs(Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\di\\Container.php(170): yii\\di\\Container->build(\'yii\\\\grid\\\\GridVi...\', Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\BaseYii.php(365): yii\\di\\Container->get(\'yii\\\\grid\\\\GridVi...\', Array, Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(143): yii\\BaseYii::createObject(Array)
#14 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(69): yii\\base\\Widget::widget(Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#20 [internal function]: app\\controllers\\LogController->actionIndex()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#26 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#27 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670153133.7672&NewLine;Array&NewLine;8885984","3","2022-12-04 16:55:33","0"),
("58","127.0.0.1","/Academy/web/log/index","Error: Object of class yii\\web\\View could not be converted to string in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php:297
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#1 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(70): yii\\base\\Widget::widget(Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#6 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#7 [internal function]: app\\controllers\\LogController->actionIndex()
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#13 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#14 {main}&NewLine;1&NewLine;Error&NewLine;1670154477.4639&NewLine;Array&NewLine;8898736","3","2022-12-04 17:17:57","0"),
("59","127.0.0.1","/Academy/web/log/index","Error: Object of class yii\\web\\View could not be converted to string in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php:297
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\grid\\GridView->run()
#1 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(70): yii\\base\\Widget::widget(Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#6 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#7 [internal function]: app\\controllers\\LogController->actionIndex()
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#13 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#14 {main}&NewLine;1&NewLine;Error&NewLine;1670154491.3187&NewLine;Array&NewLine;8869024","3","2022-12-04 17:18:11","0"),
("60","127.0.0.1","/Academy/web/user/chat","yii\\base\\ErrorException: Attempt to read property \"id\" on null in C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php:17
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php(17): yii\\base\\ErrorHandler->handleError(2, \'Attempt to read...\', \'C:\\\\xampp\\\\htdocs...\', 17)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(60): yii\\base\\View->render(\'sidebar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'<main class=\"co...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(480): yii\\base\\Controller->render(\'_chat\')
#10 [internal function]: app\\controllers\\UserController->actionChat()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'chat\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/chat\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670155019.0615&NewLine;Array&NewLine;7023240","0","2022-12-04 17:26:59","0"),
("61","127.0.0.1","/Academy/web/user/index","yii\\base\\ErrorException: Attempt to read property \"id\" on null in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:17
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php(17): yii\\base\\ErrorHandler->handleError(2, \'Attempt to read...\', \'C:\\\\xampp\\\\htdocs...\', 17)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#8 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#11 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#16 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#17 [internal function]: app\\controllers\\UserController->actionIndex()
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#23 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#24 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670156767.7419&NewLine;Array&NewLine;7431480","0","2022-12-04 17:56:07","0"),
("62","127.0.0.1","/Academy/web/user/index","Error: Object of class app\\models\\Follow could not be converted to string in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:76
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 2, 1)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#10 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#15 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#16 [internal function]: app\\controllers\\UserController->actionIndex()
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#22 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#23 {main}&NewLine;1&NewLine;Error&NewLine;1670159274.821&NewLine;Array&NewLine;7711952","1","2022-12-04 18:37:54","0"),
("63","127.0.0.1","/Academy/web/user/index","Error: Object of class app\\models\\Follow could not be converted to string in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:76
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require()
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 2, 1)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#10 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#15 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#16 [internal function]: app\\controllers\\UserController->actionIndex()
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#22 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#23 {main}&NewLine;1&NewLine;Error&NewLine;1670159281.3395&NewLine;Array&NewLine;7731152","1","2022-12-04 18:38:01","0"),
("64","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670161310.6123&NewLine;Array&NewLine;6499312","3","2022-12-04 19:11:50","0"),
("65","192.168.145.43","/Academy/web/site/view?id=1","yii\\base\\InvalidRouteException: Unable to resolve the request: site/view in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'site/view\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670161921.8295&NewLine;Array&NewLine;6503728","2","2022-12-04 19:22:01","0"),
("66","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \".\" in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:51
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#6 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#9 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#15 [internal function]: app\\controllers\\UserController->actionIndex()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#21 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#22 {main}&NewLine;1&NewLine;ParseError&NewLine;1670162750.3611&NewLine;Array&NewLine;7505160","3","2022-12-04 19:35:50","0"),
("67","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \".\" in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:51
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#6 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#9 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#15 [internal function]: app\\controllers\\UserController->actionIndex()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#21 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#22 {main}&NewLine;1&NewLine;ParseError&NewLine;1670162764.0024&NewLine;Array&NewLine;7527672","3","2022-12-04 19:36:04","0"),
("68","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \".\" in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:51
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#6 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#9 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#15 [internal function]: app\\controllers\\UserController->actionIndex()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#21 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#22 {main}&NewLine;1&NewLine;ParseError&NewLine;1670162764.6224&NewLine;Array&NewLine;7527672","3","2022-12-04 19:36:04","0"),
("69","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \".\" in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:51
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#6 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#9 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#15 [internal function]: app\\controllers\\UserController->actionIndex()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#21 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#22 {main}&NewLine;1&NewLine;ParseError&NewLine;1670162764.9012&NewLine;Array&NewLine;7527672","3","2022-12-04 19:36:04","0"),
("70","127.0.0.1","/Academy/web/user/index","ParseError: syntax error, unexpected token \".\" in C:\\xampp\\htdocs\\Academy\\views\\user\\_card.php:51
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(191): yii\\base\\View->render(\'_card\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\ListView.php(124): yii\\widgets\\ListView->renderItem(Object(app\\models\\Users), 1, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\widgets\\ListView->renderItems()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#6 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{items}{pager}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): yii\\widgets\\BaseListView->run()
#9 C:\\xampp\\htdocs\\Academy\\views\\user\\index.php(26): yii\\base\\Widget::widget(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\UserController))
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\UserController))
#14 C:\\xampp\\htdocs\\Academy\\controllers\\UserController.php(99): yii\\base\\Controller->render(\'index\', Array)
#15 [internal function]: app\\controllers\\UserController->actionIndex()
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#19 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'user/index\', Array)
#20 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#21 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#22 {main}&NewLine;1&NewLine;ParseError&NewLine;1670162764.9778&NewLine;Array&NewLine;7527672","3","2022-12-04 19:36:04","0"),
("71","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670163985.0035&NewLine;Array&NewLine;6499312","3","2022-12-04 19:56:25","0"),
("72","127.0.0.1","/Academy/web/course/create","yii\\base\\ErrorException: Attempt to read property \"id\" on null in C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php:17
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php(17): yii\\base\\ErrorHandler->handleError(2, \'Attempt to read...\', \'C:\\\\xampp\\\\htdocs...\', 17)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(60): yii\\base\\View->render(\'sidebar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\CourseController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'<div class=\"cou...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\CourseController.php(102): yii\\base\\Controller->render(\'create\', Array)
#10 [internal function]: app\\controllers\\CourseController->actionCreate()
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/create\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\ErrorException:2&NewLine;1670164029.4272&NewLine;Array&NewLine;7604888","0","2022-12-04 19:57:09","0"),
("73","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164153.214&NewLine;Array&NewLine;6500536","3","2022-12-04 19:59:13","0"),
("74","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164337.9217&NewLine;Array&NewLine;6499312","3","2022-12-04 20:02:17","0"),
("75","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164501.4213&NewLine;Array&NewLine;6499312","3","2022-12-04 20:05:01","0"),
("76","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164662.3124&NewLine;Array&NewLine;6499312","3","2022-12-04 20:07:42","0"),
("77","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164665.1079&NewLine;Array&NewLine;6500536","3","2022-12-04 20:07:45","0"),
("78","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670164769.0843&NewLine;Array&NewLine;6499312","3","2022-12-04 20:09:29","0"),
("79","127.0.0.1","/Academy/web/course/create","yii\\base\\InvalidCallException: Setting read-only property: app\\models\\Course::image in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:206
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(322): yii\\base\\Component->__set(\'image\', \'\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Model.php(742): yii\\db\\BaseActiveRecord->__set(\'image\', \'\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Model.php(876): yii\\base\\Model->setAttributes(Array)
#3 C:\\xampp\\htdocs\\Academy\\controllers\\CourseController.php(82): yii\\base\\Model->load(Array)
#4 [internal function]: app\\controllers\\CourseController->actionCreate()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create\', Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/create\', Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#10 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#11 {main}&NewLine;1&NewLine;yii\\base\\InvalidCallException&NewLine;1670164776.3627&NewLine;Array&NewLine;6825944","3","2022-12-04 20:09:36","0"),
("80","127.0.0.1","/Academy/web/course/create","yii\\base\\InvalidCallException: Setting read-only property: app\\models\\Course::image in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:206
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(322): yii\\base\\Component->__set(\'image\', \'\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Model.php(742): yii\\db\\BaseActiveRecord->__set(\'image\', \'\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Model.php(876): yii\\base\\Model->setAttributes(Array)
#3 C:\\xampp\\htdocs\\Academy\\controllers\\CourseController.php(82): yii\\base\\Model->load(Array)
#4 [internal function]: app\\controllers\\CourseController->actionCreate()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'create\', Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/create\', Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#10 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#11 {main}&NewLine;1&NewLine;yii\\base\\InvalidCallException&NewLine;1670164810.1751&NewLine;Array&NewLine;6826536","3","2022-12-04 20:10:10","0"),
("81","127.0.0.1","/Academy/web/course/icons.png?t=H8DC","yii\\base\\InvalidRouteException: Unable to resolve the request: course/icons.png in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php:149
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'icons.png\', Array)
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'course/icons.pn...\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#3 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#4 {main}

Next yii\\web\\NotFoundHttpException: Page not found. in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php:115
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#1 C:\\xampp\\htdocs\\Academy\\web\\index.php(15): yii\\base\\Application->run()
#2 {main}&NewLine;1&NewLine;yii\\web\\HttpException:404&NewLine;1670166538.6542&NewLine;Array&NewLine;6499872","3","2022-12-04 20:38:58","0"),
("82","127.0.0.1","/Academy/web/log/update?id=81","yii\\base\\ViewNotFoundException: The view file does not exist: C:\\xampp\\htdocs\\Academy\\views\\log\\_form.php in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php:233
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#1 C:\\xampp\\htdocs\\Academy\\views\\log\\update.php(18): yii\\base\\View->render(\'_form\', Array)
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'update\', Array, Object(app\\controllers\\LogController))
#6 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(101): yii\\base\\Controller->render(\'update\', Array)
#7 [internal function]: app\\controllers\\LogController->actionUpdate(\'81\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'update\', Array)
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/update\', Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#13 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#14 {main}&NewLine;1&NewLine;yii\\base\\ViewNotFoundException&NewLine;1670167800.3339&NewLine;Array&NewLine;6932840","5","2022-12-04 21:00:00","0"),
("83","127.0.0.1","/Academy/web/log/view?id=82","yii\\base\\UnknownPropertyException: Getting unknown property: yii\\web\\User::role_id in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php(113): yii\\base\\Component->__get(\'role_id\')
#1 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#4 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(63): yii\\base\\View->render(\'sidebar\', Array)
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'<div class=\"log...\')
#9 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(59): yii\\base\\Controller->render(\'view\', Array)
#10 [internal function]: app\\controllers\\LogController->actionView(\'82\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/view\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#16 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#17 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670167984.218&NewLine;Array&NewLine;7790208","5","2022-12-04 21:03:04","0"),
("84","127.0.0.1","/Academy/web/log/view?id=82","yii\\base\\UnknownPropertyException: Getting unknown property: app\\models\\Users::role_id in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:154
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\db\\BaseActiveRecord.php(296): yii\\base\\Component->__get(\'role_id\')
#1 C:\\xampp\\htdocs\\Academy\\views\\layouts\\sidebar.php(113): yii\\db\\BaseActiveRecord->__get(\'role_id\')
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, NULL)
#5 C:\\xampp\\htdocs\\Academy\\views\\layouts\\main.php(63): yii\\base\\View->render(\'sidebar\', Array)
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#7 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(422): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#9 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(408): yii\\base\\Controller->renderContent(\'<div class=\"log...\')
#10 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(59): yii\\base\\Controller->render(\'view\', Array)
#11 [internal function]: app\\controllers\\LogController->actionView(\'82\')
#12 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#14 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'view\', Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/view\', Array)
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#17 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#18 {main}&NewLine;1&NewLine;yii\\base\\UnknownPropertyException&NewLine;1670168008.1938&NewLine;Array&NewLine;7814888","5","2022-12-04 21:03:28","0"),
("86","127.0.0.1","/Academy/web/log/index","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Log::getUrl() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(207): yii\\base\\Component->__call(\'getUrl\', Array)
#1 [internal function]: app\\components\\grid\\TGridView->app\\components\\grid\\{closure}(Object(app\\models\\Log), 85, 0, Object(app\\components\\grid\\TGridView))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(528): call_user_func(Object(Closure), Object(app\\models\\Log), 85, 0, Object(app\\components\\grid\\TGridView))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 85, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(368): yii\\grid\\GridView->renderSection(\'{items}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): app\\components\\grid\\TGridView->renderSection(\'{items}\')
#9 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}{items...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#12 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(235): yii\\grid\\GridView->run()
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): app\\components\\grid\\TGridView->run()
#14 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(72): yii\\base\\Widget::widget(Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#20 [internal function]: app\\controllers\\LogController->actionIndex()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#26 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#27 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670252645.8547&NewLine;Array&NewLine;9292392","1","2022-12-05 20:34:05","0"),
("87","127.0.0.1","/Academy/web/log/index","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Log::getUrl() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(207): yii\\base\\Component->__call(\'getUrl\', Array)
#1 [internal function]: app\\components\\grid\\TGridView->app\\components\\grid\\{closure}(Object(app\\models\\Log), 86, 0, Object(app\\components\\grid\\TGridView))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(528): call_user_func(Object(Closure), Object(app\\models\\Log), 86, 0, Object(app\\components\\grid\\TGridView))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 86, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(368): yii\\grid\\GridView->renderSection(\'{items}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): app\\components\\grid\\TGridView->renderSection(\'{items}\')
#9 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}{items...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#12 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(235): yii\\grid\\GridView->run()
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): app\\components\\grid\\TGridView->run()
#14 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(72): yii\\base\\Widget::widget(Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#20 [internal function]: app\\controllers\\LogController->actionIndex()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#26 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#27 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670252807.7231&NewLine;Array&NewLine;9269560","1","2022-12-05 20:36:47","0"),
("88","127.0.0.1","/Academy/web/log/index","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Log::getUrl() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(207): yii\\base\\Component->__call(\'getUrl\', Array)
#1 [internal function]: app\\components\\grid\\TGridView->app\\components\\grid\\{closure}(Object(app\\models\\Log), 87, 0, Object(app\\components\\grid\\TGridView))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(528): call_user_func(Object(Closure), Object(app\\models\\Log), 87, 0, Object(app\\components\\grid\\TGridView))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 87, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(368): yii\\grid\\GridView->renderSection(\'{items}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): app\\components\\grid\\TGridView->renderSection(\'{items}\')
#9 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}{items...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#12 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(235): yii\\grid\\GridView->run()
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): app\\components\\grid\\TGridView->run()
#14 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(72): yii\\base\\Widget::widget(Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#20 [internal function]: app\\controllers\\LogController->actionIndex()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#26 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#27 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670252840.992&NewLine;Array&NewLine;9293400","1","2022-12-05 20:37:20","0"),
("89","127.0.0.1","/Academy/web/log/index","yii\\base\\UnknownMethodException: Calling unknown method: app\\models\\Log::getUrl() in C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Component.php:300
Stack trace:
#0 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(207): yii\\base\\Component->__call(\'getUrl\', Array)
#1 [internal function]: app\\components\\grid\\TGridView->app\\components\\grid\\{closure}(Object(app\\models\\Log), 88, 0, Object(app\\components\\grid\\TGridView))
#2 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(528): call_user_func(Object(Closure), Object(app\\models\\Log), 88, 0, Object(app\\components\\grid\\TGridView))
#3 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(494): yii\\grid\\GridView->renderTableRow(Object(app\\models\\Log), 88, 0)
#4 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(358): yii\\grid\\GridView->renderTableBody()
#5 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(160): yii\\grid\\GridView->renderItems()
#6 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(326): yii\\widgets\\BaseListView->renderSection(\'{items}\')
#7 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(368): yii\\grid\\GridView->renderSection(\'{items}\')
#8 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(135): app\\components\\grid\\TGridView->renderSection(\'{items}\')
#9 [internal function]: yii\\widgets\\BaseListView->yii\\widgets\\{closure}(Array)
#10 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\widgets\\BaseListView.php(138): preg_replace_callback(\'/{\\\\w+}/\', Object(Closure), \'{summary}{items...\')
#11 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\grid\\GridView.php(301): yii\\widgets\\BaseListView->run()
#12 C:\\xampp\\htdocs\\Academy\\components\\grid\\TGridView.php(235): yii\\grid\\GridView->run()
#13 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Widget.php(146): app\\components\\grid\\TGridView->run()
#14 C:\\xampp\\htdocs\\Academy\\views\\log\\index.php(72): yii\\base\\Widget::widget(Array)
#15 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(347): require(\'C:\\\\xampp\\\\htdocs...\')
#16 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(257): yii\\base\\View->renderPhpFile(\'C:\\\\xampp\\\\htdocs...\', Array)
#17 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\View.php(156): yii\\base\\View->renderFile(\'C:\\\\xampp\\\\htdocs...\', Array, Object(app\\controllers\\LogController))
#18 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(407): yii\\base\\View->render(\'index\', Array, Object(app\\controllers\\LogController))
#19 C:\\xampp\\htdocs\\Academy\\controllers\\LogController.php(46): yii\\base\\Controller->render(\'index\', Array)
#20 [internal function]: app\\controllers\\LogController->actionIndex()
#21 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(57): call_user_func_array(Array, Array)
#22 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Controller.php(178): yii\\base\\InlineAction->runWithParams(Array)
#23 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Module.php(552): yii\\base\\Controller->runAction(\'index\', Array)
#24 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\web\\Application.php(103): yii\\base\\Module->runAction(\'log/index\', Array)
#25 C:\\xampp\\htdocs\\Academy\\vendor\\yiisoft\\yii2\\base\\Application.php(384): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))
#26 C:\\xampp\\htdocs\\Academy\\web\\index.php(18): yii\\base\\Application->run()
#27 {main}&NewLine;1&NewLine;yii\\base\\UnknownMethodException&NewLine;1670252841.9276&NewLine;Array&NewLine;9294424","1","2022-12-05 20:37:21","0");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_message` (`id`,`message`,`user_id`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","esdrftghjkl;","1","2022-11-20 18:08:22","2","2022-11-20 18:08:22"),
("2","wesrtlk;.,nkguhjbhjbrxdfvhn ftftgfcv xdftgbnxdrfg bgvg","2","2022-11-20 18:08:44","1","2022-11-20 18:08:44"),
("3","Afnatjathafhqru5wnafhsthc af ar arbadbarbCjafjatsjafjwt","1","2022-12-03 14:58:43","2","2022-12-03 14:58:43"),
("4","Yo","1","2022-12-04 17:36:05","3","2022-12-04 17:36:05"),
("5","hey","1","2022-12-04 17:40:15","3","2022-12-04 17:40:15"),
("6","Sup","3","2022-12-04 17:40:36","1","2022-12-04 17:40:36"),
("7","ldkxmclkmscx","7","2022-12-05 22:11:00","1","2022-12-05 22:11:00"),
("8","ldkxmclkmscx","7","2022-12-05 22:11:01","1","2022-12-05 22:11:01"),
("9","lsdkmsclkdc","3","2022-12-05 22:11:05","1","2022-12-05 22:11:05"),
("10","slkdslkdc","3","2022-12-05 22:11:08","1","2022-12-05 22:11:08"),
("11","ghjk","3","2022-12-11 14:05:17","1","2022-12-11 14:05:17");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_notification` (`id`,`title`,`type_id`,`state_id`,`to_user_id`,`model`,`model_id`,`icon`,`created_on`,`created_by_id`) VALUES
("1","Updated : Admin","3","1","1","app\\models\\Users","1","user","2022-11-19 09:34:23","1"),
("2","Followed by Admin","1","1","1","app\\models\\Follow","1","users","2022-11-19 09:41:33","1"),
("3","New Post","1","1","1","app\\models\\Feed","2","feed","2022-11-20 08:47:00","1"),
("4","New Manager","1","1","1","app\\models\\Users","2","user","2022-11-20 15:59:15","1"),
("5","New Manager","1","1","2","app\\models\\Users","2","user","2022-11-20 15:59:15","1"),
("6","Welcome","4","1","2","app\\models\\Users","2","user","2022-11-20 15:59:15","1"),
("7","Followed by Dev","1","1","1","app\\models\\Follow","1","users","2022-11-20 18:07:36","2"),
("8","New Trainer","1","1","1","app\\models\\Users","3","user","2022-11-29 11:18:43","1"),
("9","New Trainer","1","1","2","app\\models\\Users","3","user","2022-11-29 11:18:43","1"),
("10","New Trainer","1","1","3","app\\models\\Users","3","user","2022-11-29 11:18:43","1"),
("11","Welcome","4","1","3","app\\models\\Users","3","user","2022-11-29 11:18:43","1"),
("12","Updated social link","3","1","3","app\\models\\SocialLink","5","share-alt","2022-11-29 11:29:41","1"),
("13","Updated social link","3","1","3","app\\models\\SocialLink","6","share-alt","2022-11-29 11:29:41","1"),
("14","Updated social link","3","1","3","app\\models\\SocialLink","7","share-alt","2022-11-29 11:29:41","1"),
("15","Updated social link","3","1","3","app\\models\\SocialLink","8","share-alt","2022-11-29 11:29:41","1"),
("16","Updated social link","3","1","3","app\\models\\SocialLink","9","share-alt","2022-11-29 11:29:41","1"),
("17","New Trainer","1","1","1","app\\models\\Users","4","user","2022-12-03 14:36:37","1"),
("18","New Trainer","1","1","2","app\\models\\Users","4","user","2022-12-03 14:36:37","1"),
("19","New Trainer","1","1","3","app\\models\\Users","4","user","2022-12-03 14:36:37","1"),
("20","New Trainer","1","1","4","app\\models\\Users","4","user","2022-12-03 14:36:37","1"),
("21","Welcome","4","1","4","app\\models\\Users","4","user","2022-12-03 14:36:37","1"),
("22","Followed by Admin","1","1","4","app\\models\\Follow","4","users","2022-12-03 14:42:28","1"),
("23","Updated : Trainer","3","1","3","app\\models\\Users","3","user","2022-12-03 17:11:34","1"),
("24","Followed by Admin","1","1","1","app\\models\\Follow","1","users","2022-12-03 17:12:52","1"),
("25","Followed by Admin","1","1","2","app\\models\\Follow","2","users","2022-12-03 17:12:54","1"),
("26","Followed by Admin","1","1","3","app\\models\\Follow","3","users","2022-12-03 17:12:56","1"),
("27","Followed by Admin","1","1","4","app\\models\\Follow","4","users","2022-12-03 17:12:59","1"),
("28","Updated : student","3","1","4","app\\models\\Users","4","user","2022-12-03 22:50:40","1"),
("29","Updated : student","3","1","4","app\\models\\Users","4","user","2022-12-03 22:53:34","1"),
("30","Updated : Admin","3","1","1","app\\models\\Users","1","user","2022-12-03 22:55:55","1"),
("31","Updated : Admin","3","1","1","app\\models\\Users","1","user","2022-12-03 23:02:01","1"),
("32","Updated : Dev","3","1","2","app\\models\\Users","2","user","2022-12-04 17:59:09","1"),
("33","Updated : Developer","3","1","2","app\\models\\Users","2","user","2022-12-04 19:11:04","1"),
("34","Updated : Admin","3","1","1","app\\models\\Users","1","user","2022-12-04 19:12:43","1"),
("35","Updated : Trainer","3","1","3","app\\models\\Users","3","user","2022-12-04 19:17:15","1"),
("36","Updated : student","3","1","4","app\\models\\Users","4","user","2022-12-04 19:17:37","1"),
("37","Updated : Developer","3","1","2","app\\models\\Users","2","user","2022-12-04 19:17:54","1"),
("38","Updated : Student","3","1","4","app\\models\\Users","4","user","2022-12-04 19:18:17","1"),
("39","Followed by Developer","1","1","1","app\\models\\Follow","1","users","2022-12-04 19:31:02","2"),
("40","Followed by Developer","1","1","3","app\\models\\Follow","3","users","2022-12-04 19:31:05","2"),
("41","Followed by Student","1","1","1","app\\models\\Follow","1","users","2022-12-04 19:31:28","4"),
("42","Followed by Student","1","1","3","app\\models\\Follow","3","users","2022-12-04 19:31:31","4"),
("43","Followed by Student","1","1","4","app\\models\\Follow","4","users","2022-12-04 19:31:33","4"),
("44","Followed by Trainer","1","1","1","app\\models\\Follow","1","users","2022-12-04 19:31:57","3"),
("45","Followed by Trainer","1","1","2","app\\models\\Follow","2","users","2022-12-04 19:31:58","3"),
("46","Followed by Trainer","1","1","4","app\\models\\Follow","4","users","2022-12-04 19:32:00","3"),
("47","Followed by Trainer","1","1","3","app\\models\\Follow","3","users","2022-12-04 19:32:02","3"),
("48","New Manager","1","1","1","app\\models\\Users","5","user","2022-12-04 20:15:57","1"),
("49","New Manager","1","1","2","app\\models\\Users","5","user","2022-12-04 20:15:57","1"),
("50","New Manager","1","1","3","app\\models\\Users","5","user","2022-12-04 20:15:57","1"),
("51","New Manager","1","1","5","app\\models\\Users","5","user","2022-12-04 20:15:57","1"),
("52","Welcome","4","1","5","app\\models\\Users","5","user","2022-12-04 20:15:57","1"),
("53","New Post","1","1","1","app\\models\\Feed","2","feed","2022-12-04 20:17:53","3"),
("54","New Post","1","1","2","app\\models\\Feed","2","feed","2022-12-04 20:17:53","3"),
("55","New Post","1","1","4","app\\models\\Feed","2","feed","2022-12-04 20:17:53","3"),
("56","New Post","1","1","3","app\\models\\Feed","2","feed","2022-12-04 20:17:53","3"),
("57","New Post","1","1","1","app\\models\\Feed","3","feed","2022-12-04 20:21:07","3"),
("58","New Post","1","1","2","app\\models\\Feed","3","feed","2022-12-04 20:21:07","3"),
("59","New Post","1","1","4","app\\models\\Feed","3","feed","2022-12-04 20:21:07","3"),
("60","New Post","1","1","3","app\\models\\Feed","3","feed","2022-12-04 20:21:07","3"),
("61","New Post","1","1","2","app\\models\\Feed","4","feed","2022-12-04 20:25:34","1"),
("62","New Post","1","1","4","app\\models\\Feed","4","feed","2022-12-04 20:25:34","1"),
("63","New Post","1","1","3","app\\models\\Feed","4","feed","2022-12-04 20:25:34","1"),
("64","Followed by samaxof","1","1","3","app\\models\\Follow","3","users","2022-12-04 20:59:18","5"),
("65","Followed by samaxof","1","1","4","app\\models\\Follow","4","users","2022-12-04 20:59:22","5"),
("66","Followed by samaxof","1","1","4","app\\models\\Follow","4","users","2022-12-04 20:59:26","5"),
("67","Followed by samaxof","1","1","5","app\\models\\Follow","5","users","2022-12-04 20:59:31","5"),
("68","Updated : samaxof","3","1","5","app\\models\\Users","5","user","2022-12-04 21:05:13","5"),
("69","New Manager","1","1","1","app\\models\\Users","6","user","2022-12-05 21:34:21","1"),
("70","New Manager","1","1","2","app\\models\\Users","6","user","2022-12-05 21:34:21","1"),
("71","New Manager","1","1","3","app\\models\\Users","6","user","2022-12-05 21:34:21","1"),
("72","New Manager","1","1","6","app\\models\\Users","6","user","2022-12-05 21:34:21","1"),
("73","Welcome","4","1","6","app\\models\\Users","6","user","2022-12-05 21:34:21","1"),
("74","New Trainer","1","1","1","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("75","New Trainer","1","1","2","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("76","New Trainer","1","1","3","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("77","New Trainer","1","1","6","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("78","New Trainer","1","1","7","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("79","Welcome","4","1","7","app\\models\\Users","7","user","2022-12-05 21:34:36","1"),
("80","New Trainer","1","1","1","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("81","New Trainer","1","1","2","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("82","New Trainer","1","1","3","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("83","New Trainer","1","1","6","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("84","New Trainer","1","1","7","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("85","New Trainer","1","1","8","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("86","Welcome","4","1","8","app\\models\\Users","8","user","2022-12-05 21:34:45","1"),
("87","New Student","1","1","1","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("88","New Student","1","1","2","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("89","New Student","1","1","3","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("90","New Student","1","1","6","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("91","New Student","1","1","7","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("92","New Student","1","1","8","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("93","Welcome","4","1","9","app\\models\\Users","9","user","2022-12-05 21:35:02","1"),
("94","New Admin","1","1","1","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("95","New Admin","1","1","2","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("96","New Admin","1","1","3","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("97","New Admin","1","1","6","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("98","New Admin","1","1","7","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("99","New Admin","1","1","8","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("100","New Admin","1","1","10","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("101","Welcome","4","1","10","app\\models\\Users","10","user","2022-12-05 21:35:40","1"),
("102","New Admin","1","1","1","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("103","New Admin","1","1","2","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("104","New Admin","1","1","3","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("105","New Admin","1","1","6","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("106","New Admin","1","1","7","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("107","New Admin","1","1","8","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("108","New Admin","1","1","10","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("109","New Admin","1","1","11","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("110","Welcome","4","1","11","app\\models\\Users","11","user","2022-12-05 21:36:05","1"),
("111","New Admin","1","1","1","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("112","New Admin","1","1","2","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("113","New Admin","1","1","3","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("114","New Admin","1","1","6","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("115","New Admin","1","1","7","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("116","New Admin","1","1","8","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("117","New Admin","1","1","10","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("118","New Admin","1","1","11","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("119","New Admin","1","1","12","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("120","Welcome","4","1","12","app\\models\\Users","12","user","2022-12-05 21:36:20","1"),
("121","New Student","1","1","1","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("122","New Student","1","1","2","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("123","New Student","1","1","3","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("124","New Student","1","1","6","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("125","New Student","1","1","7","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("126","New Student","1","1","8","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("127","New Student","1","1","10","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("128","New Student","1","1","11","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("129","New Student","1","1","12","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("130","Welcome","4","1","13","app\\models\\Users","13","user","2022-12-05 21:36:44","1"),
("131","New Student","1","1","1","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("132","New Student","1","1","2","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("133","New Student","1","1","3","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("134","New Student","1","1","6","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("135","New Student","1","1","7","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("136","New Student","1","1","8","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("137","New Student","1","1","10","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("138","New Student","1","1","11","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("139","New Student","1","1","12","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("140","Welcome","4","1","14","app\\models\\Users","14","user","2022-12-05 21:37:03","1"),
("141","New Trainer","1","1","1","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("142","New Trainer","1","1","2","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("143","New Trainer","1","1","3","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("144","New Trainer","1","1","6","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("145","New Trainer","1","1","7","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("146","New Trainer","1","1","8","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("147","New Trainer","1","1","10","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("148","New Trainer","1","1","11","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("149","New Trainer","1","1","12","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("150","New Trainer","1","1","15","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("151","Welcome","4","1","15","app\\models\\Users","15","user","2022-12-05 21:37:17","1"),
("152","New Trainer","1","1","1","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("153","New Trainer","1","1","2","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("154","New Trainer","1","1","3","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("155","New Trainer","1","1","6","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("156","New Trainer","1","1","7","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("157","New Trainer","1","1","8","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("158","New Trainer","1","1","10","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("159","New Trainer","1","1","11","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("160","New Trainer","1","1","12","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("161","New Trainer","1","1","15","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("162","New Trainer","1","1","16","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("163","Welcome","4","1","16","app\\models\\Users","16","user","2022-12-05 21:38:00","1"),
("164","New Student","1","1","1","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("165","New Student","1","1","2","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("166","New Student","1","1","3","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("167","New Student","1","1","6","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("168","New Student","1","1","7","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("169","New Student","1","1","8","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("170","New Student","1","1","10","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("171","New Student","1","1","11","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("172","New Student","1","1","12","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("173","New Student","1","1","15","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("174","New Student","1","1","16","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("175","Welcome","4","1","17","app\\models\\Users","17","user","2022-12-05 21:38:07","1"),
("176","New Student","1","1","1","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("177","New Student","1","1","2","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("178","New Student","1","1","3","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("179","New Student","1","1","6","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("180","New Student","1","1","7","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("181","New Student","1","1","8","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("182","New Student","1","1","10","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("183","New Student","1","1","11","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("184","New Student","1","1","12","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("185","New Student","1","1","15","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("186","New Student","1","1","16","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("187","Welcome","4","1","18","app\\models\\Users","18","user","2022-12-05 21:38:22","1"),
("188","New Admin","1","1","1","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("189","New Admin","1","1","2","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("190","New Admin","1","1","3","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("191","New Admin","1","1","6","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("192","New Admin","1","1","7","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("193","New Admin","1","1","8","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("194","New Admin","1","1","10","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("195","New Admin","1","1","11","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("196","New Admin","1","1","12","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("197","New Admin","1","1","15","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("198","New Admin","1","1","16","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("199","New Admin","1","1","19","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("200","Welcome","4","1","19","app\\models\\Users","19","user","2022-12-05 21:38:31","1"),
("201","New Manager","1","1","1","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("202","New Manager","1","1","2","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("203","New Manager","1","1","3","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("204","New Manager","1","1","6","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("205","New Manager","1","1","7","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("206","New Manager","1","1","8","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("207","New Manager","1","1","10","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("208","New Manager","1","1","11","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("209","New Manager","1","1","12","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("210","New Manager","1","1","15","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("211","New Manager","1","1","16","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("212","New Manager","1","1","19","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("213","New Manager","1","1","20","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("214","Welcome","4","1","20","app\\models\\Users","20","user","2022-12-05 21:38:43","1"),
("215","New Trainer","1","1","1","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("216","New Trainer","1","1","2","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("217","New Trainer","1","1","3","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("218","New Trainer","1","1","6","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("219","New Trainer","1","1","7","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("220","New Trainer","1","1","8","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("221","New Trainer","1","1","10","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("222","New Trainer","1","1","11","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("223","New Trainer","1","1","12","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("224","New Trainer","1","1","15","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("225","New Trainer","1","1","16","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("226","New Trainer","1","1","19","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("227","New Trainer","1","1","20","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("228","New Trainer","1","1","21","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("229","Welcome","4","1","21","app\\models\\Users","21","user","2022-12-05 21:38:57","1"),
("230","New Manager","1","1","1","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("231","New Manager","1","1","2","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("232","New Manager","1","1","3","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("233","New Manager","1","1","6","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("234","New Manager","1","1","7","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("235","New Manager","1","1","8","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("236","New Manager","1","1","10","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("237","New Manager","1","1","11","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("238","New Manager","1","1","12","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("239","New Manager","1","1","15","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("240","New Manager","1","1","16","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("241","New Manager","1","1","19","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("242","New Manager","1","1","20","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("243","New Manager","1","1","21","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("244","New Manager","1","1","22","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("245","Welcome","4","1","22","app\\models\\Users","22","user","2022-12-05 21:39:07","1"),
("246","New Admin","1","1","1","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("247","New Admin","1","1","2","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("248","New Admin","1","1","3","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("249","New Admin","1","1","6","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("250","New Admin","1","1","7","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("251","New Admin","1","1","8","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("252","New Admin","1","1","10","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("253","New Admin","1","1","11","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("254","New Admin","1","1","12","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("255","New Admin","1","1","15","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("256","New Admin","1","1","16","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("257","New Admin","1","1","19","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("258","New Admin","1","1","20","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("259","New Admin","1","1","21","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("260","New Admin","1","1","22","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("261","New Admin","1","1","23","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("262","Welcome","4","1","23","app\\models\\Users","23","user","2022-12-05 21:39:20","1"),
("263","New Trainer","1","1","1","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("264","New Trainer","1","1","2","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("265","New Trainer","1","1","3","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("266","New Trainer","1","1","6","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("267","New Trainer","1","1","7","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("268","New Trainer","1","1","8","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("269","New Trainer","1","1","10","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("270","New Trainer","1","1","11","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("271","New Trainer","1","1","12","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("272","New Trainer","1","1","15","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("273","New Trainer","1","1","16","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("274","New Trainer","1","1","19","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("275","New Trainer","1","1","20","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("276","New Trainer","1","1","21","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("277","New Trainer","1","1","22","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("278","New Trainer","1","1","23","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("279","New Trainer","1","1","24","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("280","Welcome","4","1","24","app\\models\\Users","24","user","2022-12-05 21:39:51","1"),
("281","New Manager","1","1","1","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("282","New Manager","1","1","2","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("283","New Manager","1","1","3","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("284","New Manager","1","1","6","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("285","New Manager","1","1","7","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("286","New Manager","1","1","8","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("287","New Manager","1","1","10","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("288","New Manager","1","1","11","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("289","New Manager","1","1","12","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("290","New Manager","1","1","15","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("291","New Manager","1","1","16","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("292","New Manager","1","1","19","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("293","New Manager","1","1","20","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("294","New Manager","1","1","21","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("295","New Manager","1","1","22","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("296","New Manager","1","1","23","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("297","New Manager","1","1","24","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("298","New Manager","1","1","25","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("299","Welcome","4","1","25","app\\models\\Users","25","user","2022-12-05 21:40:19","1"),
("300","New Admin","1","1","1","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("301","New Admin","1","1","2","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("302","New Admin","1","1","3","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("303","New Admin","1","1","6","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("304","New Admin","1","1","7","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("305","New Admin","1","1","8","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("306","New Admin","1","1","10","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("307","New Admin","1","1","11","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("308","New Admin","1","1","12","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("309","New Admin","1","1","15","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("310","New Admin","1","1","16","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("311","New Admin","1","1","19","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("312","New Admin","1","1","20","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("313","New Admin","1","1","21","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("314","New Admin","1","1","22","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("315","New Admin","1","1","23","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("316","New Admin","1","1","24","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("317","New Admin","1","1","25","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("318","New Admin","1","1","26","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("319","Welcome","4","1","26","app\\models\\Users","26","user","2022-12-05 21:42:24","1"),
("320","Updated : xyqyh","3","1","19","app\\models\\Users","19","user","2022-12-05 21:46:18","1"),
("321","Updated : tabudipor","3","1","11","app\\models\\Users","11","user","2022-12-05 21:46:41","1"),
("322","New Manager","1","1","1","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("323","New Manager","1","1","2","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("324","New Manager","1","1","3","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("325","New Manager","1","1","6","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("326","New Manager","1","1","7","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("327","New Manager","1","1","8","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("328","New Manager","1","1","10","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("329","New Manager","1","1","12","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("330","New Manager","1","1","15","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("331","New Manager","1","1","16","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("332","New Manager","1","1","19","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("333","New Manager","1","1","20","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("334","New Manager","1","1","21","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("335","New Manager","1","1","22","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("336","New Manager","1","1","23","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("337","New Manager","1","1","24","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("338","New Manager","1","1","25","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("339","New Manager","1","1","26","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("340","New Manager","1","1","27","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("341","Welcome","4","1","27","app\\models\\Users","27","user","2022-12-05 22:00:37","1"),
("342","New Trainer","1","1","1","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("343","New Trainer","1","1","2","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("344","New Trainer","1","1","3","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("345","New Trainer","1","1","6","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("346","New Trainer","1","1","7","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("347","New Trainer","1","1","8","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("348","New Trainer","1","1","10","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("349","New Trainer","1","1","12","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("350","New Trainer","1","1","15","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("351","New Trainer","1","1","16","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("352","New Trainer","1","1","19","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("353","New Trainer","1","1","20","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("354","New Trainer","1","1","21","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("355","New Trainer","1","1","22","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("356","New Trainer","1","1","23","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("357","New Trainer","1","1","24","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("358","New Trainer","1","1","25","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("359","New Trainer","1","1","26","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("360","New Trainer","1","1","27","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("361","New Trainer","1","1","28","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("362","Welcome","4","1","28","app\\models\\Users","28","user","2022-12-05 22:00:52","1"),
("363","New Trainer","1","1","1","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("364","New Trainer","1","1","2","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("365","New Trainer","1","1","3","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("366","New Trainer","1","1","6","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("367","New Trainer","1","1","7","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("368","New Trainer","1","1","8","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("369","New Trainer","1","1","10","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("370","New Trainer","1","1","12","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("371","New Trainer","1","1","15","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("372","New Trainer","1","1","16","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("373","New Trainer","1","1","19","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("374","New Trainer","1","1","20","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("375","New Trainer","1","1","21","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("376","New Trainer","1","1","22","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("377","New Trainer","1","1","23","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("378","New Trainer","1","1","24","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("379","New Trainer","1","1","25","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("380","New Trainer","1","1","26","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("381","New Trainer","1","1","27","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("382","New Trainer","1","1","28","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("383","New Trainer","1","1","29","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("384","Welcome","4","1","29","app\\models\\Users","29","user","2022-12-05 22:01:02","1"),
("385","New Manager","1","1","1","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("386","New Manager","1","1","2","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("387","New Manager","1","1","3","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("388","New Manager","1","1","6","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("389","New Manager","1","1","7","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("390","New Manager","1","1","8","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("391","New Manager","1","1","10","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("392","New Manager","1","1","12","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("393","New Manager","1","1","15","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("394","New Manager","1","1","16","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("395","New Manager","1","1","19","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("396","New Manager","1","1","20","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("397","New Manager","1","1","21","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("398","New Manager","1","1","22","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("399","New Manager","1","1","23","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("400","New Manager","1","1","24","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("401","New Manager","1","1","25","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("402","New Manager","1","1","26","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("403","New Manager","1","1","27","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("404","New Manager","1","1","28","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("405","New Manager","1","1","29","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("406","New Manager","1","1","30","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("407","Welcome","4","1","30","app\\models\\Users","30","user","2022-12-05 22:01:13","1"),
("408","New Admin","1","1","1","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("409","New Admin","1","1","2","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("410","New Admin","1","1","3","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("411","New Admin","1","1","6","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("412","New Admin","1","1","7","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("413","New Admin","1","1","8","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("414","New Admin","1","1","10","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("415","New Admin","1","1","12","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("416","New Admin","1","1","15","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("417","New Admin","1","1","16","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("418","New Admin","1","1","19","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("419","New Admin","1","1","20","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("420","New Admin","1","1","21","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("421","New Admin","1","1","22","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("422","New Admin","1","1","23","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("423","New Admin","1","1","24","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("424","New Admin","1","1","25","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("425","New Admin","1","1","26","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("426","New Admin","1","1","27","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("427","New Admin","1","1","28","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("428","New Admin","1","1","29","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("429","New Admin","1","1","30","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("430","New Admin","1","1","31","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("431","Welcome","4","1","31","app\\models\\Users","31","user","2022-12-05 22:01:15","1"),
("432","New Trainer","1","1","1","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("433","New Trainer","1","1","2","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("434","New Trainer","1","1","3","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("435","New Trainer","1","1","6","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("436","New Trainer","1","1","7","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("437","New Trainer","1","1","8","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("438","New Trainer","1","1","10","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("439","New Trainer","1","1","12","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("440","New Trainer","1","1","15","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("441","New Trainer","1","1","16","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("442","New Trainer","1","1","19","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("443","New Trainer","1","1","20","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("444","New Trainer","1","1","21","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("445","New Trainer","1","1","22","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("446","New Trainer","1","1","23","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("447","New Trainer","1","1","24","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("448","New Trainer","1","1","25","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("449","New Trainer","1","1","26","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("450","New Trainer","1","1","27","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("451","New Trainer","1","1","28","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("452","New Trainer","1","1","29","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("453","New Trainer","1","1","30","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("454","New Trainer","1","1","31","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("455","New Trainer","1","1","32","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("456","Welcome","4","1","32","app\\models\\Users","32","user","2022-12-05 22:01:24","1"),
("457","New Manager","1","1","1","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("458","New Manager","1","1","2","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("459","New Manager","1","1","3","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("460","New Manager","1","1","6","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("461","New Manager","1","1","7","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("462","New Manager","1","1","8","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("463","New Manager","1","1","10","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("464","New Manager","1","1","12","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("465","New Manager","1","1","15","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("466","New Manager","1","1","16","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("467","New Manager","1","1","19","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("468","New Manager","1","1","20","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("469","New Manager","1","1","21","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("470","New Manager","1","1","22","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("471","New Manager","1","1","23","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("472","New Manager","1","1","24","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("473","New Manager","1","1","25","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("474","New Manager","1","1","26","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("475","New Manager","1","1","27","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("476","New Manager","1","1","28","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("477","New Manager","1","1","29","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("478","New Manager","1","1","30","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("479","New Manager","1","1","31","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("480","New Manager","1","1","32","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("481","New Manager","1","1","33","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("482","Welcome","4","1","33","app\\models\\Users","33","user","2022-12-05 22:01:28","1"),
("483","New Student","1","1","1","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("484","New Student","1","1","2","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("485","New Student","1","1","3","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("486","New Student","1","1","6","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("487","New Student","1","1","7","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("488","New Student","1","1","8","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("489","New Student","1","1","10","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("490","New Student","1","1","12","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("491","New Student","1","1","15","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("492","New Student","1","1","16","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("493","New Student","1","1","19","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("494","New Student","1","1","20","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("495","New Student","1","1","21","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("496","New Student","1","1","22","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("497","New Student","1","1","23","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("498","New Student","1","1","24","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("499","New Student","1","1","25","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("500","New Student","1","1","26","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("501","New Student","1","1","27","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("502","New Student","1","1","28","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("503","New Student","1","1","29","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("504","New Student","1","1","30","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("505","New Student","1","1","31","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("506","New Student","1","1","32","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("507","New Student","1","1","33","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("508","Welcome","4","1","34","app\\models\\Users","34","user","2022-12-05 22:01:38","1"),
("509","New Trainer","1","1","1","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("510","New Trainer","1","1","2","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("511","New Trainer","1","1","3","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("512","New Trainer","1","1","6","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("513","New Trainer","1","1","7","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("514","New Trainer","1","1","8","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("515","New Trainer","1","1","10","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("516","New Trainer","1","1","12","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("517","New Trainer","1","1","15","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("518","New Trainer","1","1","16","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("519","New Trainer","1","1","19","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("520","New Trainer","1","1","20","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("521","New Trainer","1","1","21","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("522","New Trainer","1","1","22","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("523","New Trainer","1","1","23","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("524","New Trainer","1","1","24","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("525","New Trainer","1","1","25","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("526","New Trainer","1","1","26","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("527","New Trainer","1","1","27","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("528","New Trainer","1","1","28","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("529","New Trainer","1","1","29","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("530","New Trainer","1","1","30","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("531","New Trainer","1","1","31","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("532","New Trainer","1","1","32","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("533","New Trainer","1","1","33","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("534","New Trainer","1","1","35","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("535","Welcome","4","1","35","app\\models\\Users","35","user","2022-12-05 22:01:47","1"),
("536","New Manager","1","1","1","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("537","New Manager","1","1","2","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("538","New Manager","1","1","3","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("539","New Manager","1","1","6","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("540","New Manager","1","1","7","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("541","New Manager","1","1","8","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("542","New Manager","1","1","10","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("543","New Manager","1","1","12","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("544","New Manager","1","1","15","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("545","New Manager","1","1","16","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("546","New Manager","1","1","19","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("547","New Manager","1","1","20","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("548","New Manager","1","1","21","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("549","New Manager","1","1","22","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("550","New Manager","1","1","23","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("551","New Manager","1","1","24","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("552","New Manager","1","1","25","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("553","New Manager","1","1","26","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("554","New Manager","1","1","27","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("555","New Manager","1","1","28","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("556","New Manager","1","1","29","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("557","New Manager","1","1","30","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("558","New Manager","1","1","31","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("559","New Manager","1","1","32","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("560","New Manager","1","1","33","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("561","New Manager","1","1","35","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("562","New Manager","1","1","36","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("563","Welcome","4","1","36","app\\models\\Users","36","user","2022-12-05 22:01:56","1"),
("564","New Admin","1","1","1","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("565","New Admin","1","1","2","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("566","New Admin","1","1","3","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("567","New Admin","1","1","6","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("568","New Admin","1","1","7","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("569","New Admin","1","1","8","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("570","New Admin","1","1","10","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("571","New Admin","1","1","12","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("572","New Admin","1","1","15","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("573","New Admin","1","1","16","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("574","New Admin","1","1","19","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("575","New Admin","1","1","20","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("576","New Admin","1","1","21","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("577","New Admin","1","1","22","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("578","New Admin","1","1","23","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("579","New Admin","1","1","24","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("580","New Admin","1","1","25","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("581","New Admin","1","1","26","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("582","New Admin","1","1","27","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("583","New Admin","1","1","28","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("584","New Admin","1","1","29","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("585","New Admin","1","1","30","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("586","New Admin","1","1","31","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("587","New Admin","1","1","32","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("588","New Admin","1","1","33","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("589","New Admin","1","1","35","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("590","New Admin","1","1","36","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("591","New Admin","1","1","37","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("592","Welcome","4","1","37","app\\models\\Users","37","user","2022-12-05 22:02:04","1"),
("593","New Student","1","1","1","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("594","New Student","1","1","2","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("595","New Student","1","1","3","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("596","New Student","1","1","6","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("597","New Student","1","1","7","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("598","New Student","1","1","8","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("599","New Student","1","1","10","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("600","New Student","1","1","12","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("601","New Student","1","1","15","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("602","New Student","1","1","16","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("603","New Student","1","1","19","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("604","New Student","1","1","20","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("605","New Student","1","1","21","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("606","New Student","1","1","22","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("607","New Student","1","1","23","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("608","New Student","1","1","24","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("609","New Student","1","1","25","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("610","New Student","1","1","26","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("611","New Student","1","1","27","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("612","New Student","1","1","28","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("613","New Student","1","1","29","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("614","New Student","1","1","30","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("615","New Student","1","1","31","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("616","New Student","1","1","32","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("617","New Student","1","1","33","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("618","New Student","1","1","35","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("619","New Student","1","1","36","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("620","New Student","1","1","37","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("621","Welcome","4","1","38","app\\models\\Users","38","user","2022-12-05 22:02:18","1"),
("622","New Manager","1","1","1","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("623","New Manager","1","1","2","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("624","New Manager","1","1","3","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("625","New Manager","1","1","6","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("626","New Manager","1","1","7","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("627","New Manager","1","1","8","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("628","New Manager","1","1","10","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("629","New Manager","1","1","12","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("630","New Manager","1","1","15","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("631","New Manager","1","1","16","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("632","New Manager","1","1","19","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("633","New Manager","1","1","20","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("634","New Manager","1","1","21","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("635","New Manager","1","1","22","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("636","New Manager","1","1","23","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("637","New Manager","1","1","24","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("638","New Manager","1","1","25","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("639","New Manager","1","1","26","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("640","New Manager","1","1","27","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("641","New Manager","1","1","28","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("642","New Manager","1","1","29","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("643","New Manager","1","1","30","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("644","New Manager","1","1","31","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("645","New Manager","1","1","32","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("646","New Manager","1","1","33","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("647","New Manager","1","1","35","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("648","New Manager","1","1","36","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("649","New Manager","1","1","37","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("650","New Manager","1","1","39","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("651","Welcome","4","1","39","app\\models\\Users","39","user","2022-12-05 22:02:26","1"),
("652","New Manager","1","1","1","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("653","New Manager","1","1","2","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("654","New Manager","1","1","3","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("655","New Manager","1","1","6","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("656","New Manager","1","1","7","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("657","New Manager","1","1","8","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("658","New Manager","1","1","10","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("659","New Manager","1","1","12","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("660","New Manager","1","1","15","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("661","New Manager","1","1","16","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("662","New Manager","1","1","19","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("663","New Manager","1","1","20","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("664","New Manager","1","1","21","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("665","New Manager","1","1","22","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("666","New Manager","1","1","23","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("667","New Manager","1","1","24","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("668","New Manager","1","1","25","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("669","New Manager","1","1","26","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("670","New Manager","1","1","27","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("671","New Manager","1","1","28","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("672","New Manager","1","1","29","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("673","New Manager","1","1","30","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("674","New Manager","1","1","31","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("675","New Manager","1","1","32","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("676","New Manager","1","1","33","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("677","New Manager","1","1","35","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("678","New Manager","1","1","36","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("679","New Manager","1","1","37","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("680","New Manager","1","1","39","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("681","New Manager","1","1","40","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("682","Welcome","4","1","40","app\\models\\Users","40","user","2022-12-05 22:02:34","1"),
("683","New Trainer","1","1","1","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("684","New Trainer","1","1","2","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("685","New Trainer","1","1","3","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("686","New Trainer","1","1","6","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("687","New Trainer","1","1","7","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("688","New Trainer","1","1","8","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("689","New Trainer","1","1","10","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("690","New Trainer","1","1","12","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("691","New Trainer","1","1","15","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("692","New Trainer","1","1","16","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("693","New Trainer","1","1","19","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("694","New Trainer","1","1","20","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("695","New Trainer","1","1","21","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("696","New Trainer","1","1","22","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("697","New Trainer","1","1","23","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("698","New Trainer","1","1","24","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("699","New Trainer","1","1","25","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("700","New Trainer","1","1","26","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("701","New Trainer","1","1","27","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("702","New Trainer","1","1","28","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("703","New Trainer","1","1","29","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("704","New Trainer","1","1","30","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("705","New Trainer","1","1","31","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("706","New Trainer","1","1","32","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("707","New Trainer","1","1","33","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("708","New Trainer","1","1","35","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("709","New Trainer","1","1","36","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("710","New Trainer","1","1","37","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("711","New Trainer","1","1","39","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("712","New Trainer","1","1","40","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("713","New Trainer","1","1","41","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("714","Welcome","4","1","41","app\\models\\Users","41","user","2022-12-05 22:02:42","1"),
("715","New Student","1","1","1","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("716","New Student","1","1","2","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("717","New Student","1","1","3","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("718","New Student","1","1","6","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("719","New Student","1","1","7","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("720","New Student","1","1","8","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("721","New Student","1","1","10","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("722","New Student","1","1","12","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("723","New Student","1","1","15","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("724","New Student","1","1","16","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("725","New Student","1","1","19","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("726","New Student","1","1","20","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("727","New Student","1","1","21","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("728","New Student","1","1","22","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("729","New Student","1","1","23","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("730","New Student","1","1","24","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("731","New Student","1","1","25","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("732","New Student","1","1","26","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("733","New Student","1","1","27","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("734","New Student","1","1","28","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("735","New Student","1","1","29","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("736","New Student","1","1","30","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("737","New Student","1","1","31","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("738","New Student","1","1","32","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("739","New Student","1","1","33","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("740","New Student","1","1","35","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("741","New Student","1","1","36","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("742","New Student","1","1","37","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("743","New Student","1","1","39","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("744","New Student","1","1","40","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("745","New Student","1","1","41","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("746","Welcome","4","1","42","app\\models\\Users","42","user","2022-12-05 22:02:55","1"),
("747","New Student","1","1","1","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("748","New Student","1","1","2","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("749","New Student","1","1","3","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("750","New Student","1","1","6","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("751","New Student","1","1","7","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("752","New Student","1","1","8","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("753","New Student","1","1","10","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("754","New Student","1","1","12","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("755","New Student","1","1","15","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("756","New Student","1","1","16","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("757","New Student","1","1","19","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("758","New Student","1","1","20","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("759","New Student","1","1","21","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("760","New Student","1","1","22","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("761","New Student","1","1","23","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("762","New Student","1","1","24","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("763","New Student","1","1","25","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("764","New Student","1","1","26","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("765","New Student","1","1","27","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("766","New Student","1","1","28","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("767","New Student","1","1","29","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("768","New Student","1","1","30","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("769","New Student","1","1","31","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("770","New Student","1","1","32","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("771","New Student","1","1","33","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("772","New Student","1","1","35","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("773","New Student","1","1","36","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("774","New Student","1","1","37","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("775","New Student","1","1","39","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("776","New Student","1","1","40","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("777","New Student","1","1","41","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("778","Welcome","4","1","43","app\\models\\Users","43","user","2022-12-05 22:03:03","1"),
("779","New Trainer","1","1","1","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("780","New Trainer","1","1","2","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("781","New Trainer","1","1","3","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("782","New Trainer","1","1","6","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("783","New Trainer","1","1","7","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("784","New Trainer","1","1","8","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("785","New Trainer","1","1","10","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("786","New Trainer","1","1","12","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("787","New Trainer","1","1","15","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("788","New Trainer","1","1","16","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("789","New Trainer","1","1","19","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("790","New Trainer","1","1","20","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("791","New Trainer","1","1","21","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("792","New Trainer","1","1","22","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("793","New Trainer","1","1","23","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("794","New Trainer","1","1","24","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("795","New Trainer","1","1","25","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("796","New Trainer","1","1","26","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("797","New Trainer","1","1","27","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("798","New Trainer","1","1","28","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("799","New Trainer","1","1","29","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("800","New Trainer","1","1","30","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("801","New Trainer","1","1","31","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("802","New Trainer","1","1","32","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("803","New Trainer","1","1","33","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("804","New Trainer","1","1","35","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("805","New Trainer","1","1","36","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("806","New Trainer","1","1","37","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("807","New Trainer","1","1","39","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("808","New Trainer","1","1","40","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("809","New Trainer","1","1","41","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("810","New Trainer","1","1","44","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("811","Welcome","4","1","44","app\\models\\Users","44","user","2022-12-05 22:03:10","1"),
("812","New Admin","1","1","1","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("813","New Admin","1","1","2","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("814","New Admin","1","1","3","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("815","New Admin","1","1","6","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("816","New Admin","1","1","7","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("817","New Admin","1","1","8","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("818","New Admin","1","1","10","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("819","New Admin","1","1","12","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("820","New Admin","1","1","15","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("821","New Admin","1","1","16","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("822","New Admin","1","1","19","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("823","New Admin","1","1","20","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("824","New Admin","1","1","21","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("825","New Admin","1","1","22","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("826","New Admin","1","1","23","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("827","New Admin","1","1","24","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("828","New Admin","1","1","25","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("829","New Admin","1","1","26","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("830","New Admin","1","1","27","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("831","New Admin","1","1","28","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("832","New Admin","1","1","29","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("833","New Admin","1","1","30","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("834","New Admin","1","1","31","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("835","New Admin","1","1","32","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("836","New Admin","1","1","33","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("837","New Admin","1","1","35","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("838","New Admin","1","1","36","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("839","New Admin","1","1","37","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("840","New Admin","1","1","39","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("841","New Admin","1","1","40","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("842","New Admin","1","1","41","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("843","New Admin","1","1","44","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("844","New Admin","1","1","45","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("845","Welcome","4","1","45","app\\models\\Users","45","user","2022-12-05 22:03:19","1"),
("846","New Admin","1","1","1","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("847","New Admin","1","1","2","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("848","New Admin","1","1","3","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("849","New Admin","1","1","6","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("850","New Admin","1","1","7","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("851","New Admin","1","1","8","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("852","New Admin","1","1","10","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("853","New Admin","1","1","12","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("854","New Admin","1","1","15","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("855","New Admin","1","1","16","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("856","New Admin","1","1","19","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("857","New Admin","1","1","20","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("858","New Admin","1","1","21","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("859","New Admin","1","1","22","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("860","New Admin","1","1","23","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("861","New Admin","1","1","24","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("862","New Admin","1","1","25","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("863","New Admin","1","1","26","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("864","New Admin","1","1","27","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("865","New Admin","1","1","28","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("866","New Admin","1","1","29","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("867","New Admin","1","1","30","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("868","New Admin","1","1","31","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("869","New Admin","1","1","32","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("870","New Admin","1","1","33","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("871","New Admin","1","1","35","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("872","New Admin","1","1","36","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("873","New Admin","1","1","37","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("874","New Admin","1","1","39","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("875","New Admin","1","1","40","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("876","New Admin","1","1","41","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("877","New Admin","1","1","44","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("878","New Admin","1","1","45","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("879","New Admin","1","1","46","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("880","Welcome","4","1","46","app\\models\\Users","46","user","2022-12-05 22:03:28","1"),
("881","New Admin","1","1","1","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("882","New Admin","1","1","2","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("883","New Admin","1","1","3","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("884","New Admin","1","1","6","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("885","New Admin","1","1","7","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("886","New Admin","1","1","8","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("887","New Admin","1","1","10","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("888","New Admin","1","1","12","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("889","New Admin","1","1","15","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("890","New Admin","1","1","16","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("891","New Admin","1","1","19","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("892","New Admin","1","1","20","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("893","New Admin","1","1","21","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("894","New Admin","1","1","22","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("895","New Admin","1","1","23","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("896","New Admin","1","1","24","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("897","New Admin","1","1","25","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("898","New Admin","1","1","26","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("899","New Admin","1","1","27","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("900","New Admin","1","1","28","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("901","New Admin","1","1","29","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("902","New Admin","1","1","30","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("903","New Admin","1","1","31","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("904","New Admin","1","1","32","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("905","New Admin","1","1","33","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("906","New Admin","1","1","35","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("907","New Admin","1","1","36","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("908","New Admin","1","1","37","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("909","New Admin","1","1","39","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("910","New Admin","1","1","40","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("911","New Admin","1","1","41","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("912","New Admin","1","1","44","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("913","New Admin","1","1","45","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("914","New Admin","1","1","46","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("915","New Admin","1","1","47","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("916","Welcome","4","1","47","app\\models\\Users","47","user","2022-12-05 22:03:46","1"),
("917","New Post","1","1","2","app\\models\\Feed","6","feed","2022-12-05 22:17:44","1"),
("918","New Post","1","1","4","app\\models\\Feed","6","feed","2022-12-05 22:17:44","1"),
("919","New Post","1","1","3","app\\models\\Feed","6","feed","2022-12-05 22:17:44","1"),
("920","New Trainer","1","1","3","app\\models\\Users","49","user","2022-12-09 02:30:26","1"),
("921","New Student","1","1","3","app\\models\\Users","50","user","2022-12-09 02:31:27","1"),
("922","New Manager","1","1","3","app\\models\\Users","51","user","2022-12-09 02:31:32","1"),
("923","New Trainer","1","1","3","app\\models\\Users","52","user","2022-12-09 02:31:38","1"),
("924","New Manager","1","1","3","app\\models\\Users","53","user","2022-12-09 02:31:43","1"),
("925","New Manager","1","1","3","app\\models\\Users","54","user","2022-12-09 02:31:48","1"),
("926","New Trainer","1","1","3","app\\models\\Users","55","user","2022-12-09 02:31:54","1"),
("927","New Trainer","1","1","3","app\\models\\Users","56","user","2022-12-09 02:31:59","1"),
("928","New Manager","1","1","3","app\\models\\Users","57","user","2022-12-09 02:32:05","1"),
("929","New Trainer","1","1","3","app\\models\\Users","58","user","2022-12-09 02:32:10","1"),
("930","New Manager","1","1","3","app\\models\\Users","59","user","2022-12-09 02:32:15","1"),
("931","New Student","1","1","3","app\\models\\Users","60","user","2022-12-09 02:32:21","1"),
("932","New Student","1","1","3","app\\models\\Users","61","user","2022-12-09 02:32:26","1"),
("933","New Trainer","1","1","3","app\\models\\Users","62","user","2022-12-09 02:32:32","1"),
("934","New Manager","1","1","3","app\\models\\Users","63","user","2022-12-09 02:32:37","1"),
("935","New Manager","1","1","3","app\\models\\Users","64","user","2022-12-09 02:32:42","1"),
("936","New Manager","1","1","3","app\\models\\Users","65","user","2022-12-09 02:32:48","1"),
("937","New Manager","1","1","3","app\\models\\Users","66","user","2022-12-09 02:32:53","1"),
("938","New Student","1","1","3","app\\models\\Users","67","user","2022-12-09 02:32:59","1"),
("939","New Student","1","1","3","app\\models\\Users","68","user","2022-12-09 02:33:04","1"),
("940","New Manager","1","1","3","app\\models\\Users","69","user","2022-12-09 02:33:09","1"),
("941","New Manager","1","1","3","app\\models\\Users","70","user","2022-12-09 02:33:15","1"),
("942","New Trainer","1","1","3","app\\models\\Users","71","user","2022-12-09 02:33:20","1"),
("943","New Trainer","1","1","3","app\\models\\Users","72","user","2022-12-09 02:33:26","1"),
("944","New Student","1","1","3","app\\models\\Users","73","user","2022-12-09 02:33:31","1"),
("945","New Student","1","1","3","app\\models\\Users","74","user","2022-12-09 02:33:36","1"),
("946","New Manager","1","1","3","app\\models\\Users","75","user","2022-12-09 02:33:42","1"),
("947","New Student","1","1","3","app\\models\\Users","76","user","2022-12-09 02:33:47","1"),
("948","New Manager","1","1","3","app\\models\\Users","77","user","2022-12-09 02:33:53","1"),
("949","New Manager","1","1","3","app\\models\\Users","78","user","2022-12-09 02:33:58","1"),
("950","New Manager","1","1","3","app\\models\\Users","79","user","2022-12-09 02:34:04","1"),
("951","New Student","1","1","3","app\\models\\Users","80","user","2022-12-09 02:34:09","1"),
("952","New Student","1","1","3","app\\models\\Users","81","user","2022-12-09 02:34:14","1"),
("953","New Trainer","1","1","3","app\\models\\Users","82","user","2022-12-09 02:37:09","1"),
("954","New Student","1","1","3","app\\models\\Users","83","user","2022-12-09 02:37:09","1"),
("955","New Manager","1","1","3","app\\models\\Users","84","user","2022-12-09 02:37:09","1"),
("956","New Student","1","1","3","app\\models\\Users","85","user","2022-12-09 02:37:09","1"),
("957","New Trainer","1","1","3","app\\models\\Users","86","user","2022-12-09 02:37:09","1"),
("958","New Trainer","1","1","3","app\\models\\Users","87","user","2022-12-09 02:37:09","1"),
("959","New Trainer","1","1","3","app\\models\\Users","88","user","2022-12-09 02:37:09","1"),
("960","New Trainer","1","1","3","app\\models\\Users","89","user","2022-12-09 02:37:10","1"),
("961","New Student","1","1","3","app\\models\\Users","90","user","2022-12-09 02:37:10","1"),
("962","New Manager","1","1","1","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("963","New Manager","1","1","2","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("964","New Manager","1","1","3","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("965","New Manager","1","1","6","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("966","New Manager","1","1","7","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("967","New Manager","1","1","8","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("968","New Manager","1","1","10","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("969","New Manager","1","1","12","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("970","New Manager","1","1","15","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("971","New Manager","1","1","16","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("972","New Manager","1","1","19","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("973","New Manager","1","1","20","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("974","New Manager","1","1","21","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("975","New Manager","1","1","22","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("976","New Manager","1","1","23","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("977","New Manager","1","1","24","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("978","New Manager","1","1","25","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("979","New Manager","1","1","26","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("980","New Manager","1","1","27","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("981","New Manager","1","1","28","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("982","New Manager","1","1","29","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("983","New Manager","1","1","30","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("984","New Manager","1","1","31","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("985","New Manager","1","1","32","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("986","New Manager","1","1","33","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("987","New Manager","1","1","35","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("988","New Manager","1","1","36","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("989","New Manager","1","1","37","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("990","New Manager","1","1","39","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("991","New Manager","1","1","40","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("992","New Manager","1","1","41","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("993","New Manager","1","1","44","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("994","New Manager","1","1","45","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("995","New Manager","1","1","46","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("996","New Manager","1","1","47","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("997","New Manager","1","1","49","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("998","New Manager","1","1","51","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("999","New Manager","1","1","52","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1000","New Manager","1","1","53","app\\models\\Users","91","user","2022-12-09 08:08:26","1");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_notification` (`id`,`title`,`type_id`,`state_id`,`to_user_id`,`model`,`model_id`,`icon`,`created_on`,`created_by_id`) VALUES
("1001","New Manager","1","1","54","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1002","New Manager","1","1","55","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1003","New Manager","1","1","56","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1004","New Manager","1","1","57","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1005","New Manager","1","1","58","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1006","New Manager","1","1","59","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1007","New Manager","1","1","62","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1008","New Manager","1","1","63","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1009","New Manager","1","1","64","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1010","New Manager","1","1","65","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1011","New Manager","1","1","66","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1012","New Manager","1","1","69","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1013","New Manager","1","1","70","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1014","New Manager","1","1","71","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1015","New Manager","1","1","72","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1016","New Manager","1","1","75","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1017","New Manager","1","1","77","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1018","New Manager","1","1","78","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1019","New Manager","1","1","79","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1020","New Manager","1","1","82","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1021","New Manager","1","1","84","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1022","New Manager","1","1","86","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1023","New Manager","1","1","87","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1024","New Manager","1","1","88","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1025","New Manager","1","1","89","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1026","New Manager","1","1","91","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1027","Welcome","4","1","91","app\\models\\Users","91","user","2022-12-09 08:08:26","1"),
("1028","New Course: Breanna Britt","1","1","3","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1029","New Course: Breanna Britt","1","1","4","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1030","New Course: Breanna Britt","1","1","5","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1031","New Course: Breanna Britt","1","1","7","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1032","New Course: Breanna Britt","1","1","8","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1033","New Course: Breanna Britt","1","1","9","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1034","New Course: Breanna Britt","1","1","11","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1035","New Course: Breanna Britt","1","1","13","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1036","New Course: Breanna Britt","1","1","14","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1037","New Course: Breanna Britt","1","1","15","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1038","New Course: Breanna Britt","1","1","16","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1039","New Course: Breanna Britt","1","1","17","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1040","New Course: Breanna Britt","1","1","18","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1041","New Course: Breanna Britt","1","1","19","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1042","New Course: Breanna Britt","1","1","21","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1043","New Course: Breanna Britt","1","1","24","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1044","New Course: Breanna Britt","1","1","28","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1045","New Course: Breanna Britt","1","1","29","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1046","New Course: Breanna Britt","1","1","32","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1047","New Course: Breanna Britt","1","1","34","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1048","New Course: Breanna Britt","1","1","35","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1049","New Course: Breanna Britt","1","1","38","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1050","New Course: Breanna Britt","1","1","41","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1051","New Course: Breanna Britt","1","1","42","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1052","New Course: Breanna Britt","1","1","43","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1053","New Course: Breanna Britt","1","1","44","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1054","New Course: Breanna Britt","1","1","49","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1055","New Course: Breanna Britt","1","1","50","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1056","New Course: Breanna Britt","1","1","52","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1057","New Course: Breanna Britt","1","1","55","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1058","New Course: Breanna Britt","1","1","56","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1059","New Course: Breanna Britt","1","1","58","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1060","New Course: Breanna Britt","1","1","60","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1061","New Course: Breanna Britt","1","1","61","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1062","New Course: Breanna Britt","1","1","62","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1063","New Course: Breanna Britt","1","1","67","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1064","New Course: Breanna Britt","1","1","68","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1065","New Course: Breanna Britt","1","1","71","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1066","New Course: Breanna Britt","1","1","72","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1067","New Course: Breanna Britt","1","1","73","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1068","New Course: Breanna Britt","1","1","74","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1069","New Course: Breanna Britt","1","1","76","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1070","New Course: Breanna Britt","1","1","80","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1071","New Course: Breanna Britt","1","1","81","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1072","New Course: Breanna Britt","1","1","82","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1073","New Course: Breanna Britt","1","1","83","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1074","New Course: Breanna Britt","1","1","85","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1075","New Course: Breanna Britt","1","1","86","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1076","New Course: Breanna Britt","1","1","87","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1077","New Course: Breanna Britt","1","1","88","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1078","New Course: Breanna Britt","1","1","89","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1079","New Course: Breanna Britt","1","1","90","app\\models\\Course","3","book","2022-12-11 14:18:43","1"),
("1080","Course Published","4","1","3","app\\models\\Course","3","book","2022-12-11 14:18:43","1");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_skill` (`id`,`model`,`model_id`,`skill`,`level`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","app\\models\\Users","1","Oprah Barnett","2","2022-11-19 09:49:11","1","2022-11-19 09:49:11"),
("2","app\\models\\Users","3","Priscilla Wilson","1","2022-11-29 11:18:57","1","2022-11-29 11:18:57"),
("3","app\\models\\Users","3","Skdkfix","0","2022-12-04 19:46:40","1","2022-12-04 19:46:40"),
("4","app\\models\\Users","2","Vernon Lambert","1","2022-12-05 22:22:13","1","2022-12-05 22:22:13"),
("5","app\\models\\Users","2","Hannah Vaughn","2","2022-12-05 22:22:20","1","2022-12-05 22:22:20");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_social_link` (`id`,`platform`,`link`,`created_on`,`created_by_id`,`updated_on`) VALUES
("5","website","https://www.byb.com","2022-11-29 11:29:41","3","2022-11-29 11:29:41"),
("6","github","https://www.hoca.org","2022-11-29 11:29:41","3","2022-11-29 11:29:41"),
("7","twitter","https://www.radarumifijes.ca","2022-11-29 11:29:41","3","2022-11-29 11:29:41"),
("8","instagram","https://www.deluhukobe.cm","2022-11-29 11:29:41","3","2022-11-29 11:29:41"),
("9","facebook","https://www.hegiwij.com.au","2022-11-29 11:29:41","3","2022-11-29 11:29:41");

 -- -------AutobackUpStart------ 


INSERT INTO `tbl_user` (`id`,`username`,`email`,`password`,`roll_id`,`state_id`,`dob`,`authKey`,`accessToken`,`gender`,`created_on`,`created_by_id`,`updated_on`) VALUES
("1","Admin","admin@gmail.com","admin@123","1","1","2000-01-01","admin99","99tokens","Male","2022-04-03 05:50:08","1","2022-12-04 19:12:43"),
("2","Developer","dev@mailinator.com","admin@123","2","1","2006-04-17","test920","920-token","","2022-11-20 15:59:15","1","2022-12-04 19:17:54"),
("3","Trainer","trainer@gmail.com","admin@123","3","1","1980-06-08","test339","339-token","Female","2022-11-29 11:18:43","1","2022-12-04 19:17:15"),
("4","Student","student@gmail.com","admin@123","4","1","1996-09-28","test165","165-token","Male","2022-12-03 14:36:37","1","2022-12-04 19:18:17"),
("5","samaxof","munoxe@mailinator.com","admin@123","4","1","2005-07-04","test909","909-token","Male","2022-12-04 20:15:57","1","2022-12-04 21:05:12"),
("6","jacasa","gofydo@mailinator.com","admin@123","2","1","1973-11-20","test734","734-token","Female","2022-12-05 21:34:21","1","2022-12-05 21:34:21"),
("7","qyxew","wupenow@mailinator.com","admin@123","3","1","2017-07-06","test640","640-token","Male","2022-12-05 21:34:36","1","2022-12-05 21:34:36"),
("8","fusasem","hozinilec@mailinator.com","admin@123","3","1","2013-08-01","test417","417-token","Male","2022-12-05 21:34:45","1","2022-12-05 21:34:45"),
("9","faluzup","tukyrowe@mailinator.com","admin@123","4","1","1989-01-20","test310","310-token","Male","2022-12-05 21:35:02","1","2022-12-05 21:35:02"),
("10","lozoci","cojo@mailinator.com","admin@123","1","1","2005-11-12","test885","885-token","Male","2022-12-05 21:35:40","1","2022-12-05 21:35:40"),
("11","tabudipor","zesywy@mailinator.com","admin@123","4","1","1989-04-14","test455","455-token","Male","2022-12-05 21:36:05","1","2022-12-05 21:46:41"),
("12","tasuhenagi","tucahyxo@mailinator.com","admin@123","1","1","1975-07-15","test788","788-token","Female","2022-12-05 21:36:20","1","2022-12-05 21:36:20"),
("13","kywefobuk","jumamepym@mailinator.com","admin@123","4","1","1971-11-02","test817","817-token","Male","2022-12-05 21:36:44","1","2022-12-05 21:36:44"),
("14","godezigup","zeradoz@mailinator.com","admin@123","4","1","1988-12-26","test424","424-token","Female","2022-12-05 21:37:03","1","2022-12-05 21:37:03"),
("15","javajibun","cohy@mailinator.com","admin@123","3","1","1990-10-08","test624","624-token","Female","2022-12-05 21:37:17","1","2022-12-05 21:37:17"),
("16","qanileni","kaxojesyvo@mailinator.com","admin@123","3","1","1971-09-15","test752","752-token","Male","2022-12-05 21:37:59","1","2022-12-05 21:37:59"),
("17","jocadifiny","rajycifih@mailinator.com","admin@123","4","1","1988-10-11","test921","921-token","Female","2022-12-05 21:38:07","1","2022-12-05 21:38:07"),
("18","vihaxabog","defolohiza@mailinator.com","admin@123","4","1","2001-02-20","test607","607-token","Female","2022-12-05 21:38:21","1","2022-12-05 21:38:21"),
("19","xyqyh","nobywadyl@mailinator.com","admin@123","3","1","1976-01-07","test838","838-token","Female","2022-12-05 21:38:31","1","2022-12-05 21:46:18"),
("20","zetatunig","kynilo@mailinator.com","admin@123","2","1","2008-02-17","test219","219-token","Female","2022-12-05 21:38:43","1","2022-12-05 21:38:43"),
("21","dytawuwe","peqerure@mailinator.com","admin@123","3","1","1993-03-22","test188","188-token","Female","2022-12-05 21:38:57","1","2022-12-05 21:38:57"),
("22","goxaviwe","cyxykivuq@mailinator.com","admin@123","2","1","1981-08-09","test799","799-token","Female","2022-12-05 21:39:06","1","2022-12-05 21:39:06"),
("23","judebu","xyvyh@mailinator.com","admin@123","1","1","1975-07-01","test413","413-token","Female","2022-12-05 21:39:20","1","2022-12-05 21:39:20"),
("24","kobixoky","wimykim@mailinator.com","admin@123","3","1","2015-07-16","test581","581-token","Female","2022-12-05 21:39:51","1","2022-12-05 21:39:51"),
("25","tirecadyte","cusaq@mailinator.com","admin@123","2","1","1982-11-04","test851","851-token","Female","2022-12-05 21:40:19","1","2022-12-05 21:40:19"),
("26","jonipuz","rewozenyn@mailinator.com","admin@123","1","1","2009-08-27","test926","926-token","Male","2022-12-05 21:42:24","1","2022-12-05 21:42:24"),
("27","kibapibu","welafo@mailinator.com","admin@123","2","1","1980-04-21","test618","618-token","Male","2022-12-05 22:00:37","1","2022-12-05 22:00:37"),
("28","wymifupit","mogaker@mailinator.com","admin@123","3","1","2012-06-07","test907","907-token","Male","2022-12-05 22:00:52","1","2022-12-05 22:00:52"),
("29","wezype","syfiv@mailinator.com","admin@123","3","1","1972-04-10","test348","348-token","Female","2022-12-05 22:01:02","1","2022-12-05 22:01:02"),
("30","sivokukyq","kozezezaqu@mailinator.com","admin@123","2","1","2008-11-23","test352","352-token","Female","2022-12-05 22:01:13","1","2022-12-05 22:01:13"),
("31","femebas","qaryv@mailinator.com","admin@123","1","1","1993-06-21","test817","817-token","Male","2022-12-05 22:01:15","1","2022-12-05 22:01:15"),
("32","pijasor","gesar@mailinator.com","admin@123","3","1","2018-05-19","test760","760-token","Male","2022-12-05 22:01:24","1","2022-12-05 22:01:24"),
("33","tihogigo","xunyhih@mailinator.com","admin@123","2","1","1973-05-21","test380","380-token","Female","2022-12-05 22:01:28","1","2022-12-05 22:01:28"),
("34","jixaqavup","variwabu@mailinator.com","admin@123","4","1","1992-07-05","test220","220-token","Female","2022-12-05 22:01:38","1","2022-12-05 22:01:38"),
("35","zuqimo","nodagopyfy@mailinator.com","admin@123","3","1","2022-01-27","test822","822-token","Male","2022-12-05 22:01:47","1","2022-12-05 22:01:47"),
("36","biwoconaj","mekezaku@mailinator.com","admin@123","2","1","1986-06-12","test994","994-token","Female","2022-12-05 22:01:56","1","2022-12-05 22:01:56"),
("37","hybomod","pupatot@mailinator.com","admin@123","1","1","2005-02-23","test704","704-token","Female","2022-12-05 22:02:04","1","2022-12-05 22:02:04"),
("38","bybilet","mubezagop@mailinator.com","admin@123","4","1","2015-09-20","test943","943-token","Female","2022-12-05 22:02:18","1","2022-12-05 22:02:18"),
("39","tytob","zusym@mailinator.com","admin@123","2","1","2018-04-20","test301","301-token","Female","2022-12-05 22:02:26","1","2022-12-05 22:02:26"),
("40","qomaxasu","jetobona@mailinator.com","admin@123","2","1","1996-12-22","test872","872-token","Female","2022-12-05 22:02:34","1","2022-12-05 22:02:34"),
("41","kahoho","zudydokama@mailinator.com","admin@123","3","1","1973-09-09","test861","861-token","Male","2022-12-05 22:02:42","1","2022-12-05 22:02:42"),
("42","sulafunotu","fazexopew@mailinator.com","admin@123","4","1","2022-05-03","test373","373-token","Male","2022-12-05 22:02:55","1","2022-12-05 22:02:55"),
("43","bakiheryv","vazog@mailinator.com","admin@123","4","1","1979-05-08","test651","651-token","Female","2022-12-05 22:03:02","1","2022-12-05 22:03:02"),
("44","tocevi","detucogole@mailinator.com","admin@123","3","1","1980-10-25","test271","271-token","Male","2022-12-05 22:03:10","1","2022-12-05 22:03:10"),
("45","dyfovobe","kavu@mailinator.com","admin@123","1","1","1983-01-07","test669","669-token","Male","2022-12-05 22:03:19","1","2022-12-05 22:03:19"),
("46","rubobisef","jyperovek@mailinator.com","admin@123","1","1","1989-11-14","test258","258-token","Male","2022-12-05 22:03:28","1","2022-12-05 22:03:28"),
("47","fogyvy","gibyw@mailinator.com","admin@123","1","1","2020-12-26","test798","798-token","Male","2022-12-05 22:03:46","1","2022-12-05 22:03:46"),
("49","KDViL","9wOTY@gmail.com","AGu8hFcrkd","3","3","1941-09-14","test339key","637-token","Male","2022-12-09 02:30:26","1","2022-12-09 02:30:26"),
("50","okb4z","BXJXL@gmail.com","bpsHkN5anZ","4","2","1928-05-29","test860key","997-token","Male","2022-12-09 02:31:27","1","2022-12-09 02:31:27"),
("51","SpqRi","S8bvu@gmail.com","5qCvy27r9o","2","2","1939-07-19","test627key","459-token","Male","2022-12-09 02:31:32","1","2022-12-09 02:31:32"),
("52","aXdPV","mkdfU@gmail.com","fkRwdnzW43","3","3","1943-09-29","test847key","862-token","Female","2022-12-09 02:31:37","1","2022-12-09 02:31:37"),
("53","NHO3C","wUUje@gmail.com","RneDkumN0p","2","1","1902-05-25","test641key","596-token","Female","2022-12-09 02:31:43","1","2022-12-09 02:31:43"),
("54","y7Ods","QV6sQ@gmail.com","hoC05nb1nI","2","2","2017-05-16","test223key","746-token","Female","2022-12-09 02:31:48","1","2022-12-09 02:31:48"),
("55","OXoUt","TEKCO@gmail.com","bRsMnHIXqI","3","1","2018-05-28","test763key","713-token","Female","2022-12-09 02:31:54","1","2022-12-09 02:31:54"),
("56","Klz5X","L2src@gmail.com","MCW2hsvd3W","3","3","2021-03-19","test277key","263-token","Male","2022-12-09 02:31:59","1","2022-12-09 02:31:59"),
("57","Qfv4H","rC7rp@gmail.com","rca5GZXxV2","2","3","1903-10-10","test654key","804-token","Male","2022-12-09 02:32:04","1","2022-12-09 02:32:04"),
("58","BwyAq","zjB1A@gmail.com","oTX58x2fC3","3","2","2001-04-08","test616key","839-token","Female","2022-12-09 02:32:10","1","2022-12-09 02:32:10"),
("59","HEXpi","vchw1@gmail.com","mjCbiB510Z","2","1","1949-01-05","test449key","731-token","Female","2022-12-09 02:32:15","1","2022-12-09 02:32:15"),
("60","EanLi","j47GM@gmail.com","5vCRpfGOds","4","2","2000-12-29","test459key","350-token","Male","2022-12-09 02:32:21","1","2022-12-09 02:32:21"),
("61","JFMh8","O7Kcb@gmail.com","4VIwlXKjbR","4","3","1983-08-22","test804key","191-token","Female","2022-12-09 02:32:26","1","2022-12-09 02:32:26"),
("62","Jkm3C","uQGQI@gmail.com","27gU7mZDpo","3","1","1988-12-06","test151key","344-token","Male","2022-12-09 02:32:32","1","2022-12-09 02:32:32"),
("63","AHyVo","4w2VY@gmail.com","njPuL9FEzz","2","2","2006-04-20","test925key","786-token","Male","2022-12-09 02:32:37","1","2022-12-09 02:32:37"),
("64","AmarU","Jjg6G@gmail.com","C25No5nVid","2","1","1935-03-29","test116key","888-token","Male","2022-12-09 02:32:42","1","2022-12-09 02:32:42"),
("65","goveI","Qhlsb@gmail.com","dBwE06VdPB","2","2","1921-05-31","test242key","664-token","Female","2022-12-09 02:32:48","1","2022-12-09 02:32:48"),
("66","oFgK1","lSVSd@gmail.com","ean3LDPT6u","2","1","2014-05-05","test782key","513-token","Male","2022-12-09 02:32:53","1","2022-12-09 02:32:53"),
("67","pbf3e","LQsKs@gmail.com","6ZMSoAdK4M","4","2","1911-03-09","test963key","731-token","Male","2022-12-09 02:32:59","1","2022-12-09 02:32:59"),
("68","GKjlU","DR9TO@gmail.com","c9gq8u3FJk","4","1","2000-10-17","test566key","568-token","Male","2022-12-09 02:33:04","1","2022-12-09 02:33:04"),
("69","pnk0v","DZgdk@gmail.com","59jKzsLCEw","2","1","1953-02-04","test510key","590-token","Male","2022-12-09 02:33:09","1","2022-12-09 02:33:09"),
("70","qSwly","RcX6g@gmail.com","np9iCHvatt","2","1","1951-09-07","test953key","262-token","Female","2022-12-09 02:33:15","1","2022-12-09 02:33:15"),
("71","K6wAk","s9grD@gmail.com","HGh2n7WBHq","3","2","1948-11-01","test748key","425-token","Female","2022-12-09 02:33:20","1","2022-12-09 02:33:20"),
("72","pNDIS","UQGDL@gmail.com","5uxFs5pnb1","3","1","1903-03-01","test552key","624-token","Female","2022-12-09 02:33:26","1","2022-12-09 02:33:26"),
("73","kCbBW","nT0pF@gmail.com","JGpOg7xDzh","4","1","1963-06-01","test597key","111-token","Male","2022-12-09 02:33:31","1","2022-12-09 02:33:31"),
("74","ovoe2","aKtW9@gmail.com","4sJmsTD4Ed","4","1","1914-05-12","test987key","346-token","Female","2022-12-09 02:33:36","1","2022-12-09 02:33:36"),
("75","7xoZu","rMiAf@gmail.com","yCV6sOUF8f","2","1","2011-05-27","test604key","577-token","Male","2022-12-09 02:33:42","1","2022-12-09 02:33:42"),
("76","T9Tyg","oIdOn@gmail.com","3ayxWnfC8t","4","3","1976-09-20","test104key","738-token","Male","2022-12-09 02:33:47","1","2022-12-09 02:33:47"),
("77","U34h0","xOeys@gmail.com","Rj1o8Fkzxc","2","1","1937-02-13","test492key","291-token","Male","2022-12-09 02:33:53","1","2022-12-09 02:33:53"),
("78","VddYe","6eOeh@gmail.com","I3k2ZcJvkl","2","2","1992-03-06","test380key","979-token","Male","2022-12-09 02:33:58","1","2022-12-09 02:33:58"),
("79","Oh3YW","51xiN@gmail.com","Zk3tqO4jrB","2","3","2006-12-25","test241key","630-token","Female","2022-12-09 02:34:03","1","2022-12-09 02:34:03"),
("80","g7VZh","AP7Dq@gmail.com","8xF3wXKrgy","4","1","2008-02-08","test338key","553-token","Female","2022-12-09 02:34:09","1","2022-12-09 02:34:09"),
("81","sh72T","dXN0o@gmail.com","fiAOyYz9DA","4","1","1972-01-31","test148key","678-token","Male","2022-12-09 02:34:14","1","2022-12-09 02:34:14"),
("82","CJVmH","BMM4O@gmail.com","gzwMsE9Aiz","3","3","1901-11-16","test319key","864-token","Male","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("83","nyljy","XkJ9o@gmail.com","m8MDrmSgop","4","3","1991-12-07","test427key","114-token","Female","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("84","XwxLl","STW7W@gmail.com","YfxRRejzpQ","2","2","1902-11-05","test530key","235-token","Male","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("85","tEDQJ","scZXw@gmail.com","rLtnKYu0q6","4","2","1916-03-01","test965key","312-token","Female","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("86","rcdyO","LiHYB@gmail.com","mnTK2rJkta","3","3","1937-02-22","test423key","468-token","Female","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("87","iIHv8","emamX@gmail.com","zpix3RouZF","3","3","1932-11-13","test500key","187-token","Female","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("88","XrUav","WWep3@gmail.com","GYXgPcGAAy","3","1","2017-06-12","test772key","523-token","Male","2022-12-09 02:37:09","1","2022-12-09 02:37:09"),
("89","gBaes","hfnF4@gmail.com","7hEf59IcVm","3","3","2019-06-05","test594key","290-token","Male","2022-12-09 02:37:10","1","2022-12-09 02:37:10"),
("90","Itjta","ud2rb@gmail.com","iOnDsk4tsN","4","3","2018-04-07","test122key","793-token","Male","2022-12-09 02:37:10","1","2022-12-09 02:37:10"),
("91","qaxylamu","jocej@mailinator.com","admin@123","2","1","2022-01-19","test448","448-token","Male","2022-12-09 08:08:25","1","2022-12-09 08:08:25");

 -- -------AutobackUpStart------ 
COMMIT;
-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 -- -------AutobackUpStart------ -- -------------------------------------------

-- -------------------------------------------

-- END BACKUP

-- -------------------------------------------
