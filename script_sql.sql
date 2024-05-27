-- postgreSQL pgAdmin4
CREATE DATABASE "pire2pire" ENCODING "UTF8";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE tags (
    tag_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    zipcode VARCHAR(20) NOT NULL
);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE status (
    status_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE members (
    member_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL,
    birthdate DATE,
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    role_id INTEGER,
    address_id INTEGER,
    CONSTRAINT fk_members_role FOREIGN KEY (role_id) REFERENCES roles(role_id),
    CONSTRAINT fk_members_address FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);

CREATE TABLE modules (
    module_id SERIAL PRIMARY KEY,
    number VARCHAR(10) NOT NULL,
    title VARCHAR(255) NOT NULL,
    objective TEXT,
    duration SMALLINT,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_id INTEGER,
    author_id UUID,
    CONSTRAINT fk_modules_status FOREIGN KEY (status_id) REFERENCES status(status_id),
    CONSTRAINT fk_modules_author FOREIGN KEY (author_id) REFERENCES members(member_id)
);


CREATE TABLE contents (
    content_id SERIAL PRIMARY KEY,
    text TEXT,
    image_url VARCHAR(255),
    video_url VARCHAR(255),
    author_id UUID,
    CONSTRAINT fk_contents_author FOREIGN KEY (author_id) REFERENCES members(member_id)
);

CREATE TABLE lessons (
    lesson_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    author_id UUID,
    status_id INTEGER,
    content_id INTEGER,
    CONSTRAINT fk_lessons_author FOREIGN KEY (author_id) REFERENCES members(member_id),
    CONSTRAINT fk_lessons_status FOREIGN KEY (status_id) REFERENCES status(status_id),
    CONSTRAINT fk_lessons_content FOREIGN KEY (content_id) REFERENCES contents(content_id)
);

CREATE TABLE modules_lessons (
    module_id INTEGER NOT NULL,
    lesson_id INTEGER NOT NULL,
    PRIMARY KEY (module_id, lesson_id),
    CONSTRAINT fk_modules_lessons_module FOREIGN KEY (module_id) REFERENCES modules(module_id),
    CONSTRAINT fk_modules_lessons_lesson FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id)
);

CREATE TABLE trainings (
    training_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    module_id INTEGER,
    author_id UUID,
    status_id INTEGER,
    CONSTRAINT fk_trainings_module FOREIGN KEY (module_id) REFERENCES modules(module_id),
    CONSTRAINT fk_trainings_author FOREIGN KEY (author_id) REFERENCES members(member_id),
    CONSTRAINT fk_trainings_status FOREIGN KEY (status_id) REFERENCES status(status_id)
);

CREATE TABLE trainings_tags (
    training_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    PRIMARY KEY (training_id, tag_id),
    CONSTRAINT fk_trainings_tags_training FOREIGN KEY (training_id) REFERENCES trainings(training_id),
    CONSTRAINT fk_trainings_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE trainings_modules (
    training_id INTEGER NOT NULL,
    module_id INTEGER NOT NULL,
    PRIMARY KEY (training_id, module_id),
    CONSTRAINT fk_trainings_modules_training FOREIGN KEY (training_id) REFERENCES trainings(training_id),
    CONSTRAINT fk_trainings_modules_module FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE members_trainings (
    member_id UUID,
    training_id INTEGER NOT NULL,
    sign_up_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id, training_id),
    CONSTRAINT fk_members_trainings_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_members_trainings_training FOREIGN KEY (training_id) REFERENCES trainings(training_id)
);

CREATE TABLE members_modules_validation (
    member_id UUID,
    module_id INTEGER NOT NULL,
    validation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id, module_id),
    CONSTRAINT fk_members_modules_validation_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_members_modules_validation_module FOREIGN KEY (module_id) REFERENCES modules(module_id)
);