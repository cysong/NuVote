
# Users table
DELIMITER //

CREATE TRIGGER prevent_voter_role_update
    BEFORE UPDATE ON users
    FOR EACH ROW
BEGIN
    -- Check if the old role is 'voter' and if the role is being changed
    IF OLD.role = 'voter' AND NEW.role != OLD.role THEN
        -- Raise an error to prevent the update
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot update role for users with the role ''voter''';
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER prevent_scrutineer_admin_to_voter_update
    BEFORE UPDATE ON users
    FOR EACH ROW
BEGIN
    -- Check if the old role is 'scrutineer' and the new role is 'voter'
    IF OLD.role = 'scrutineer' AND NEW.role = 'voter' THEN
        -- Raise an error to prevent the update
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot change role from scrutineer to voter';
    END IF;

    -- Additionally, check if the old role is 'admin' and the new role is 'voter'
    IF OLD.role = 'admin' AND NEW.role = 'voter' THEN
        -- Raise an error to prevent the update
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot change role from admin to voter';
    END IF;
END//

DELIMITER ;


# votes table

DELIMITER //

CREATE TRIGGER prevent_non_voters_from_voting
    BEFORE INSERT ON votes
    FOR EACH ROW
BEGIN
    DECLARE user_role ENUM('voter', 'scrutineer', 'admin');

    -- Retrieve the role of the user who is attempting to vote
    SELECT role INTO user_role
    FROM users
    WHERE user_id = NEW.voted_by;

    -- Check if the role is not 'voter'
    IF user_role != 'voter' THEN
        -- Raise an error to prevent the insert
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only users with the role ''voter'' can vote';
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER verify_vote_time_before_insert
    BEFORE INSERT ON votes
    FOR EACH ROW
BEGIN
    DECLARE comp_start DATETIME;
    DECLARE comp_end DATETIME;

    -- Retrieve the start and end dates of the competition
    SELECT start_date, end_date INTO comp_start, comp_end
    FROM competitions
    WHERE competition_id = NEW.competition_id;

    -- Check if the vote is within the competition's start and end dates
    IF NEW.voted_at < comp_start OR NEW.voted_at > comp_end THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Vote time must be between the start and end dates of the competition.';
    END IF;
END//

DELIMITER ;



# competitions

DELIMITER //

CREATE TRIGGER prevent_non_admin_from_inserting_competitions
    BEFORE INSERT ON competitions
    FOR EACH ROW
BEGIN
    DECLARE user_role ENUM('voter', 'scrutineer', 'admin');

    -- Retrieve the role of the user who is attempting to insert
    SELECT role INTO user_role
    FROM users
    WHERE user_id = NEW.create_by;

    -- Check if the role is not 'admin'
    IF user_role != 'admin' THEN
        -- Raise an error to prevent the insert
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only users with the role ''admin'' can insert into the competitions table';
    END IF;
END//

DELIMITER ;


# announcements

DELIMITER //

CREATE TRIGGER prevent_user_from_inserting_announcements
    BEFORE INSERT ON announcements
    FOR EACH ROW
BEGIN
    DECLARE user_role ENUM('voter', 'scrutineer', 'admin');

    -- Retrieve the role of the user who is attempting to insert
    SELECT role INTO user_role
    FROM users
    WHERE user_id = NEW.created_by;

    -- Check if the role is not 'admin'
    IF user_role = 'voter' THEN
        -- Raise an error to prevent the insert
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only users with the role ''admin/scrutineer'' can insert into the announcements table';
    END IF;
END//

DELIMITER ;
