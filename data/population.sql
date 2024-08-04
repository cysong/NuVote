-- -----------------------------------------------------
-- Insert additional users
-- -----------------------------------------------------
INSERT INTO users (username, first_name, last_name, location, email, description, profile_image, password_hash, role, status, created_at)
VALUES 
('alice', 'Alice', 'Johnson', 'Chicago', 'alice.johnson@example.com', 'A passionate voter', 'alice_johnson.png', 'c33367701511b4f6020ec61ded352059343a528e', 'voter', 'active', NOW()),
('bob', 'Bob', 'Williams', 'Miami', 'bob.williams@example.com', 'An active participant', 'bob_williams.png', '5f4dcc3b5aa765d61d8327deb882cf99', 'voter', 'active', NOW()),
('charlie', 'Charlie', 'Brown', 'San Francisco', 'charlie.brown@example.com', 'Loves to vote', 'charlie_brown.png', 'cfcd208495d565ef66e7dff9f98764da', 'voter', 'active', NOW()),
('daniel', 'Daniel', 'Lee', 'Houston', 'daniel.lee@example.com', 'A responsible scrutineer', 'daniel_lee.png', '3e25960a79dbc69b674cd4ec67a72c62', 'scrutineer', 'active', NOW()),
('eva', 'Eva', 'Harris', 'Phoenix', 'eva.harris@example.com', 'Meticulous scrutineer', 'eva_harris.png', '7c6a180b36896a0a8c02787eeafb0e4c', 'scrutineer', 'active', NOW()),
('frank', 'Frank', 'Martin', 'San Diego', 'frank.martin@example.com', 'Ensures fair play', 'frank_martin.png', '098f6bcd4621d373cade4e832627b4f6', 'scrutineer', 'active', NOW()),
('admin', 'Grace', 'Clark', 'Boston', 'grace.clark@example.com', 'Admin team member', 'grace_clark.png', '9b74c9897bac770ffc029102a200c5de', 'admin', 'active', NOW()),
('henry', 'Henry', 'Lewis', 'Las Vegas', 'henry.lewis@example.com', 'System administrator', 'henry_lewis.png', '1f3870be274f6c49b3e31a0c6728957f', 'admin', 'active', NOW()),
('ivy', 'Ivy', 'Walker', 'Denver', 'ivy.walker@example.com', 'Manages user accounts', 'ivy_walker.png', 'b6d767d2f8ed5d21a44b0e5886680cb9', 'admin', 'active', NOW());

-- -----------------------------------------------------
-- Insert competitions
-- -----------------------------------------------------
INSERT INTO competitions (name, description, image, start_date, end_date, status, create_by, created_at)
VALUES 
('Spring Festival', 'Annual spring festival competition', 'spring_festival.png', '2024-03-01', '2024-03-10', 'finished', 1, NOW()),
('Summer Showdown', 'Summer sports showdown', 'summer_showdown.png', '2024-06-01', '2024-06-20', 'on_going', 2, NOW()),
('Autumn Art Fair', 'Art fair for the autumn season', 'autumn_art_fair.png', '2024-09-01', '2024-09-15', 'in_plan', 3, NOW());

INSERT INTO competitors (name, description, image, competition_id, status, author, create_by, created_at)
VALUES 
('Spring Blossom', 'A talented young singer with a passion for pop music.', 'spring_blossom.png', 1, 'attending', 'admin', 1, NOW()),
('Sunrise Dancer', 'An exceptional dancer specializing in contemporary styles.', 'sunrise_dancer.png', 1, 'attending', 'john_doe', 2, NOW()),
('Nature’s Voice', 'A poet known for nature-themed poetry.', 'natures_voice.png', 1, 'attending', 'jane_smith', 3, NOW()),
('Summer Champion', 'A champion in beach volleyball.', 'summer_champion.png', 2, 'attending', 'admin', 1, NOW()),
('Sunset Sprinter', 'An athlete with a record in sprinting events.', 'sunset_sprinter.png', 2, 'attending', 'john_doe', 2, NOW()),
('Wave Rider', 'An expert surfer who rides the waves effortlessly.', 'wave_rider.png', 2, 'attending', 'jane_smith', 3, NOW()),
('Autumn Painter', 'An artist famous for autumn-themed paintings.', 'autumn_painter.png', 3, 'attending', 'admin', 1, NOW()),
('Golden Sculptor', 'A sculptor who works with precious metals.', 'golden_sculptor.png', 3, 'attending', 'john_doe', 2, NOW()),
('Mystic Calligrapher', 'A calligraphy artist with a mystical style.', 'mystic_calligrapher.png', 3, 'attending', 'jane_smith', 3, NOW());

-- -----------------------------------------------------
-- Insert votes
-- -----------------------------------------------------
INSERT INTO votes (competitor_id, voted_by, status, voted_ip, voted_at)
VALUES 
(1, 1, 'valid', '192.168.1.1', NOW()),
(2, 2, 'valid', '192.168.1.2', NOW()),
(3, 3, 'valid', '192.168.1.3', NOW()),
(4, 1, 'valid', '192.168.1.4', NOW()),
(5, 2, 'valid', '192.168.1.5', NOW()),
(6, 3, 'valid', '192.168.1.6', NOW()),
(7, 1, 'valid', '192.168.1.7', NOW()),
(8, 2, 'valid', '192.168.1.8', NOW()),
(9, 3, 'valid', '192.168.1.9', NOW()),
(1, 1, 'valid', '192.168.1.10', NOW()),
(1, 2, 'valid', '192.168.1.11', NOW()),
(2, 3, 'valid', '192.168.1.12', NOW()),
(3, 1, 'valid', '192.168.1.13', NOW()),
(4, 2, 'valid', '192.168.1.14', NOW()),
(5, 3, 'valid', '192.168.1.15', NOW()),
(6, 1, 'valid', '192.168.1.16', NOW()),
(7, 2, 'valid', '192.168.1.17', NOW()),
(8, 3, 'valid', '192.168.1.18', NOW()),
(9, 1, 'valid', '192.168.1.19', NOW()),
(2, 2, 'valid', '192.168.1.20', NOW()),
(1, 3, 'valid', '192.168.1.21', NOW()),
(2, 1, 'valid', '192.168.1.22', NOW()),
(3, 2, 'valid', '192.168.1.23', NOW()),
(4, 3, 'valid', '192.168.1.24', NOW()),
(5, 1, 'valid', '192.168.1.25', NOW()),
(6, 2, 'valid', '192.168.1.26', NOW()),
(7, 3, 'valid', '192.168.1.27', NOW()),
(8, 1, 'valid', '192.168.1.28', NOW()),
(9, 2, 'valid', '192.168.1.29', NOW()),
(3, 3, 'valid', '192.168.1.30', NOW());

-- -----------------------------------------------------
-- Insert additional announcements
-- -----------------------------------------------------
INSERT INTO announcements (title, content, end_at, status, created_by)
VALUES 
('Upcoming Maintenance', 'The platform will undergo maintenance on August 10th. Please save your work.', '2024-08-10', 'active', 1),
('New Features Released', 'Check out the new features including enhanced profile management.', '2024-08-15', 'active', 2),
('Autumn Art Fair Reminder', 'Don’t forget to participate in the Autumn Art Fair.', '2024-09-15', 'active', 3);
