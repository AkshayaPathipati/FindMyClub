CREATE DATABASE IF NOT EXISTS huddle;
USE huddle;


CREATE TABLE University (
    university_id INT PRIMARY KEY,
    name          VARCHAR(150) NOT NULL UNIQUE,
    city          VARCHAR(80) NOT NULL,
    website       VARCHAR(255)
);

CREATE TABLE Club (
    club_id        INT PRIMARY KEY AUTO_INCREMENT,
    university_id  INT NOT NULL,
    name           VARCHAR(150) NOT NULL,
    description    TEXT,
    founded_year   INT,
    contact_email  VARCHAR(255),
    status         ENUM('Active', 'Inactive')
                   NOT NULL DEFAULT 'Active',
    logo_url       VARCHAR(500),
    updated_at     TIMESTAMP NOT NULL
                   DEFAULT CURRENT_TIMESTAMP
                   ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_club_university
        FOREIGN KEY (university_id)
        REFERENCES University(university_id),

    CONSTRAINT uq_club_university_name
        UNIQUE (university_id, name),

    CONSTRAINT chk_club_founded_year
        CHECK (founded_year IS NULL OR founded_year >= 1800)
);