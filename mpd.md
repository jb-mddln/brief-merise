## Modèle Physique des Données : MPD
Il traduit le MLD en structures spécifiques à un **SGBD** (Système de Gestion de Bases de Données exemple PostgreSQL), détaillant le stockage, l'indexation et l'accès aux données. Il inclut la définition des tables, index, vues, contraintes et scripts SQL nécessaires.

## Création

```sql
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
```

## Insertion
```sql
INSERT INTO roles (role_id, name) VALUES
(1, 'User'),
(2, 'Trainer'),
(3, 'Admin');

INSERT INTO status (status_id, name) VALUES
(1, 'Draft'),
(2, 'Published'),
(3, 'Archived');

INSERT INTO addresses (adress_id, address, city, country, zipcode) VALUES
(1, '123 Main St', 'Paris', 'France', '75001'),
(2, '47 Rue Barthélémy Delespaul', 'Lille', 'France', '59000');

INSERT INTO members (last_name, first_name, email, password, birthdate, registration_date, role_id, address_id) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', '$2y$10$PAcdpn8kRzzUL35HDhuABOp9mKPa3BCLuJ0a0qyOQAVpgMOqfnJoG', '1996-05-19', '2024-05-25', 1, 1),
('Formateur', 'Kevin', 'kevin.formateur@example.com', '$2y$10$xQntcxYnt87VzsXQVwFgTeJmTSGTlYRhjA9qN/mqTqr0nK/WiFWUm', '1985-05-15', '2023-02-10', 2, 2);

INSERT INTO tags (tag_id, name) VALUES
(1, 'CSS'),
(2, 'Développement Web'),
(3, 'HTML');

INSERT INTO contents (content_id, text, image_url, video_url, author_id) VALUES
(1, 'Les feuilles de style en cascade, généralement appelées CSS de l''anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML. Les standards définissant CSS sont publiés par le World Wide Web Consortium (W3C). Introduit au milieu des années 1990, CSS devient couramment utilisé dans la conception de sites web et bien pris en charge par les navigateurs web dans les années 2000.', 'css_cours_1.jpg', 'css_cours_1.mp4', '064d2e71-50fe-4a87-b9f9-e76135304358');

INSERT INTO lessons (lesson_id, title, description, creation_date, status_id, content_id, author_id) VALUES
(1, 'Cours 1: Définition et rôle du CSS', 'Découverte du CSS et de son rôle au sein du Web.', '2023-01-10', 1, 1, '064d2e71-50fe-4a87-b9f9-e76135304358');

INSERT INTO modules (module_id, number, title, objective, duration, creation_date, status_id, author_id) VALUES
(1, '1.0', 'Introduction au CSS', 'Pouvoir lire, écrire et comprendre du code CSS', 2, '2023-01-01', 1, '064d2e71-50fe-4a87-b9f9-e76135304358');

INSERT INTO trainings (training_id, title, description, creation_date, module_id, status_id, author_id) VALUES
(1, 'CSS', 'Apprendre les bases du CSS.', '2023-01-01', 1, 1, '064d2e71-50fe-4a87-b9f9-e76135304358');

INSERT INTO trainings_tags (training_id, tag_id) VALUES
(1, 1),
(1, 2);

INSERT INTO trainings_modules (training_id, module_id) VALUES
(1, 1);

INSERT INTO modules_lessons (module_id, lesson_id) VALUES
(1, 1);

INSERT INTO members_trainings (member_id, training_id, sign_up_date) VALUES
('d2a5fdef-932c-442f-bd7c-80bc34ec3a5f', 1, '2024-05-25');

INSERT INTO members_modules_validation (member_id, module_id, validation_date) VALUES
('d2a5fdef-932c-442f-bd7c-80bc34ec3a5f', 1, '2024-05-26');
```