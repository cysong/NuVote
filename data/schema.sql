-- -----------------------------------------------------
-- Schema yob (Year Of Bird)
-- -----------------------------------------------------
# DROP SCHEMA IF EXISTS voting;
# CREATE SCHEMA voting;
# USE voting;

-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS users
(
    user_id       INT                                   NOT NULL AUTO_INCREMENT,
    username      VARCHAR(50)                           NOT NULL UNIQUE,
    first_name    VARCHAR(50)                           NOT NULL,
    last_name     VARCHAR(50)                           NOT NULL,
    location      VARCHAR(50)                           NOT NULL,
    email         VARCHAR(320)                          NOT NULL UNIQUE COMMENT 'Maximum email address length according to RFC5321 section 4.5.3.1 is 320 characters (64 for local-part, 1 for at sign, 255 for domain)',
    description   text                                  NOT NULL,
    profile_image VARCHAR(255)                          NOT NULL,
    password_hash CHAR(64)                              NOT NULL COMMENT 'SHA256 password hash stored in hexadecimal (64 characters)',
    role          ENUM ('voter', 'scrutineer', 'admin') NOT NULL,
    status        ENUM ('active', 'inactive')           NOT NULL,
    created_at    TIMESTAMP                             NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

-- -----------------------------------------------------
-- Table competitions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS competitions
(
    competition_id INT                                                         NOT NULL AUTO_INCREMENT,
    name           VARCHAR(255)                                                NOT NULL,
    description    text                                                        NOT NULL,
    image          VARCHAR(255)                                                NOT NULL,
    start_date     datetime                                                    NOT NULL,
    end_date       datetime                                                    NOT NULL,
    status         ENUM ('draft', 'in_plan','on_going', 'finished','approved') NOT NULL,
    create_by      INT                                                         NOT NULL,
    created_at     TIMESTAMP                                                   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`competition_id`),
    FOREIGN KEY (`create_by`) REFERENCES `users` (`user_id`)
);

-- -----------------------------------------------------
-- Table competitors
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS competitors
(
    competitor_id  INT                                NOT NULL AUTO_INCREMENT,
    name           VARCHAR(255)                       NOT NULL,
    description    text                               NOT NULL,
    image          VARCHAR(255)                       NOT NULL,
    competition_id int                                NOT NULL,
    status         ENUM ('win', 'passed','attending') NOT NULL,
    author         VARCHAR(50)                        NOT NULL,
    create_by      INT                                NOT NULL,
    created_at     TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`competitor_id`),
    FOREIGN KEY (`create_by`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table votes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS votes
(
    vote_id        INT                       NOT NULL AUTO_INCREMENT,
    competition_id int                       NOT NULL,
    competitor_id  INT                       NOT NULL,
    voted_by       INT                       NOT NULL,
    status         ENUM ('valid', 'invalid') NOT NULL,
    voted_ip       varchar(64)               NOT NULL,
    voted_at       TIMESTAMP                 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`vote_id`),
    FOREIGN KEY (`competitor_id`) REFERENCES `competitors` (`competitor_id`) ON DELETE CASCADE,
    FOREIGN KEY (`voted_by`) REFERENCES `users` (`user_id`),
    UNIQUE KEY `uniq_comp_voter` (`competition_id`, `voted_by`)
);

-- -----------------------------------------------------
-- Table announcements
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS announcements
(
    announcement_id INT                         NOT NULL AUTO_INCREMENT,
    title           varchar(128)                NOT NULL,
    content         text                NOT NULL,
    end_at          datetime                    NOT NULL,
    status          ENUM ('active', 'inactive') NOT NULL,
    created_by      int                         NOT NULL,
    created_at      TIMESTAMP                   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`announcement_id`),
    FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
);

