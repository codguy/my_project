-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 08:10 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1648954815),
('m220330_162243_create_tbl_user', 1648954821),
('m220401_163852_create_tbl_dept', 1648954821),
('m220403_083451_create_tbl_notification', 1648975466),
('m220419_154955_create_tbl_course', 1650558260),
('m220421_154217_add_column_image_to_tbl_course', 1650558418),
('m220421_154646_create_tbl_feed', 1650558757),
('m220421_155013_create_tbl_chapter', 1650558870),
('m220421_155808_create_tbl_image', 1650558870),
('m220421_160242_create_tbl_discussion', 1650558870),
('m220421_160759_create_tbl_follow', 1650558870),
('m220421_161110_create_tbl_social_link', 1650558870),
('m220421_161515_create_tbl_like', 1650558870),
('m220421_161721_create_tbl_skill', 1650558870),
('m220527_214327_create_tbl_message', 1653798827),
('m220530_165007_create_tbl_email_template', 1653929699);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chapter`
--

CREATE TABLE `tbl_chapter` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_chapter`
--

INSERT INTO `tbl_chapter` (`id`, `title`, `desciption`, `dificulty`, `course_id`, `created_on`, `created_by_id`, `updated_on`) VALUES
(10, 'Introduction to Ethical hacking', '<h2>Definition</h2>\r\n\r\n<p>Ethical hacking involves an authorized attempt to gain unauthorized access to a computer system, application, or data. Carrying out an ethical hack involves duplicating strategies and actions of malicious attackers. This practice helps to identify <a href=\"https://www.synopsys.com/blogs/software-security/types-of-security-vulnerabilities/\">security vulnerabilities</a> which can then be resolved before a malicious attacker has the opportunity to exploit them.</p>\r\n\r\n<h2>What is an ethical hacker?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>Also known as &ldquo;white hats,&rdquo; <a href=\"https://www.synopsys.com/blogs/software-security/what-are-ethical-hackers/\" target=\"_self\">ethical hackers</a> are security experts that perform these security assessments. The proactive work they do helps to improve an organization&rsquo;s security posture. With prior approval from the organization or owner of the IT asset, the mission of ethical hacking is opposite from malicious hacking.&nbsp;</p>\r\n\r\n<hr />\r\n<h2>What are the key concepts of ethical hacking?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>Hacking experts follow four key protocol concepts:</p>\r\n\r\n<ol>\r\n	<li><strong>Stay legal</strong>. Obtain proper approval before accessing and performing a <a href=\"https://www.synopsys.com/glossary/what-is-vulnerability-assessment.html\" target=\"_self\">security assessment</a>.</li>\r\n	<li><strong>Define the scope</strong>. Determine the scope of the assessment so that the ethical hacker&rsquo;s work remains legal and within the organization&rsquo;s approved boundaries.</li>\r\n	<li><strong>Report vulnerabilities</strong>. Notify the organization of all vulnerabilities discovered during the assessment. Provide remediation advice for resolving these vulnerabilities.</li>\r\n	<li><strong>Respect data sensitivity</strong>. Depending on the data sensitivity, ethical hackers may have to agree to a non-disclosure agreement, in addition to other terms and conditions required by the assessed organization.&nbsp;</li>\r\n</ol>\r\n\r\n<hr />\r\n<h2>How are ethical hackers different than malicious hackers?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>Ethical hackers use their knowledge to secure and improve the technology of organizations. They provide an essential service to these organizations by looking for vulnerabilities that can lead to a security breach.</p>\r\n\r\n<p>An ethical hacker reports the identified vulnerabilities to the organization. Additionally, they provide remediation advice. In many cases, with the organization&rsquo;s consent, the ethical hacker performs a re-test to ensure the vulnerabilities are fully resolved.&nbsp;</p>\r\n\r\n<p>Malicious hackers intend to gain unauthorized access to a resource (the more sensitive the better) for financial gain or personal recognition. Some malicious hackers deface websites or crash backend servers for fun, reputation damage, or to cause financial loss. The methods used and vulnerabilities found remain unreported. They aren&rsquo;t concerned with improving the organizations security posture.&nbsp;&nbsp;</p>\r\n\r\n<hr />\r\n<h2>What skills and certifications should an ethical hacker obtain?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>An ethical hacker should have a wide range of computer skills. They often specialize, becoming subject matter experts (SME) on a particular area within the ethical hacking domain.</p>\r\n\r\n<p>All ethical hackers should have:</p>\r\n\r\n<ul>\r\n	<li>Expertise in scripting languages.</li>\r\n	<li>Proficiency in operating systems.</li>\r\n	<li>A thorough knowledge of networking.</li>\r\n	<li>A solid foundation in the principles of information security.</li>\r\n</ul>\r\n\r\n<p>Some of the most well-known and acquired certifications include:</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.eccouncil.org/programs/certified-ethical-hacker-ceh/\">EC Council: Certified Ethical Hacking Certification</a></li>\r\n	<li><a href=\"https://www.offensive-security.com/information-security-certifications/oscp-offensive-security-certified-professional/\">Offensive Security Certified Professional (OSCP) Certification</a></li>\r\n	<li><a href=\"https://certification.comptia.org/certifications/security\">CompTIA Security+</a></li>\r\n	<li><a href=\"http://www.cisco.com/c/en/us/training-events/training-certifications/certifications/associate/ccna-security.html\">Cisco&rsquo;s CCNA Security</a></li>\r\n	<li><a href=\"https://www.giac.org/\">SANS GIAC</a></li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>What problems does hacking identify?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<p>While assessing the security of an organization&rsquo;s IT asset(s), ethical hacking aims to mimic an attacker. In doing so, they look for attack vectors against the target. The initial goal is to perform reconnaissance, gaining as much information as possible.</p>\r\n\r\n<p>Once the ethical hacker gathers enough information, they use it to look for vulnerabilities against the asset. They perform this assessment with a combination of automated and manual testing. Even sophisticated systems may have complex countermeasure technologies which may be vulnerable.</p>\r\n\r\n<p>They don&rsquo;t stop at uncovering vulnerabilities. Ethical hackers use exploits against the vulnerabilities to prove how a malicious attacker could exploit it.</p>\r\n\r\n<p>Some of the most common vulnerabilities discovered by ethical hackers include:</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.synopsys.com/glossary/what-is-sql-injection.html\" target=\"_self\">Injection attacks</a></li>\r\n	<li>Broken authentication</li>\r\n	<li>Security misconfigurations</li>\r\n	<li>Use of components with known vulnerabilities</li>\r\n	<li>Sensitive data exposure</li>\r\n</ul>\r\n\r\n<p>After the testing period, ethical hackers prepare a detailed report. This documentation includes steps to compromise the discovered vulnerabilities and steps to patch or mitigate them.</p>\r\n\r\n<hr />\r\n<h2>What are some limitations of ethical hacking?</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<ul>\r\n	<li><strong>Limited scope</strong>. Ethical hackers cannot progress beyond a defined scope to make an attack successful. However, it&rsquo;s not unreasonable to discuss out of scope attack potential with the organization. &nbsp;</li>\r\n	<li><strong>Resource constraints</strong>. Malicious hackers don&rsquo;t have time constraints that ethical hackers often face. Computing power and budget are additional constraints of ethical hackers.</li>\r\n	<li><strong>Restricted methods</strong>. Some organizations ask experts to avoid test cases that lead the servers to crash (e.g., Denial of Service (DoS) attacks).&nbsp;</li>\r\n</ul>\r\n', 2, 11, '2022-05-26 06:58:12', 50, '2022-05-26 06:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`id`, `name`, `desciption`, `dificulty`, `trainer_id`, `created_on`, `created_by_id`, `updated_on`, `image`) VALUES
(11, 'The Complete Ethical Hacking Course', '<h2>What you&#39;ll learn</h2>\n\n<ul>\n	<li>\n	<p>Answers to every single question you have about ethical hacking and penetration testing from an experienced IT professional!</p>\n	</li>\n	<li>\n	<p>Tips for remaining anonymous in hacking and penetration testing activities.</p>\n	</li>\n	<li>\n	<p>A guide to using these skills to get a better job and make money online as a freelancer.</p>\n	</li>\n	<li>\n	<p>The ability to secure and protect any network from hackers and loss of data.</p>\n	</li>\n	<li>\n	<p>A complete tutorial explaining how to build a virtual hacking environment, attack networks, and break passwords.</p>\n	</li>\n	<li>\n	<p>Step by step instructions for insulation VirtualBox and creating your virtual environment on Windows, Mac, and Linux.</p>\n	</li>\n</ul>\n\n<h2>Requirements</h2>\n\n<ul>\n	<li>\n	<p>Reliable and fast internet connection.</p>\n	</li>\n	<li>\n	<p>Wireless networking card.</p>\n	</li>\n</ul>\n\n<h2>Description</h2>\n\n<p>Gain the ability to do <strong>ethical hacking</strong> and <strong>penetration testing</strong> by taking this course! Get answers from an experienced IT expert to every single question you have related to the learning you do in this course including installing Kali Linux, using VirtualBox, basics of Linux, Tor, Proxychains, VPN, Macchanger, Nmap, cracking wifi, aircrack, DoS attacks, SLL strip, known vulnerabilities, SQL injections, cracking Linux passwords, and more topics that are added every month!</p>\n\n<p>If you are like me, you are reading more now because you want to know for sure whether this course is worth taking before you invest your money and time in it. More than10,000 people have already completed the process of deciding to take this course and I hope sharing a few of their experiences can prove useful for you here. Here are what three recent students had to say in the reviews in their own words.</p>\n\n<p><strong>Awesome Course</strong> by Penny Garcia.</p>\n\n<ul>\n	<li>I am 11 videos in and LOVING this course right now. The instructor is very thorough. I would certainly recommend this course to others as I am just starting out in pen testing and hacking and feel that this is what I have been looking for. Thank you so much for putting the time and effort into such an amazing course.</li>\n</ul>\n\n<p><strong>Best course ever..</strong> by Mahmoud Selman.</p>\n\n<ul>\n	<li>Thank you guys for such a great course. It&#39;s the best one ever on Udemy and worth every penny. You have covered everything inside it. Students be aware! What you are going to learn here in this course is going to blow your mind!! and you got to use what you learn wisely otherwise if you misuse this info you can get from 5 to 10 years in jail. Keep it White hat.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>Very helpful instructor </strong>by Deepak Muralidharan.</p>\n\n<ul>\n	<li>Ermin Kreponic has been very helpful in solving many hiccups pertaining to this course. Especially considering the time difference between us. Much appreciated his help.</li>\n</ul>\n\n<p>What you can see from reading these three reviews is that students love the technical support Ermin provides through answering questions about all of the subjects presented in the course. The lectures themselves are helpful and will inspire you to try actually doing what you see Ermin do. Then when you try to learn and have problems, you experience the greatest value of the course which is access to the instructor for help. You can ask anything related to the course and Ermin will give you a thoughtful answer which will consistently help you solve the problems you are having in learning ethical hacking and penetration testing.</p>\n\n<p>Thank you very much for reading so much of the description for this course! The fact that you have spent some of your very valuable time here already reading this course leads me to believe that you will enjoy being a student in the course a lot! Find the &quot;take this course&quot; or &quot;start free preview&quot; button up on the page to give the course a try today!</p>\n\n<p>If you want to learn more about what the course contains, here is a short list of questions to help you decide if you should take it followed by a deep list of the course lectures below. What you see is just the beginning of what the course includes because Ermin is making new lectures every month for you! You will get to see screen capture live tutorials showing you everything you need to do to get started with ethical hacking and penetration testing including information about all of the topics below!</p>\n\n<ul>\n	<li>How to install VirtualBox.</li>\n	<li>What to do to create the virtual environment.</li>\n	<li>Installing VirtualBox in a Windows 8.1 environment.</li>\n	<li>Basic Linux terminal.</li>\n	<li>Staying anonymous with tor.</li>\n	<li>Virtual Private Networks (VPN).</li>\n</ul>\n\n<p>You get lifetime access to this course which already has 20+ hours of HD video tutorials sharing everything you need to be a penetration testing expert and ethical hacker! If you are still not sure, here are three questions you can use to make the final decision!</p>\n\n<ol>\n	<li>Do you want to learn how to penetrate networks, exploit systems, break into computers, and compromise routers?</li>\n	<li>Do you want to use the valuable skills to work for companies that want you to use these skills to test their network security and show them to enhance it?</li>\n	<li>How would you feel if you could apply these skills to what you already know to greatly advance your career as a network specialist, network administrator, or freelancer online?</li>\n</ol>\n\n<p>If you answered yes to any of these questions, I would guess based on my experience teaching 50,000+ students on Udemy that you might enjoy this course. If for any reason I am wrong, you have 30 days to ask Udemy for a refund. With 98% of students enjoying this course enough to not ask for a refund and 50+ students posting good reviews, I can guess the odds of you enjoying this course are very high!Thank you very much for reading all of this! Ermin and I hope to see you as a student in the course when we next meet!</p>\n', 2, 50, '2022-05-26 06:21:10', 50, '2022-05-26 06:21:10', 'hp655B.tmp.webp'),
(12, 'Build Responsive Real-World Websites with HTML and', '<h2>Requirements</h2>\n\n<ul>\n	<li>\n	<p>No coding or design experience necessary</p>\n	</li>\n	<li>\n	<p>Any computer works &mdash; Windows, macOS or Linux</p>\n	</li>\n	<li>\n	<p>You don&rsquo;t need to buy any software &mdash; we will use the best free code editor in the world</p>\n	</li>\n</ul>\n\n<h2>Description</h2>\n\n<p><strong><em>*** The #1 bestselling HTML and CSS course on Udemy! ***</em></strong></p>\n\n<p><strong><em>*** Completely re-built from scratch in July 2021 (35+ hours video) ***</em></strong></p>\n\n<p><em>&quot;Having gone through other related courses on other platforms, I can say this course is the most practical and readily applicable course on web design and development I have taken.&quot; &mdash; Bernie Pacis</em></p>\n\n<p>&nbsp;</p>\n\n<p>Open a new browser tab, type in <strong><em>www.omnifood.dev</em></strong>, and take a look around. I will wait here...</p>\n\n<p>...</p>\n\n<p>Amazing, right? What if you knew exactly how to design and build a website like that, completely from scratch? How amazing would that be?</p>\n\n<p>Well, I&#39;m here to teach you<strong> HTML, CSS, and web design, all by building the stunning website that you just saw</strong>, step-by-step.</p>\n\n<p>So, after finishing this course, you will know exactly how to build a beautiful, professional, and ready-to-launch website just like Omnifood, by following a 7-step process. And it will even look great on any computer, tablet, and smartphone.</p>\n\n<p>But what if you want to build a completely different website? Well, no problem! I designed the course curriculum with exactly this goal: to <strong>enable you to design and build any website that you can think of, not just copy the course project</strong>.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>So, in order to become a confident and independent developer, capable of building your own websites in the future, you will learn:</strong></p>\n\n<ul>\n	<li>\n	<p>The fundamentals of modern and semantic HTML, CSS, and building layouts in a small separate project, which will prepare you for the main course project (<em>www.omnifood.dev</em>). This includes modern flexbox and CSS Grid!</p>\n	</li>\n	<li>\n	<p>How to design beautiful websites, by learning a web design framework I created just for this course. It consists of easy-to-use guidelines for design aspects like typography, colors, images, spacing, and more (this is like a small standalone course!).</p>\n	</li>\n	<li>\n	<p>How to use well-established website components and layout patterns in order to come up with professional-looking designs</p>\n	</li>\n	<li>\n	<p>How to make any website work on any mobile device, no matter the design and layout (responsive design)</p>\n	</li>\n	<li>\n	<p>How to use the 7 steps of building a professional website in practice: planning, sketching, designing, building, testing, optimizing, and launching</p>\n	</li>\n	<li>\n	<p>How to find and use free design assets such as images, fonts, and icons</p>\n	</li>\n	<li>\n	<p>Important developer skills such as reading documentation, fixing code errors on your own, and using professional web development tools</p>\n	</li>\n</ul>\n\n<p><strong>Does this sound like fun? Then join me and 200,000+ other developers and start building websites today!</strong></p>\n\n<p><em>Or are you not sold yet and need to know more? No problem, just keep reading...</em></p>\n\n<p>&nbsp;</p>\n\n<p><strong>[01] Why should you learn HTML and CSS in the first place?</strong></p>\n\n<p>Building websites allows you to do <strong>fun and creative work, from anywhere in the world, and it even pays well</strong>. Web development is one of the <strong>most future-proof and highest-paying industries</strong> in the world. And HTML and CSS is the entry point to this world!</p>\n\n<p>But you already know all this, that&#39;s why you want to learn HTML and CSS too. Well, you came to the right place!</p>\n\n<p>This is the best and most complete course for starting your web development journey that you will find on Udemy. It&#39;s an <strong>all-in-one package</strong> that takes you from knowing nothing about HTML and CSS, to building beautiful websites using tools and technologies that professional web developers use every single day.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>[02] Why is this course so unique and popular?</strong></p>\n\n<p><strong><em>Reason #1: The course is completely project-based</em></strong></p>\n\n<p>Simple demos are boring, and therefore you&#39;re gonna learn everything by <strong>building actual projects</strong>! In the final project (<em>www.omnifood.dev</em>), together we hand-code a beautiful and responsive landing page for a <strong>fictional company</strong> that I made up just for the course.</p>\n\n<p>&nbsp;</p>\n\n<p><strong><em>Reason #2: You will not just learn how to code</em></strong></p>\n\n<p>Coding is great, but it&#39;s not everything! That&#39;s why we will go through the entire <strong>7-step process</strong> of building and launching our website project.</p>\n\n<p>So the huge Omnifood project will teach you <strong>real-world skills to build real-world HTML and CSS websites</strong>: how to plan projects and page layouts, how to implement designs using HTML and CSS techniques, how to write clean and organized code, how to optimize websites for good speed performance, and many more.</p>\n\n<p>On top of that, this course has a <strong>huge focus on beautiful design</strong>. In fact, this is the only course on the market that focuses on both coding and designing, together.</p>\n\n<p>&nbsp;</p>\n\n<p><strong><em>Reason #3: I&#39;m the right teacher for you</em></strong></p>\n\n<p>With the right guidance and a well-structured curriculum, building websites can be <strong>quite easy and fun to learn</strong>. With a bunch of random tutorials and YouTube videos? Not so much. And that&#39;s where I come in.</p>\n\n<p>My name is Jonas, I&#39;m an experienced web developer and designer, and one of Udemy&#39;s top instructors. I have been teaching this bestselling course since 2015 to over 200,000 developers, always listening to feedback and understanding exactly how students actually learn.</p>\n\n<p>Using that feedback, I recently rebuilt this course from scratch and <strong>designed the ideal course curriculum</strong> for every type of student. It&#39;s a <strong>unique blend</strong> of projects, deep explanations, theory lectures, and challenges. I&#39;m sure you&#39;re gonna love it!</p>\n\n<p>&nbsp;</p>\n\n<p><strong>[03] Why is this course so long?</strong></p>\n\n<p><strong>Reason #1:</strong> I take time to <strong>explain every single concept</strong> that I teach, so that you actually learn, and not just copy code from the screen (<strong>this is a course</strong>, not a tutorial)</p>\n\n<p><strong>Reason #2:</strong> I go into topics that other HTML and CSS courses shy away from: professional web design, component and layout patterns, some CSS theory, website planning in theory and practice, and developer skills. I believe you need all of this to be successful!</p>\n\n<p><strong>Reason #3:</strong> There is a lot of repetition, so that you actually <strong>assimilate and practice</strong> what you learn. Practice is the single most important ingredient to learning, and therefore I provide plenty of opportunities for you to sharpen your skills</p>\n\n<p>&nbsp;</p>\n\n<p><strong>[04] Here is what&#39;s also included in the package:</strong></p>\n\n<ul>\n	<li>\n	<p>Up-to-date HD-quality videos, that are easy to search and reference (great for Udemy Business students)</p>\n	</li>\n	<li>\n	<p>Professional English captions (not the&nbsp;auto-generated ones)</p>\n	</li>\n	<li>\n	<p>Downloadable design assets + starter code and final code for each section</p>\n	</li>\n	<li>\n	<p>Downloadable slides for 20+ theory videos (not boring, I promise!)</p>\n	</li>\n	<li>\n	<p>Access to countless free design and development resources that I curated over many years</p>\n	</li>\n	<li>\n	<p>Free support in the course Q&amp;A</p>\n	</li>\n	<li>\n	<p>10+ coding challenges to practice your new skills (solutions included)</p>\n	</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><strong>[05] This course is for you if...</strong></p>\n\n<ul>\n	<li>\n	<p>... you are a complete beginner with no idea of how to build a website.</p>\n	</li>\n	<li>\n	<p>... you already know a bit of HTML and CSS from some tutorials or videos, but struggle to put together a good-looking, complete website.</p>\n	</li>\n	<li>\n	<p>... you are a designer and want to expand your skills into HTML and CSS, because all your designer friends are learning how to code (they are smart!).</p>\n	</li>\n</ul>\n\n<p>Basically, if you are an HTML and CSS master, and build the most beautiful websites in the world, then DON&#39;T take the course. Everyone else: you should take the course, today.</p>\n\n<p>&nbsp;</p>\n\n<p><strong><em>So, does all of this sound great? Then join me and 200,000+ other developers and start your web development journey today!</em></strong></p>\n\n<h2>Who this course is for:</h2>\n\n<ul>\n	<li>Complete beginners who want to learn how to build a professional, beautiful and responsive website</li>\n	<li>Students with some knowledge about HTML and CSS, but who struggle to put together a great website</li>\n	<li>Designers who want to expand their skill set into HTML5 and CSS3</li>\n</ul>\n', 1, 50, '2022-05-26 06:28:28', 50, '2022-05-26 06:28:28', 'hp13CF.tmp.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_discussion`
--

CREATE TABLE `tbl_discussion` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 1,
  `replied_to` int(11) DEFAULT 1,
  `message` varchar(255) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_discussion`
--

INSERT INTO `tbl_discussion` (`id`, `model`, `model_id`, `user_id`, `replied_to`, `message`, `created_on`, `created_by_id`, `updated_on`) VALUES
(43, 'app\\models\\Feed', 30, 51, 1, 'Great keep working on it ', '2022-05-26 05:55:52', 51, '2022-05-26 05:55:52'),
(44, 'app\\models\\Feed', 30, 50, 1, 'You will finish it', '2022-05-26 05:56:57', 50, '2022-05-26 05:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_email_tempalte`
--

CREATE TABLE `tbl_email_tempalte` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `html` text NOT NULL,
  `json` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_email_tempalte`
--

INSERT INTO `tbl_email_tempalte` (`id`, `type_id`, `html`, `json`, `created_by`, `created_on`, `updated_on`) VALUES
(1, 4, '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n<head>\n<!--[if gte mso 9]>\n<xml>\n  <o:OfficeDocumentSettings>\n    <o:AllowPNG/>\n    <o:PixelsPerInch>96</o:PixelsPerInch>\n  </o:OfficeDocumentSettings>\n</xml>\n<![endif]-->\n  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <meta name=\"x-apple-disable-message-reformatting\">\n  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\n  <title></title>\n  \n    <style type=\"text/css\">\n      @media only screen and (min-width: 520px) {\n  .u-row {\n    width: 500px !important;\n  }\n  .u-row .u-col {\n    vertical-align: top;\n  }\n\n  .u-row .u-col-100 {\n    width: 500px !important;\n  }\n\n}\n\n@media (max-width: 520px) {\n  .u-row-container {\n    max-width: 100% !important;\n    padding-left: 0px !important;\n    padding-right: 0px !important;\n  }\n  .u-row .u-col {\n    min-width: 320px !important;\n    max-width: 100% !important;\n    display: block !important;\n  }\n  .u-row {\n    width: calc(100% - 40px) !important;\n  }\n  .u-col {\n    width: 100% !important;\n  }\n  .u-col > div {\n    margin: 0 auto;\n  }\n}\nbody {\n  margin: 0;\n  padding: 0;\n}\n\ntable,\ntr,\ntd {\n  vertical-align: top;\n  border-collapse: collapse;\n}\n\np {\n  margin: 0;\n}\n\n.ie-container table,\n.mso-container table {\n  table-layout: fixed;\n}\n\n* {\n  line-height: inherit;\n}\n\na[x-apple-data-detectors=\'true\'] {\n  color: inherit !important;\n  text-decoration: none !important;\n}\n\ntable, td { color: #000000; } </style>\n  \n  \n\n</head>\n\n<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">\n  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\n  <tbody>\n  <tr style=\"vertical-align: top\">\n    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->\n    \n\n<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n      \n<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">\n  <div style=\"width: 100% !important;\">\n  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n  \n<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n  <tbody>\n    <tr>\n      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n        \n  <h1 style=\"margin: 0px; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-family: arial,helvetica,sans-serif; font-size: 22px;\">\n    Heading\n  </h1>\n\n      </td>\n    </tr>\n  </tbody>\n</table>\n\n<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n  <tbody>\n    <tr>\n      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n        \n  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n    <p style=\"font-size: 14px; line-height: 140%;\">This is a new Text block. Change the text.</p>\n  </div>\n\n      </td>\n    </tr>\n  </tbody>\n</table>\n\n<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n  <tbody>\n    <tr>\n      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n        \n<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n  <tr>\n    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n      \n      <img align=\"center\" border=\"0\" src=\"https://cdn.tools.unlayer.com/image/placeholder.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\n      \n    </td>\n  </tr>\n</table>\n\n      </td>\n    </tr>\n  </tbody>\n</table>\n\n  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n  </div>\n</div>\n<!--[if (mso)|(IE)]></td><![endif]-->\n      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n    </div>\n  </div>\n</div>\n\n\n    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n    </td>\n  </tr>\n  </tbody>\n  </table>\n  <!--[if mso]></div><![endif]-->\n  <!--[if IE]></div><![endif]-->\n</body>\n\n</html>\n', '{\"counters\":{\"u_column\":1,\"u_row\":1,\"u_content_heading\":1,\"u_content_text\":1,\"u_content_image\":1},\"body\":{\"id\":\"O34DlNe4nJ\",\"rows\":[{\"id\":\"wVFH6YfLFv\",\"cells\":[1],\"columns\":[{\"id\":\"sU81YpEToX\",\"contents\":[{\"id\":\"407AZNTk_U\",\"type\":\"heading\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"headingType\":\"h1\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"fontSize\":\"22px\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_heading_1\",\"htmlClassNames\":\"u_content_heading\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"Heading\"}},{\"id\":\"df8aPvVw2b\",\"type\":\"text\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"textAlign\":\"left\",\"lineHeight\":\"140%\",\"linkStyle\":{\"inherit\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_text_1\",\"htmlClassNames\":\"u_content_text\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true,\"text\":\"<p style=\\\"font-size: 14px; line-height: 140%;\\\">This is a new Text block. Change the text.</p>\"}},{\"id\":\"yjdsd4KzmR\",\"type\":\"image\",\"values\":{\"containerPadding\":\"10px\",\"anchor\":\"\",\"src\":{\"url\":\"https://cdn.tools.unlayer.com/image/placeholder.png\",\"width\":800,\"height\":200},\"textAlign\":\"center\",\"altText\":\"\",\"action\":{\"name\":\"web\",\"values\":{\"href\":\"\",\"target\":\"_blank\"}},\"displayCondition\":null,\"_meta\":{\"htmlID\":\"u_content_image_1\",\"htmlClassNames\":\"u_content_image\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"backgroundColor\":\"\",\"padding\":\"0px\",\"border\":{},\"_meta\":{\"htmlID\":\"u_column_1\",\"htmlClassNames\":\"u_column\"}}}],\"values\":{\"displayCondition\":null,\"columns\":false,\"backgroundColor\":\"\",\"columnsBackgroundColor\":\"\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":false,\"center\":true,\"cover\":false},\"padding\":\"0px\",\"anchor\":\"\",\"hideDesktop\":false,\"_meta\":{\"htmlID\":\"u_row_1\",\"htmlClassNames\":\"u_row\"},\"selectable\":true,\"draggable\":true,\"duplicatable\":true,\"deletable\":true,\"hideable\":true}}],\"values\":{\"popupPosition\":\"center\",\"popupWidth\":\"600px\",\"popupHeight\":\"auto\",\"borderRadius\":\"10px\",\"contentAlign\":\"center\",\"contentVerticalAlign\":\"center\",\"contentWidth\":\"500px\",\"fontFamily\":{\"label\":\"Arial\",\"value\":\"arial,helvetica,sans-serif\"},\"textColor\":\"#000000\",\"popupBackgroundColor\":\"#FFFFFF\",\"popupBackgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":false,\"center\":true,\"cover\":true},\"popupOverlay_backgroundColor\":\"rgba(0, 0, 0, 0.1)\",\"popupCloseButton_position\":\"top-right\",\"popupCloseButton_backgroundColor\":\"#DDDDDD\",\"popupCloseButton_iconColor\":\"#000000\",\"popupCloseButton_borderRadius\":\"0px\",\"popupCloseButton_margin\":\"0px\",\"popupCloseButton_action\":{\"name\":\"close_popup\",\"attrs\":{\"onClick\":\"document.querySelector(\'.u-popup-container\').style.display = \'none\';\"}},\"backgroundColor\":\"#e7e7e7\",\"backgroundImage\":{\"url\":\"\",\"fullWidth\":true,\"repeat\":false,\"center\":true,\"cover\":false},\"preheaderText\":\"\",\"linkStyle\":{\"body\":true,\"linkColor\":\"#0000ee\",\"linkHoverColor\":\"#0000ee\",\"linkUnderline\":true,\"linkHoverUnderline\":true},\"_meta\":{\"htmlID\":\"u_body\",\"htmlClassNames\":\"u_body\"}}},\"schemaVersion\":8}', 1, '2022-05-30 23:28:34', '2022-05-30 23:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feed`
--

CREATE TABLE `tbl_feed` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `state_id` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feed`
--

INSERT INTO `tbl_feed` (`id`, `title`, `desciption`, `created_on`, `created_by_id`, `updated_on`, `image`, `state_id`) VALUES
(30, 'Working on project', 'its been 4 months since i\'m working on this project yet alot of the work is pending', '2022-05-26 05:54:38', 1, '2022-05-26 05:54:38', 'hp1866.tmp.gif', 1),
(31, 'Good morning Everyone', '', '2022-05-26 06:12:04', 3, '2022-05-26 06:12:04', 'hpED4.tmp.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow`
--

CREATE TABLE `tbl_follow` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_follow`
--

INSERT INTO `tbl_follow` (`id`, `model`, `model_id`, `user_id`, `created_on`, `updated_on`) VALUES
(1, 'app\\models\\Users', 1, 50, '2022-05-26 07:12:56', '2022-05-26 07:12:56'),
(2, 'app\\models\\Users', 3, 50, '2022-05-26 07:12:58', '2022-05-26 07:12:58'),
(3, 'app\\models\\Users', 35, 50, '2022-05-26 07:13:01', '2022-05-26 07:13:01'),
(4, 'app\\models\\Users', 46, 50, '2022-05-26 07:13:02', '2022-05-26 07:13:02'),
(5, 'app\\models\\Users', 47, 50, '2022-05-26 07:13:03', '2022-05-26 07:13:03'),
(6, 'app\\models\\Users', 48, 50, '2022-05-26 07:13:06', '2022-05-26 07:13:06'),
(7, 'app\\models\\Users', 50, 50, '2022-05-26 07:13:06', '2022-05-26 07:13:06'),
(9, 'app\\models\\Users', 1, 51, '2022-05-26 07:13:31', '2022-05-26 07:13:31'),
(10, 'app\\models\\Users', 3, 51, '2022-05-26 07:13:31', '2022-05-26 07:13:31'),
(11, 'app\\models\\Users', 46, 51, '2022-05-26 07:13:33', '2022-05-26 07:13:33'),
(12, 'app\\models\\Users', 48, 51, '2022-05-26 07:13:36', '2022-05-26 07:13:36'),
(13, 'app\\models\\Users', 1, 3, '2022-05-26 07:14:02', '2022-05-26 07:14:02'),
(15, 'app\\models\\Users', 3, 3, '2022-05-26 07:14:07', '2022-05-26 07:14:07'),
(16, 'app\\models\\Users', 46, 3, '2022-05-26 07:14:09', '2022-05-26 07:14:09'),
(17, 'app\\models\\Users', 35, 3, '2022-05-26 07:14:12', '2022-05-26 07:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE `tbl_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like`
--

CREATE TABLE `tbl_like` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_like`
--

INSERT INTO `tbl_like` (`id`, `model`, `model_id`, `user_id`, `created_on`, `updated_on`) VALUES
(1, 'app\\models\\Feed', 30, 1, '2022-05-26 05:54:55', '2022-05-26 05:54:55'),
(2, 'app\\models\\Feed', 30, 51, '2022-05-26 05:55:26', '2022-05-26 05:55:26'),
(3, 'app\\models\\Feed', 30, 50, '2022-05-26 05:56:28', '2022-05-26 05:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_message`
--

INSERT INTO `tbl_message` (`id`, `message`, `user_id`, `created_by`, `created_on`, `updated_on`) VALUES
(9, 'yo', 1, 3, '2022-05-29 11:07:07', '2022-05-29 11:07:07'),
(10, 'Hii', 1, 3, '2022-05-29 15:32:23', '2022-05-29 15:32:23'),
(11, 'erer', 3, 1, '2022-05-29 15:43:45', '2022-05-29 15:43:45'),
(12, 'hiii', 1, 35, '2022-05-29 15:43:55', '2022-05-29 15:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `type_id` tinyint(4) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `model` varchar(25) DEFAULT NULL,
  `model_id` int(10) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `title`, `type_id`, `state_id`, `to_user_id`, `model`, `model_id`, `icon`, `created_on`, `created_by_id`) VALUES
(1, 'New Manager', 1, 1, 1, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(2, 'New Manager', 1, 1, 3, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(3, 'New Manager', 1, 1, 6, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(4, 'New Manager', 1, 1, 35, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(5, 'New Manager', 1, 1, 38, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(6, 'New Manager', 1, 1, 45, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(7, 'New Manager', 1, 1, 47, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(8, 'New Manager', 1, 1, 48, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(9, 'New Manager', 1, 1, 50, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(10, 'New Manager', 1, 1, 89, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(11, 'New Manager', 1, 1, 90, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(12, 'Welcome', 4, 1, 90, 'app\\models\\Users', 90, 'user', '2022-05-26 06:01:20', 1),
(13, 'Updated social link', 3, 1, 3, 'app\\models\\SocialLink', 1, 'share-alt', '2022-05-26 06:06:07', 3),
(14, 'Updated social link', 3, 1, 3, 'app\\models\\SocialLink', 2, 'share-alt', '2022-05-26 06:06:07', 3),
(15, 'Updated social link', 3, 1, 3, 'app\\models\\SocialLink', 3, 'share-alt', '2022-05-26 06:06:07', 3),
(16, 'Followed by Trainer', 1, 1, 1, 'app\\models\\Follow', 1, 'users', '2022-05-26 07:12:56', 50),
(17, 'Followed by Trainer', 1, 1, 3, 'app\\models\\Follow', 3, 'users', '2022-05-26 07:12:58', 50),
(18, 'Followed by Trainer', 1, 1, 35, 'app\\models\\Follow', 35, 'users', '2022-05-26 07:13:01', 50),
(19, 'Followed by Trainer', 1, 1, 46, 'app\\models\\Follow', 46, 'users', '2022-05-26 07:13:02', 50),
(20, 'Followed by Trainer', 1, 1, 47, 'app\\models\\Follow', 47, 'users', '2022-05-26 07:13:03', 50),
(21, 'Followed by Trainer', 1, 1, 48, 'app\\models\\Follow', 48, 'users', '2022-05-26 07:13:06', 50),
(22, 'Followed by Trainer', 1, 1, 50, 'app\\models\\Follow', 50, 'users', '2022-05-26 07:13:06', 50),
(23, 'Followed by Trainer', 1, 1, 51, 'app\\models\\Follow', 51, 'users', '2022-05-26 07:13:06', 50),
(24, 'Followed by Student', 1, 1, 1, 'app\\models\\Follow', 1, 'users', '2022-05-26 07:13:31', 51),
(25, 'Followed by Student', 1, 1, 3, 'app\\models\\Follow', 3, 'users', '2022-05-26 07:13:31', 51),
(26, 'Followed by Student', 1, 1, 46, 'app\\models\\Follow', 46, 'users', '2022-05-26 07:13:33', 51),
(27, 'Followed by Student', 1, 1, 48, 'app\\models\\Follow', 48, 'users', '2022-05-26 07:13:36', 51),
(28, 'Followed by Satnam Dass', 1, 1, 1, 'app\\models\\Follow', 1, 'users', '2022-05-26 07:14:02', 3),
(29, 'Followed by Satnam Dass', 1, 1, 3, 'app\\models\\Follow', 3, 'users', '2022-05-26 07:14:02', 3),
(30, 'Followed by Satnam Dass', 1, 1, 3, 'app\\models\\Follow', 3, 'users', '2022-05-26 07:14:07', 3),
(31, 'Followed by Satnam Dass', 1, 1, 46, 'app\\models\\Follow', 46, 'users', '2022-05-26 07:14:09', 3),
(32, 'Followed by Satnam Dass', 1, 1, 35, 'app\\models\\Follow', 35, 'users', '2022-05-26 07:14:12', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_skill`
--

CREATE TABLE `tbl_skill` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `skill` varchar(25) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_skill`
--

INSERT INTO `tbl_skill` (`id`, `model`, `model_id`, `skill`, `created_on`, `updated_on`, `level`) VALUES
(1, 'app\\models\\Users', 3, 'Php', '2022-05-26 06:06:21', '2022-05-26 06:06:21', 1),
(2, 'app\\models\\Users', 3, 'java', '2022-05-26 06:06:30', '2022-05-26 06:06:30', 1),
(3, 'app\\models\\Users', 3, 'Html', '2022-05-26 06:06:40', '2022-05-26 06:06:40', 2),
(4, 'app\\models\\Users', 3, 'css', '2022-05-26 06:06:48', '2022-05-26 06:06:48', 2),
(5, 'app\\models\\Users', 3, 'Jquery', '2022-05-26 06:07:06', '2022-05-26 06:07:06', 2),
(6, 'app\\models\\Users', 3, 'Ajax', '2022-05-26 06:07:14', '2022-05-26 06:07:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_link`
--

CREATE TABLE `tbl_social_link` (
  `id` int(11) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_social_link`
--

INSERT INTO `tbl_social_link` (`id`, `platform`, `link`, `user_id`, `created_on`, `updated_on`) VALUES
(1, 'website', 'Website.com', 3, '2022-05-26 06:06:07', '2022-05-26 06:06:07'),
(2, 'github', 'github.com/codguy', 3, '2022-05-26 06:06:07', '2022-05-26 06:06:07'),
(3, 'instagram', '@_codeguy23', 3, '2022-05-26 06:06:07', '2022-05-26 06:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `roll_id` tinyint(3) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `dob` date DEFAULT NULL,
  `authKey` varchar(10) NOT NULL,
  `accessToken` varchar(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profile_picture` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(25) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `email`, `password`, `roll_id`, `state_id`, `dob`, `authKey`, `accessToken`, `gender`, `profile_picture`, `created_on`, `created_by_id`, `updated_on`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin@123', 1, 1, '2000-01-01', 'admin99', '99tokens', 'Male', '', '2022-04-03 05:50:08', 1, '2022-05-10 09:47:31'),
(3, 'Satnam Dass', 'satnam@gmail.com', 'satnam@123', 1, 1, '1999-09-11', 'sat99', '99tokens', 'Male', 'hpA067.tmp.jpg', '2022-04-03 05:50:08', 1, '2022-05-10 09:47:31'),
(35, 'Bobby Singh', 'bobby@gmail.com', 'bobby@123', 2, 1, '2001-03-15', 'test866.ke', '866-token', 'Male', 'hpA416.tmp.jpg', '2022-04-03 14:51:05', 1, '2022-05-10 09:45:21'),
(46, 'harish', 'harish@gmail.com', 'admin@123', 4, 1, '2019-12-24', 'test102.ke', '102-token', 'Female', 'hp5F97.tmp.jpg', '2022-04-27 18:54:20', 35, '2022-05-10 09:46:08'),
(47, 'admin', 'admin@gmail.com', 'admin@123', 1, 1, '2000-01-01', 'test335.ke', '335-token', 'Male', 'hp994.tmp.jpg', '2022-04-30 14:29:35', 3, '2022-05-10 09:46:52'),
(48, 'Harish kumar', 'harish@gmil.com', 'admin@123', 1, 1, '2022-04-29', 'test482.ke', '482-token', 'Male', 'hpC45D.tmp.jpg', '2022-04-30 15:22:28', 3, '2022-05-10 09:46:34'),
(50, 'Trainer', 'trainer@gmail.com', 'admin@123', 3, 1, '1989-07-27', 'test828.ke', '828-token', 'Male', 'pexels-photo-774909.jpeg', '2022-05-09 17:59:09', 47, '2022-05-09 17:59:09'),
(51, 'Student', 'student@gmail.com', 'admin@123', 4, 1, '2004-01-23', 'test482.ke', '482-token', 'Male', 'hp5A03.tmp.jpg', '2022-05-09 17:59:38', 47, '2022-05-10 09:48:18'),
(54, 'pedakado', 'pedakado@gmail.com', 'admin@123', 4, 1, '2016-06-17', 'test733.ke', '733-token', 'Female', 'avatar-3.jpg', '2022-05-22 08:22:43', 1, '2022-05-22 08:22:43'),
(90, 'Sanjay Kabir', 'sanjay@gmail.com', 'admin@123', 2, 1, '2022-05-03', 'test424', '424-token', 'Male', '', '2022-05-26 06:01:20', 1, '2022-05-26 06:01:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_chapter`
--
ALTER TABLE `tbl_chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_discussion`
--
ALTER TABLE `tbl_discussion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_email_tempalte`
--
ALTER TABLE `tbl_email_tempalte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `model` (`model`,`model_id`,`user_id`);

--
-- Indexes for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_like`
--
ALTER TABLE `tbl_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`model`,`model_id`,`user_id`);

--
-- Indexes for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`to_user_id`);

--
-- Indexes for table `tbl_skill`
--
ALTER TABLE `tbl_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social_link`
--
ALTER TABLE `tbl_social_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`platform`,`link`,`user_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`username`,`email`,`roll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_chapter`
--
ALTER TABLE `tbl_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_discussion`
--
ALTER TABLE `tbl_discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_email_tempalte`
--
ALTER TABLE `tbl_email_tempalte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_like`
--
ALTER TABLE `tbl_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_skill`
--
ALTER TABLE `tbl_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_social_link`
--
ALTER TABLE `tbl_social_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `fk-post-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
