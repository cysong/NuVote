-- -----------------------------------------------------
-- Insert additional users
-- -----------------------------------------------------
INSERT INTO users (username, first_name, last_name, location, email, description, profile_image, password_hash, role,
                   status, created_at)
VALUES ('jack', 'Jack', 'Smith', 'New York', 'jack.smith@example.com', 'Enthusiastic voter',
        '/static/uploads/profile_images/profileimage1.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'admin', 'active', NOW()),
       ('jane', 'Jane', 'Doe', 'Los Angeles', 'jane.doe@example.com', 'Active in community voting',
        '/static/uploads/profile_images/profileimage2.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'admin', 'active', NOW()),
       ('admin', 'Grace', 'Clark', 'Boston', 'grace.clark@example.com', 'Admin team member',
        '/static/uploads/profile_images/profileimage48.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'admin', 'active', NOW()),
       ('henry', 'Henry', 'Lewis', 'Las Vegas', 'henry.lewis@example.com', 'System administrator',
        '/static/uploads/profile_images/profileimage49.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'admin', 'active', NOW()),
       ('ivy', 'Ivy', 'Walker', 'Denver', 'ivy.walker@example.com', 'Manages user accounts',
        '/static/uploads/profile_images/profileimage50.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'admin', 'active', NOW()),
       ('daniel', 'Daniel', 'Lee', 'Houston', 'daniel.lee@example.com', 'A responsible scrutineer',
        '/static/uploads/profile_images/profileimage45.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'scrutineer', 'active', NOW()),
       ('eva', 'Eva', 'Harris', 'Phoenix', 'eva.harris@example.com', 'Meticulous scrutineer',
        '/static/uploads/profile_images/profileimage46.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'scrutineer', 'active', NOW()),
       ('frank', 'Frank', 'Martin', 'San Diego', 'frank.martin@example.com', 'Ensures fair play',
        '/static/uploads/profile_images/profileimage47.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'scrutineer', 'active', NOW()),
       ('michael', 'Michael', 'Taylor', 'Dallas', 'michael.taylor@example.com', 'Passionate about elections',
        '/static/uploads/profile_images/profileimage3.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'scrutineer', 'active', NOW()),
       ('lisa', 'Lisa', 'Miller', 'Austin', 'lisa.miller@example.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage4.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'scrutineer', 'active', NOW()),
       ('noah', 'Noah', 'Wilson', 'Seattle', 'noah.wilson@example.com', 'Committed voter',
        '/static/uploads/profile_images/profileimage5.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('olivia', 'Olivia', 'Anderson', 'San Jose', 'olivia.anderson@example.com', 'Community-minded voter',
        '/static/uploads/profile_images/profileimage6.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('matthew', 'Matthew', 'Thomas', 'San Diego', 'matthew.thomas@example.com', 'Civic-minded participant',
        '/static/uploads/profile_images/profileimage7.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('sophia', 'Sophia', 'Jackson', 'San Francisco', 'sophia.jackson@example.com', 'Engaged in local voting',
        '/static/uploads/profile_images/profileimage8.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('william', 'William', 'Martinez', 'Las Vegas', 'william.martinez@example.com', 'Dedicated voter',
        '/static/uploads/profile_images/profileimage9.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('emma', 'Emma', 'White', 'Chicago', 'emma.white@example.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage10.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('lucas', 'Lucas', 'Harris', 'Miami', 'lucas.harris@example.com', 'Active voter',
        '/static/uploads/profile_images/profileimage11.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('ava', 'Ava', 'Clark', 'Austin', 'ava.clark@example.com', 'Regular participant',
        '/static/uploads/profile_images/profileimage12.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('ethan', 'Ethan', 'Lewis', 'Dallas', 'ethan.lewis@example.com', 'Votes frequently',
        '/static/uploads/profile_images/profileimage13.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('susam', 'Mia', 'Walker', 'Houston', 'mia.walker@example.com', 'Dedicated to voting',
        '/static/uploads/profile_images/profileimage14.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('james', 'James', 'Young', 'Philadelphia', 'james.young@example.com', 'Active in elections',
        '/static/uploads/profile_images/profileimage15.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('amelia', 'Amelia', 'King', 'San Diego', 'amelia.king@example.com', 'Community voter',
        '/static/uploads/profile_images/profileimage16.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('benjamin', 'Benjamin', 'Scott', 'San Jose', 'benjamin.scott@example.com', 'Engaged voter',
        '/static/uploads/profile_images/profileimage17.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('oliver', 'Oliver', 'Adams', 'Seattle', 'oliver.adams@example.com', 'Passionate about voting',
        '/static/uploads/profile_images/profileimage18.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('isabella', 'Isabella', 'Mitchell', 'New York', 'isabella.mitchell@example.com', 'Votes actively',
        '/static/uploads/profile_images/profileimage19.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('jacob', 'Jacob', 'Perez', 'Miami', 'jacob.perez@example.com', 'Regular voter',
        '/static/uploads/profile_images/profileimage20.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('harper', 'Harper', 'Turner', 'Philadelphia', 'harper.turner@example.com', 'Community-focused voter',
        '/static/uploads/profile_images/profileimage21.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('charlotte', 'Charlotte', 'Collins', 'San Francisco', 'charlotte.collins@example.com', 'Engaged in voting',
        '/static/uploads/profile_images/profileimage22.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('lily', 'Lily', 'Davis', 'Dallas', 'lily.davis@example.com', 'Civic-minded voter',
        '/static/uploads/profile_images/profileimage23.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('henrlery', 'Henry', 'Hernandez', 'San Jose', 'henry.hernandez@example.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage24.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('natalie', 'Natalie', 'Gonzalez', 'San Diego', 'natalie.gonzalez@example.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage25.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('seph', 'Joseph', 'Wright', 'Houston', 'joseph.wright@example.com', 'Active in community voting',
        '/static/uploads/profile_images/profileimage26.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('daisy', 'Daisy', 'Roberts', 'Chicago', 'daisy.roberts@example.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage27.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('aiden', 'Aiden', 'Hall', 'Los Angeles', 'aiden.hall@example.com', 'Engaged in elections',
        '/static/uploads/profile_images/profileimage28.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('evelyn', 'Evelyn', 'Allen', 'San Francisco', 'evelyn.allen@example.com', 'Regular participant',
        '/static/uploads/profile_images/profileimage29.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('caleb', 'Caleb', 'Mitchell', 'Austin', 'caleb.mitchell@example.com', 'Community-minded voter',
        '/static/uploads/profile_images/profileimage30.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('scarlett', 'Scarlett', 'Rodriguez', 'Dallas', 'scarlett.rodriguez@example.com', 'Civic-focused voter',
        '/static/uploads/profile_images/profileimage31.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('julia', 'Julia', 'Foster', 'Seattle', 'julia.foster@example.com', 'Engaged in voting',
        '/static/uploads/profile_images/profileimage32.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('isaac', 'Isaac', 'Cox', 'San Diego', 'isaac.cox@example.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage33.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('mia', 'Mia', 'Ward', 'Houston', 'mia.ward@example.com', 'Active voter',
        '/static/uploads/profile_images/profileimage34.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('zachary', 'Zachary', 'Fisher', 'Chicago', 'zachary.fisher@example.com', 'Community-focused voter',
        '/static/uploads/profile_images/profileimage35.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('grace', 'Grace', 'Price', 'Philadelphia', 'grace.price@example.com', 'Engaged in elections',
        '/static/uploads/profile_images/profileimage36.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('ryan', 'Ryan', 'Cook', 'San Francisco', 'ryan.cook@example.com', 'Regular participant',
        '/static/uploads/profile_images/profileimage37.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('samantha', 'Samantha', 'Bell', 'San Jose', 'samantha.bell@example.com', 'Votes actively',
        '/static/uploads/profile_images/profileimage38.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('austin', 'Austin', 'Murphy', 'Dallas', 'austin.murphy@example.com', 'Community-minded voter',
        '/static/uploads/profile_images/profileimage39.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('elizabeth', 'Elizabeth', 'Morgan', 'Austin', 'elizabeth.morgan@example.com', 'Engaged in elections',
        '/static/uploads/profile_images/profileimage40.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('nathan', 'Nathan', 'Perry', 'San Diego', 'nathan.perry@example.com', 'Active in community voting',
        '/static/uploads/profile_images/profileimage41.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('lillian', 'Lillian', 'Long', 'San Jose', 'lillian.long@example.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage42.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('joseph', 'Joseph', 'Nguyen', 'San Francisco', 'joseph.nguyen@example.com', 'Regular voter',
        '/static/uploads/profile_images/profileimage43.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),
       ('sofia', 'Sofia', 'Rogers', 'Los Angeles', 'sofia.rogers@example.com', 'Community-focused voter',
        '/static/uploads/profile_images/profileimage44.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter1', 'Lillian', 'Liu', 'San Jose', 'voter1@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage50.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter2', 'Joseph', 'Nguyen', 'San Francisco', 'voter2@email.com', 'Regular voter',
        '/static/uploads/profile_images/profileimage51.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter3', 'Sophia', 'Lee', 'Los Angeles', 'voter3@email.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage52.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter4', 'Michael', 'Smith', 'New York', 'voter4@email.com', 'Informed voter',
        '/static/uploads/profile_images/profileimage53.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter5', 'Emma', 'Garcia', 'Houston', 'voter5@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage54.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter6', 'Noah', 'Johnson', 'Chicago', 'voter6@email.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage55.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter7', 'Olivia', 'Martinez', 'Phoenix', 'voter7@email.com', 'First-time voter',
        '/static/uploads/profile_images/profileimage56.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter8', 'James', 'Brown', 'Philadelphia', 'voter8@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage57.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter9', 'Isabella', 'Davis', 'San Antonio', 'voter9@email.com', 'Community leader',
        '/static/uploads/profile_images/profileimage58.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter10', 'Benjamin', 'Wilson', 'San Diego', 'voter10@email.com', 'Long-time voter',
        '/static/uploads/profile_images/profileimage59.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter11', 'Mia', 'Anderson', 'Dallas', 'voter11@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage60.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter12', 'Lucas', 'Thomas', 'San Jose', 'voter12@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage61.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter13', 'Amelia', 'Taylor', 'Austin', 'voter13@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage62.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter14', 'Mason', 'Moore', 'Jacksonville', 'voter14@email.com', 'Votes every election',
        '/static/uploads/profile_images/profileimage63.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter15', 'Harper', 'Hernandez', 'Fort Worth', 'voter15@email.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage64.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter16', 'Ethan', 'Lopez', 'Columbus', 'voter16@email.com', 'Informed voter',
        '/static/uploads/profile_images/profileimage65.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter17', 'Evelyn', 'Gonzalez', 'San Francisco', 'voter17@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage66.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter18', 'Carter', 'Clark', 'Charlotte', 'voter18@email.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage67.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter19', 'Avery', 'Rodriguez', 'Indianapolis', 'voter19@email.com', 'First-time voter',
        '/static/uploads/profile_images/profileimage68.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter20', 'James', 'Lewis', 'San Francisco', 'voter20@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage69.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter21', 'Sofia', 'Walker', 'Seattle', 'voter21@email.com', 'Community leader',
        '/static/uploads/profile_images/profileimage70.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter22', 'Oliver', 'Hall', 'Denver', 'voter22@email.com', 'Long-time voter',
        '/static/uploads/profile_images/profileimage71.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter23', 'Charlotte', 'Allen', 'Washington', 'voter23@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage72.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter24', 'Elijah', 'Young', 'Boston', 'voter24@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage73.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter25', 'Amelia', 'King', 'Nashville', 'voter25@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage74.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter26', 'Aiden', 'Wright', 'Oklahoma City', 'voter26@email.com', 'Votes every election',
        '/static/uploads/profile_images/profileimage75.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter27', 'Scarlett', 'Scott', 'Las Vegas', 'voter27@email.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage76.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter28', 'Jack', 'Green', 'Portland', 'voter28@email.com', 'Informed voter',
        '/static/uploads/profile_images/profileimage77.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter29', 'Victoria', 'Baker', 'Tucson', 'voter29@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage78.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter30', 'Daniel', 'Adams', 'Detroit', 'voter30@email.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage79.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter31', 'Grace', 'Nelson', 'Memphis', 'voter31@email.com', 'First-time voter',
        '/static/uploads/profile_images/profileimage80.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter32', 'Henry', 'Carter', 'Louisville', 'voter32@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage81.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter33', 'Chloe', 'Mitchell', 'Baltimore', 'voter33@email.com', 'Community leader',
        '/static/uploads/profile_images/profileimage82.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter34', 'Sebastian', 'Perez', 'Milwaukee', 'voter34@email.com', 'Long-time voter',
        '/static/uploads/profile_images/profileimage83.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter35', 'Riley', 'Roberts', 'Albuquerque', 'voter35@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage84.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter36', 'Liam', 'Turner', 'Fresno', 'voter36@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage85.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter37', 'Zoe', 'Phillips', 'Mesa', 'voter37@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage86.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter38', 'Matthew', 'Campbell', 'Sacramento', 'voter38@email.com', 'Votes every election',
        '/static/uploads/profile_images/profileimage87.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter39', 'Lily', 'Parker', 'Kansas City', 'voter39@email.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage88.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter40', 'Alexander', 'Evans', 'Long Beach', 'voter40@email.com', 'Informed voter',
        '/static/uploads/profile_images/profileimage89.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter41', 'Aria', 'Edwards', 'Virginia Beach', 'voter41@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage90.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter42', 'William', 'Collins', 'Omaha', 'voter42@email.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage91.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter43', 'Ellie', 'Stewart', 'Miami', 'voter43@email.com', 'First-time voter',
        '/static/uploads/profile_images/profileimage92.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter44', 'Jayden', 'Morris', 'Tulsa', 'voter44@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage93.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter45', 'Layla', 'Rogers', 'Oakland', 'voter45@email.com', 'Community leader',
        '/static/uploads/profile_images/profileimage94.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter46', 'Jackson', 'Reed', 'Cleveland', 'voter46@email.com', 'Long-time voter',
        '/static/uploads/profile_images/profileimage95.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter47', 'Grace', 'Cook', 'Minneapolis', 'voter47@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage96.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter48', 'Grayson', 'Morgan', 'Wichita', 'voter48@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage97.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter49', 'Aubrey', 'Bell', 'New Orleans', 'voter49@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage98.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter50', 'David', 'Murphy', 'Arlington', 'voter50@email.com', 'Votes every election',
        '/static/uploads/profile_images/profileimage99.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter51', 'Emily', 'Bailey', 'Tampa', 'voter51@email.com', 'Passionate voter',
        '/static/uploads/profile_images/profileimage100.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter52', 'Mason', 'Rivera', 'Aurora', 'voter52@email.com', 'Informed voter',
        '/static/uploads/profile_images/profileimage101.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter53', 'Ella', 'Cooper', 'Anaheim', 'voter53@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage102.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter54', 'Logan', 'Richardson', 'Corpus Christi', 'voter54@email.com', 'Votes regularly',
        '/static/uploads/profile_images/profileimage103.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter55', 'Scarlett', 'Gomez', 'Riverside', 'voter55@email.com', 'First-time voter',
        '/static/uploads/profile_images/profileimage104.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter56', 'Lucas', 'Ward', 'Lexington', 'voter56@email.com', 'Engaged citizen',
        '/static/uploads/profile_images/profileimage105.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter57', 'Victoria', 'Torres', 'Stockton', 'voter57@email.com', 'Community leader',
        '/static/uploads/profile_images/profileimage106.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter58', 'Henry', 'Ramirez', 'Henderson', 'voter58@email.com', 'Long-time voter',
        '/static/uploads/profile_images/profileimage107.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter59', 'Sophie', 'Morgan', 'Saint Paul', 'voter59@email.com', 'Community advocate',
        '/static/uploads/profile_images/profileimage108.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW()),

       ('voter60', 'Oliver', 'Peterson', 'Cincinnati', 'voter60@email.com', 'Votes with enthusiasm',
        '/static/uploads/profile_images/profileimage109.jpg', '1b9d5850d6de1dae5bde79bdcc0ecc91b8bebbda244e545007d2ac19bcfa2eb1',
        'voter', 'active', NOW());

-- -----------------------------------------------------
-- Insert competitions
-- -----------------------------------------------------
INSERT INTO competitions (name, description, image, start_date, end_date, status, create_by, created_at)
VALUES ('New Zealand Dog in 2022',
        'Celebrate the agility, strength, and loyalty of dogs in this annual competition. From high-energy obstacle courses to demonstrations of incredible obedience, this event showcases the best in canine talent, drawing participants and spectators from across the country.',
        '/static/uploads/competition_images/dogcompetition.png', '2022-08-01', '2022-09-30', 'approved', 1,
        '2022-07-15 23:50:26'),
       ('New Zealand Bee in 2023',
        'A buzzing competition that puts the spotlight on our hard-working pollinators. This event is dedicated to showcasing the skills and speed of bees in pollination challenges, honey production, and hive-building activities. A unique and engaging way to celebrate these vital creatures.',
        '/static/uploads/competition_images/beecompetition.png', '2023-08-01', '2023-09-30', 'finished', 2,
        '2023-07-15 23:50:26'),
       ('New Zealand Bird in 2024',
        'A vibrant celebration of the country’s avian diversity. This competition invites bird enthusiasts to showcase the beauty and talents of their feathered friends, from singing competitions to displays of unique plumage. It’s a colorful and lively event that draws nature lovers from all corners.',
        '/static/uploads/competition_images/birdcompetition.png', '2024-08-01', '2024-09-30', 'on_going', 3,
        '2024-07-11 23:50:26'),
       ('New Zealand Deer in 2025',
        'An impressive showcase of the elegance and majesty of deer. This competition highlights the finest stags and does, focusing on attributes such as antler growth, agility, and overall health. A must-see for wildlife enthusiasts and those passionate about conservation.',
        '/static/uploads/competition_images/deercompetition.png', '2025-09-01', '2025-09-15', 'in_plan', 4, NOW());

INSERT INTO competitors (name, description, image, competition_id, status, author, create_by, created_at)
VALUES ('Spring Paws', 'A lively young dog with exceptional agility and enthusiasm, ready to shine in the competition.',
        '/static/uploads/competitor_images/dogs/dogcompetitor1.jpg', 1, 'attending', 'Samuel', 1,
        '2022-07-16 23:50:26'),
       ('Sunrise Jumper', 'An energetic dog known for its high jumps and incredible stamina in agility courses.',
        '/static/uploads/competitor_images/dogs/dogcompetitor2.jpg', 1, 'attending', 'john_doe', 2,
        '2022-07-16 23:50:26'),
       ('Nature’s Howl', 'A dog with a unique and powerful howl, capturing the essence of the wild.',
        '/static/uploads/competitor_images/dogs/dogcompetitor3.jpg', 1, 'attending', 'jane_smith', 3,
        '2022-07-16 23:50:26'),
       ('Summer Fetcher', 'A champion retriever, excelling in fetching competitions and beach activities.',
        '/static/uploads/competitor_images/dogs/dogcompetitor4.jpg', 1, 'attending', 'admin', 1, '2022-07-16 23:50:26'),
       ('Sunset Sprinter', 'A lightning-fast sprinter, known for its speed and agility on the course.',
        '/static/uploads/competitor_images/dogs/dogcompetitor5.jpg', 1, 'attending', 'john_doe', 2,
        '2022-07-16 23:50:26'),
       ('Wave Chaser', 'A dog that loves to chase waves, bringing energy and excitement to every run.',
        '/static/uploads/competitor_images/dogs/dogcompetitor6.jpg', 1, 'attending', 'jane_smith', 3,
        '2022-07-16 23:50:26'),
       ('Autumn Barker', 'A dog with a distinctive bark, perfectly attuned to the sounds of the autumn woods.',
        '/static/uploads/competitor_images/dogs/dogcompetitor7.jpg', 1, 'attending', 'admin', 1, '2022-07-16 23:50:26'),
       ('Golden Retriever', 'A skilled retriever with a golden coat, known for its precision and grace.',
        '/static/uploads/competitor_images/dogs/dogcompetitor8.jpg', 1, 'attending', 'john_doe', 2,
        '2022-07-16 23:50:26'),
       ('Mystic Sniffer', 'A dog with an extraordinary sense of smell, able to track even the faintest scents.',
        '/static/uploads/competitor_images/dogs/dogcompetitor9.jpg', 1, 'attending', 'jane_smith', 3,
        '2022-07-16 23:50:26'),
       ('Winter Tail', 'A dog with a thick coat and impressive endurance, thriving in winter conditions.',
        '/static/uploads/competitor_images/dogs/dogcompetitor10.jpg', 1, 'attending', 'admin', 1,
        '2022-07-16 23:50:26'),

       ('Honey Buzz', 'A highly skilled bee known for producing the sweetest honey and exceptional hive management.',
        '/static/uploads/competitor_images/bees/beecompetitor1.jpg', 2, 'attending', 'Samuel', 5,
        '2023-07-17 23:50:26'),
       ('Pollen Queen', 'A bee with a knack for collecting the most pollen, ensuring vibrant and healthy blooms.',
        '/static/uploads/competitor_images/bees/beecompetitor2.jpg', 2, 'attending', 'John_Doe', 6,
        '2023-07-17 23:50:26'),
       ('Nectar Collector', 'An expert in nectar gathering, contributing to top-quality honey production.',
        '/static/uploads/competitor_images/bees/beecompetitor3.jpg', 2, 'attending', 'Jane_Smith', 7,
        '2023-07-17 23:50:26'),
       ('Buzzing Champion', 'A champion in hive communication, known for its complex and effective dance patterns.',
        '/static/uploads/competitor_images/bees/beecompetitor4.jpg', 2, 'attending', 'Admin', 8, '2023-07-17 23:50:26'),
       ('Golden Wings', 'A bee with impressive flying skills, capable of covering large areas in search of nectar.',
        '/static/uploads/competitor_images/bees/beecompetitor5.jpg', 2, 'attending', 'Samuel', 9,
        '2023-07-17 23:50:26'),
       ('Hive Architect', 'Renowned for its ability to build intricate and efficient hive structures.',
        '/static/uploads/competitor_images/bees/beecompetitor6.jpg', 2, 'attending', 'John_Doe', 3,
        '2023-07-17 23:50:26'),
       ('Pollen Power', 'A bee known for its strength in transporting large amounts of pollen back to the hive.',
        '/static/uploads/competitor_images/bees/beecompetitor7.jpg', 2, 'attending', 'Jane_Smith', 5,
        '2023-07-17 23:50:26'),
       ('Nectar Ninja', 'An agile bee with remarkable speed and precision in nectar collection.',
        '/static/uploads/competitor_images/bees/beecompetitor8.jpg', 2, 'attending', 'Admin', 6, '2023-07-17 23:50:26'),
       ('Sweet Spinner', 'A bee specializing in spinning honey into a variety of delicious forms.',
        '/static/uploads/competitor_images/bees/beecompetitor9.jpg', 2, 'attending', 'Samuel', 7,
        '2023-07-17 23:50:26'),
       ('Autumn Blower',
        'An expert at foraging during the autumn season, contributing to a rich and diverse honey flavor.',
        '/static/uploads/competitor_images/bees/beecompetitor10.jpg', 2, 'attending', 'John_Doe', 8,
        '2023-07-17 23:50:26'),

       ('Sky Soarer', 'An awe-inspiring bird known for its exceptional flight skills and high-altitude soaring.',
        '/static/uploads/competitor_images/birds/birdcompetitor1.jpg', 3, 'attending', 'Samuel', 5,
        '2024-07-13 10:50:26'),
       ('Forest Melody', 'A bird with a beautiful and melodious song, enchanting audiences with its tunes.',
        '/static/uploads/competitor_images/birds/birdcompetitor2.jpg', 3, 'attending', 'John_Doe', 6,
        '2024-07-13 10:50:26'),
       ('Feathered Dancer', 'A bird renowned for its graceful and intricate dance moves during courtship.',
        '/static/uploads/competitor_images/birds/birdcompetitor3.jpg', 3, 'attending', 'Jane_Smith', 7,
        '2024-07-13 10:50:26'),
       ('Bright Plumage', 'A bird with strikingly colorful feathers, making it a visual standout in the competition.',
        '/static/uploads/competitor_images/birds/birdcompetitor4.jpg', 3, 'attending', 'Admin', 8,
        '2024-07-13 10:50:26'),
       ('Mountain Flyer', 'An expert in navigating rugged mountain terrains with agility and precision.',
        '/static/uploads/competitor_images/birds/birdcompetitor5.jpg', 3, 'attending', 'Samuel', 9,
        '2024-07-13 10:50:26'),
       ('Jungle Chatter', 'Known for its diverse and complex vocalizations, a true performer in the avian world.',
        '/static/uploads/competitor_images/birds/birdcompetitor6.jpg', 3, 'attending', 'John_Doe', 2,
        '2024-07-13 10:50:26'),
       ('Ocean Glider', 'A bird with exceptional skills in gliding over the ocean, known for its effortless flight.',
        '/static/uploads/competitor_images/birds/birdcompetitor7.jpg', 3, 'attending', 'Jane_Smith', 5,
        '2024-07-13 10:50:26'),
       ('Desert Nomad', 'Adapted to harsh desert conditions, known for its resilience and unique survival skills.',
        '/static/uploads/competitor_images/birds/birdcompetitor8.jpg', 3, 'attending', 'Admin', 6,
        '2024-07-13 10:50:26'),
       ('Swamp Specter',
        'A bird with mysterious and elusive behavior, often seen in the quiet and hidden corners of swamps.',
        '/static/uploads/competitor_images/birds/birdcompetitor9.jpg', 3, 'attending', 'Samuel', 7,
        '2024-07-13 10:50:26'),
       ('Highland Herald',
        'A bird from the highlands, known for its strong and clear calls that echo across the mountains.',
        '/static/uploads/competitor_images/birds/birdcompetitor10.jpg', 3, 'attending', 'John_Doe', 8,
        '2024-07-13 10:50:26'),

       ('Majestic Stag', 'A regal stag with impressive antlers, known for its commanding presence and grace.',
        '/static/uploads/competitor_images/deers/deercompetitor1.jpg', 4, 'attending', 'Samuel', 4, NOW()),
       ('Forest Guardian',
        'A strong and protective deer, revered for its role in maintaining the balance of the forest.',
        '/static/uploads/competitor_images/deers/deercompetitor2.jpg', 4, 'attending', 'John_Doe', 6, NOW()),
       ('Gentle Doe', 'A graceful doe with a gentle demeanor, admired for its beauty and elegance in the wild.',
        '/static/uploads/competitor_images/deers/deercompetitor3.jpg', 4, 'attending', 'Jane_Smith', 7, NOW()),
       ('Winter Walker', 'A deer adapted to cold climates, known for its endurance and adaptability in snowy terrains.',
        '/static/uploads/competitor_images/deers/deercompetitor4.jpg', 4, 'attending', 'Admin', 8, NOW()),
       ('Autumn Roamer',
        'A deer that thrives in autumn, with a striking coat that blends seamlessly with the fall foliage.',
        '/static/uploads/competitor_images/deers/deercompetitor5.jpg', 4, 'attending', 'Samuel', 9, NOW()),
       ('Mountain Prince',
        'A majestic deer from the highlands, known for its impressive antler spread and robust physique.',
        '/static/uploads/competitor_images/deers/deercompetitor6.jpg', 4, 'attending', 'John_Doe', 1, NOW()),
       ('Meadow Dancer', 'A lively deer that is known for its playful movements and elegance while grazing in meadows.',
        '/static/uploads/competitor_images/deers/deercompetitor7.jpg', 4, 'attending', 'Jane_Smith', 5, NOW()),
       ('River Watcher',
        'A deer that is often seen near rivers, known for its keen awareness and agility around water.',
        '/static/uploads/competitor_images/deers/deercompetitor8.jpg', 4, 'attending', 'Admin', 6, NOW()),
       ('Sunset Strider',
        'A deer with a distinctive appearance, often spotted at dusk with a stunning silhouette against the setting sun.',
        '/static/uploads/competitor_images/deers/deercompetitor9.jpg', 4, 'attending', 'Samuel', 7, NOW()),
       ('Evergreen Sentinel',
        'A deer that stands out in evergreen forests, known for its resilience and enduring presence throughout the year.',
        '/static/uploads/competitor_images/deers/deercompetitor10.jpg', 4, 'attending', 'John_Doe', 8, NOW());

-- -----------------------------------------------------
-- Insert votes
-- -----------------------------------------------------
INSERT INTO votes (competition_id, competitor_id, voted_by, status, voted_ip, voted_at)
VALUES
    -- Votes for competition 1
    (1, 4, 18, 'valid', '192.168.1.18', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 5, 19, 'valid', '192.168.1.19', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 6, 20, 'valid', '192.168.1.20', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 7, 21, 'valid', '192.168.1.21', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 8, 22, 'valid', '192.168.1.22', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 9, 23, 'valid', '192.168.1.23', '2022-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 10, 24, 'valid', '192.168.1.24', '2022-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 1, 25, 'valid', '192.168.1.25', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 2, 26, 'valid', '192.168.1.26', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 3, 27, 'valid', '192.168.1.27', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 4, 28, 'valid', '192.168.1.28', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 5, 29, 'valid', '192.168.1.29', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 6, 30, 'valid', '192.168.1.30', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 7, 31, 'valid', '192.168.1.31', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 8, 32, 'valid', '192.168.1.32', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 9, 33, 'valid', '192.168.1.33', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 10, 34, 'valid', '192.168.1.34', '2022-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 1, 51, 'valid', '192.168.1.51', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 2, 52, 'valid', '192.168.1.52', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 3, 53, 'valid', '192.168.1.53', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 4, 54, 'valid', '192.168.1.54', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 5, 55, 'valid', '192.168.1.55', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 6, 56, 'valid', '192.168.1.56', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 7, 57, 'valid', '192.168.1.57', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 8, 58, 'valid', '192.168.1.58', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 9, 59, 'valid', '192.168.1.59', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 10, 60, 'valid', '192.168.1.60', '2022-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 1, 61, 'valid', '192.168.1.61', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 2, 62, 'valid', '192.168.1.62', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 3, 63, 'valid', '192.168.1.63', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 4, 64, 'valid', '192.168.1.64', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 5, 65, 'valid', '192.168.1.65', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 6, 66, 'valid', '192.168.1.66', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 7, 67, 'valid', '192.168.1.67', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 8, 68, 'valid', '192.168.1.68', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 9, 69, 'valid', '192.168.1.69', '2022-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (1, 10, 70, 'valid', '192.168.1.70', '2022-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2022-09-29', '2022-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for competition 2
    (2, 1, 11, 'valid', '192.168.1.11', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 1, 12, 'valid', '192.168.1.12', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 1, 13, 'valid', '192.168.1.13', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 1, 14, 'valid', '192.168.1.14', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 1, 15, 'valid', '192.168.1.15', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 2
    (2, 2, 16, 'valid', '192.168.1.16', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 17, 'valid', '192.168.1.17', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 18, 'valid', '192.168.1.18', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 19, 'valid', '192.168.1.19', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 20, 'valid', '192.168.1.20', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 21, 'valid', '192.168.1.21', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 22, 'valid', '192.168.1.22', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 23, 'valid', '192.168.1.23', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 2, 24, 'valid', '192.168.1.24', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 3
    (2, 3, 25, 'valid', '192.168.1.25', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 26, 'valid', '192.168.1.26', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 27, 'valid', '192.168.1.27', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 28, 'valid', '192.168.1.28', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 29, 'valid', '192.168.1.29', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 30, 'valid', '192.168.1.30', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 3, 31, 'valid', '192.168.1.31', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 4
    (2, 4, 32, 'valid', '192.168.1.32', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 4, 33, 'valid', '192.168.1.33', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 4, 34, 'valid', '192.168.1.34', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 4, 35, 'valid', '192.168.1.35', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 4, 36, 'valid', '192.168.1.36', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 5
    (2, 5, 37, 'valid', '192.168.1.37', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 5, 38, 'valid', '192.168.1.38', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 5, 39, 'valid', '192.168.1.39', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 5, 40, 'valid', '192.168.1.40', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 5, 41, 'valid', '192.168.1.41', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 5, 42, 'valid', '192.168.1.42', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 6
    (2, 6, 43, 'valid', '192.168.1.43', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 6, 44, 'valid', '192.168.1.44', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 6, 51, 'valid', '192.168.1.51', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 6, 52, 'valid', '192.168.1.52', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 6, 53, 'valid', '192.168.1.53', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 7
    (2, 7, 54, 'valid', '192.168.1.54', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 7, 55, 'valid', '192.168.1.55', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 7, 56, 'valid', '192.168.1.56', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 7, 57, 'valid', '192.168.1.57', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 7, 58, 'valid', '192.168.1.58', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 8
    (2, 8, 59, 'valid', '192.168.1.59', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 8, 60, 'valid', '192.168.1.60', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 8, 61, 'valid', '192.168.1.61', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 8, 62, 'valid', '192.168.1.62', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 9
    (2, 9, 63, 'valid', '192.168.1.63', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 9, 64, 'valid', '192.168.1.64', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 9, 65, 'valid', '192.168.1.65', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 9, 66, 'valid', '192.168.1.66', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 9, 67, 'valid', '192.168.1.67', '2023-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 10
    (2, 10, 68, 'valid', '192.168.1.68', '2023-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 10, 69, 'valid', '192.168.1.69', '2023-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 10, 70, 'valid', '192.168.1.70', '2023-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 10, 71, 'valid', '192.168.1.71', '2023-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (2, 10, 72, 'valid', '192.168.1.72', '2023-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2023-09-29', '2023-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for competition 3
    (3, 1, 45, 'valid', '192.168.1.1', '2024-08-01' +
                                       INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                       INTERVAL FLOOR(RAND() * 24) HOUR +
                                       INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 46, 'valid', '192.168.1.2', '2024-08-01' +
                                       INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                       INTERVAL FLOOR(RAND() * 24) HOUR +
                                       INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 47, 'valid', '192.168.1.3', '2024-08-01' +
                                       INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                       INTERVAL FLOOR(RAND() * 24) HOUR +
                                       INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 48, 'valid', '192.168.1.4', '2024-08-01' +
                                       INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                       INTERVAL FLOOR(RAND() * 24) HOUR +
                                       INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 49, 'valid', '192.168.1.5', '2024-08-01' +
                                       INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                       INTERVAL FLOOR(RAND() * 24) HOUR +
                                       INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 71, 'valid', '192.168.1.71', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 1, 72, 'valid', '192.168.1.72', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 2
    (3, 2, 11, 'valid', '192.168.1.11', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 12, 'valid', '192.168.1.12', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 13, 'valid', '192.168.1.13', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 14, 'valid', '192.168.1.14', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 15, 'valid', '192.168.1.15', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 16, 'valid', '192.168.1.16', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 17, 'valid', '192.168.1.17', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 18, 'valid', '192.168.1.18', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 19, 'valid', '192.168.1.19', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 73, 'valid', '192.168.1.73', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 74, 'valid', '192.168.1.74', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 2, 75, 'valid', '192.168.1.75', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),


    -- Votes for Competitor 3
    (3, 3, 20, 'valid', '192.168.1.20', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 21, 'valid', '192.168.1.21', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 22, 'valid', '192.168.1.22', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 23, 'valid', '192.168.1.23', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 24, 'valid', '192.168.1.24', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 25, 'valid', '192.168.1.25', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 3, 26, 'valid', '192.168.1.26', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 4
    (3, 4, 27, 'valid', '192.168.1.27', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 28, 'valid', '192.168.1.28', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 29, 'valid', '192.168.1.29', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 30, 'valid', '192.168.1.30', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 31, 'valid', '192.168.1.31', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 32, 'valid', '192.168.1.32', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 76, 'valid', '192.168.1.76', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 77, 'valid', '192.168.1.77', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 4, 78, 'valid', '192.168.1.78', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 5
    (3, 5, 33, 'valid', '192.168.1.33', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 34, 'valid', '192.168.1.34', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 35, 'valid', '192.168.1.35', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 36, 'valid', '192.168.1.36', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 37, 'valid', '192.168.1.37', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 38, 'valid', '192.168.1.38', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 79, 'valid', '192.168.1.79', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 80, 'valid', '192.168.1.80', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 81, 'valid', '192.168.1.81', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 82, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 83, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 84, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 85, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 86, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 87, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 88, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 89, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 90, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 91, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 92, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 93, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 94, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 95, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 96, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 97, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 98, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 5, 99, 'valid', '192.168.1.82', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 6
    (3, 6, 39, 'valid', '192.168.1.39', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 6, 40, 'valid', '192.168.1.40', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 6, 41, 'valid', '192.168.1.41', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 6, 42, 'valid', '192.168.1.42', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 6, 43, 'valid', '192.168.1.43', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 6, 44, 'valid', '192.168.1.44', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 7
    (3, 7, 51, 'valid', '192.168.1.51', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 7, 52, 'valid', '192.168.1.52', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 7, 53, 'valid', '192.168.1.53', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 7, 54, 'valid', '192.168.1.54', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 7, 55, 'valid', '192.168.1.55', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 8
    (3, 8, 56, 'valid', '192.168.1.56', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 57, 'valid', '192.168.1.57', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 58, 'valid', '192.168.1.58', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 59, 'valid', '192.168.1.59', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 60, 'valid', '192.168.1.60', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 100, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 101, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 102, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 103, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 104, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 105, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 106, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 107, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 108, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 109, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 8, 110, 'valid', '192.168.1.100', '2024-08-01' +
                                          INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                          INTERVAL FLOOR(RAND() * 24) HOUR +
                                          INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 9
    (3, 9, 61, 'valid', '192.168.1.61', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 9, 62, 'valid', '192.168.1.62', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 9, 63, 'valid', '192.168.1.63', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 9, 64, 'valid', '192.168.1.64', '2024-08-01' +
                                        INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                        INTERVAL FLOOR(RAND() * 24) HOUR +
                                        INTERVAL FLOOR(RAND() * 60) MINUTE),

    -- Votes for Competitor 10
    (3, 10, 65, 'valid', '192.168.1.65', '2024-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 10, 66, 'valid', '192.168.1.66', '2024-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 10, 67, 'valid', '192.168.1.67', '2024-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 10, 68, 'valid', '192.168.1.68', '2024-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE),
    (3, 10, 69, 'valid', '192.168.1.69', '2024-08-01' +
                                         INTERVAL FLOOR(RAND() * (DATEDIFF('2024-09-29', '2024-08-01') + 1)) DAY +
                                         INTERVAL FLOOR(RAND() * 24) HOUR +
                                         INTERVAL FLOOR(RAND() * 60) MINUTE);

-- -----------------------------------------------------
-- Insert additional announcements
-- -----------------------------------------------------
INSERT INTO announcements (title, content, end_at, status, created_by)
VALUES ('Upcoming Maintenance', 'The platform will undergo maintenance on August 10th. Please save your work.',
        '2024-08-10', 'active', 1),
       ('New Features Released', 'Check out the new features including enhanced profile management.', '2024-08-15',
        'active', 2),
       ('Autumn Art Fair Reminder', 'Don’t forget to participate in the Autumn Art Fair.', '2024-09-15', 'active', 3);
