-- -----------------------------------------------------
-- Insert additional users
-- -----------------------------------------------------
INSERT INTO users (username, first_name, last_name, location, email, description, profile_image, password_hash, role, status, created_at)
VALUES 
('alice', 'Alice', 'Johnson', 'Chicago', 'alice.johnson@example.com', 'A passionate voter', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'voter', 'active', NOW()),
('bob', 'Bob', 'Williams', 'Miami', 'bob.williams@example.com', 'An active participant', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'voter', 'active', NOW()),
('charlie', 'Charlie', 'Brown', 'San Francisco', 'charlie.brown@example.com', 'Loves to vote', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'voter', 'active', NOW()),
('daniel', 'Daniel', 'Lee', 'Houston', 'daniel.lee@example.com', 'A responsible scrutineer', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'scrutineer', 'active', NOW()),
('eva', 'Eva', 'Harris', 'Phoenix', 'eva.harris@example.com', 'Meticulous scrutineer', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'scrutineer', 'active', NOW()),
('frank', 'Frank', 'Martin', 'San Diego', 'frank.martin@example.com', 'Ensures fair play', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'scrutineer', 'active', NOW()),
('admin', 'Grace', 'Clark', 'Boston', 'grace.clark@example.com', 'Admin team member', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'admin', 'active', NOW()),
('henry', 'Henry', 'Lewis', 'Las Vegas', 'henry.lewis@example.com', 'System administrator', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'admin', 'active', NOW()),
('ivy', 'Ivy', 'Walker', 'Denver', 'ivy.walker@example.com', 'Manages user accounts', '/static/images/default_profile.png', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1', 'admin', 'active', NOW());

-- -----------------------------------------------------
-- Insert competitions
-- -----------------------------------------------------
INSERT INTO competitions (name, description, image, start_date, end_date, status, create_by, created_at)
VALUES 
('Spring Festival', 'Annual spring festival competition', '/static/images/default_competition.png.png', '2024-03-01', '2024-03-10', 'finished', 1, NOW()),
('Summer Showdown', 'Summer sports showdown', '/static/images/default_competition.png.png', '2024-06-01', '2024-06-20', 'on_going', 2, NOW()),
('Autumn Art Fair', 'Art fair for the autumn season', '/static/images/default_competition.png.png', '2024-09-01', '2024-09-15', 'in_plan', 3, NOW());

INSERT INTO competitors (name, description, image, competition_id, status, author, create_by, created_at)
VALUES 
('Spring Blossom', 'A talented young singer with a passion for pop music.', '/static/images/logo.png.png', 1, 'attending', 'admin', 1, NOW()),
('Sunrise Dancer', 'An exceptional dancer specializing in contemporary styles.', '/static/images/logo.png', 1, 'attending', 'john_doe', 2, NOW()),
('Nature’s Voice', 'A poet known for nature-themed poetry.', '/static/images/logo.png', 1, 'attending', 'jane_smith', 3, NOW()),
('Summer Champion', 'A champion in beach volleyball.', '/static/images/logo.png', 2, 'attending', 'admin', 1, NOW()),
('Sunset Sprinter', 'An athlete with a record in sprinting events.', '/static/images/logo.png', 2, 'attending', 'john_doe', 2, NOW()),
('Wave Rider', 'An expert surfer who rides the waves effortlessly.', '/static/images/logo.png', 2, 'attending', 'jane_smith', 3, NOW()),
('Autumn Painter', 'An artist famous for autumn-themed paintings.', '/static/images/logo.png', 3, 'attending', 'admin', 1, NOW()),
('Golden Sculptor', 'A sculptor who works with precious metals.', '/static/images/logo.png', 3, 'attending', 'john_doe', 2, NOW()),
('Mystic Calligrapher', 'A calligraphy artist with a mystical style.', '/static/images/logo.png', 3, 'attending', 'jane_smith', 3, NOW());

-- -----------------------------------------------------
-- Insert votes
-- -----------------------------------------------------
INSERT INTO `votes` (`competition_id`, `competitor_id`, `voted_by`, `status`, `voted_ip`) VALUES
	(1, 1, 1, 'valid', '192.168.1.1'),
	(1, 2, 2, 'valid', '192.168.1.2'),
	(1, 3, 3, 'valid', '192.168.1.3'),
	(2, 4, 1, 'valid', '192.168.1.4'),
	(2, 5, 2, 'valid', '192.168.1.5'),
	(2, 6, 3, 'valid', '192.168.1.6'),
	(3, 7, 1, 'valid', '192.168.1.7'),
	(3, 8, 2, 'valid', '192.168.1.8'),
	(3, 9, 3, 'valid', '192.168.1.9'),
	(1, 1, 1, 'valid', '192.168.1.10'),
	(1, 1, 2, 'valid', '192.168.1.11'),
	(1, 2, 3, 'valid', '192.168.1.12'),
	(1, 3, 1, 'valid', '192.168.1.13'),
	(2, 4, 2, 'valid', '192.168.1.14'),
	(2, 5, 3, 'valid', '192.168.1.15'),
	(2, 6, 1, 'valid', '192.168.1.16'),
	(3, 7, 2, 'valid', '192.168.1.17'),
	(3, 8, 3, 'valid', '192.168.1.18'),
	(3, 9, 1, 'valid', '192.168.1.19'),
	(1, 2, 2, 'valid', '192.168.1.20'),
	(1, 1, 3, 'valid', '192.168.1.21'),
	(1, 2, 1, 'valid', '192.168.1.22'),
	(1, 3, 2, 'valid', '192.168.1.23'),
	(2, 4, 3, 'valid', '192.168.1.24'),
	(2, 5, 1, 'valid', '192.168.1.25'),
	(2, 6, 2, 'valid', '192.168.1.26'),
	(3, 7, 3, 'valid', '192.168.1.27'),
	(3, 8, 1, 'valid', '192.168.1.28'),
	(3, 9, 2, 'valid', '192.168.1.29'),
	(1, 3, 3, 'valid', '192.168.1.30');

-- -----------------------------------------------------
-- Insert additional announcements
-- -----------------------------------------------------
INSERT INTO announcements (title, content, end_at, status, created_by)
VALUES 
('Upcoming Maintenance', 'The platform will undergo maintenance on August 10th. Please save your work.', '2024-08-10', 'active', 1),
('New Features Released', 'Check out the new features including enhanced profile management.', '2024-08-15', 'active', 2),
('Autumn Art Fair Reminder', 'Don’t forget to participate in the Autumn Art Fair.', '2024-09-15', 'active', 3);
