| Entité     | Attribut          | Type de donnée | Longueur | Contrainte                                       | Description                       | Exemple                             |
|------------|-------------------|----------------|----------|--------------------------------------------------|-----------------------------------|-------------------------------------|
| **members**|                   |                |          |                                                  |                                   |                                     |
|            | id                | UUID           | -        | PRIMARY KEY, DEFAULT uuid_generate_v4()          | Identifiant unique du membre      | `550e8400-e29b-41d4-a716-446655...` |
|            | last_name         | VARCHAR        | 50       | NOT NULL                                         | Nom du membre                     | Dupont                              |
|            | first_name        | VARCHAR        | 50       | NOT NULL                                         | Prénom du membre                  | Jean                                |
|            | email             | VARCHAR        | 50       | UNIQUE, NOT NULL                                 | Email du membre                   | jean.dupont@example.com             |
|            | password          | VARCHAR        | 60       | NOT NULL                                         | Mot de passe haché du membre      | `$2y$10$sH28l1j2nNZ51y40C1SyceN...` |
|            | birthdate         | DATE           | -        | NOT NULL                                         | Date de naissance du membre       | 1996-05-19                          |
|            | address_id        | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES addresses(id)   | Référence à l'adresse du membre   | 1                                   |
|            | role_id           | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES roles(id)       | Référence au rôle du membre       | 1                                   |
|            | registration_date | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                        | Date d'inscription du membre      | 2024-05-24 12:34:56                 |
| **addresses**|                 |                |          |                                                  |                                   |                                     |
|            | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique de l'adresse   | 1                                   |
|            | address           | VARCHAR        | 255      | NOT NULL                                         | Adresse détaillée                 | 123 Main St                         |
|            | city              | VARCHAR        | 255      | NOT NULL                                         | Ville                             | Paris                               |
|            | country           | VARCHAR        | 255      | NOT NULL                                         | Pays                              | France                              |
|            | zipcode           | VARCHAR        | 20       | NOT NULL                                         | Code postal                       | 75001                               |
| **roles**  |                   |                |          |                                                  |                                   |                                     |
|            | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique du rôle        | 1                                   |
|            | name              | VARCHAR        | 50       | UNIQUE, NOT NULL                                 | Nom du rôle                       | Student                             |
| **trainings**|                 |                |          |                                                  |                                   |                                     |
|            | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique de la formation | 1                                  |
|            | title             | VARCHAR        | 255      | NOT NULL                                         | Titre de la formation             | Introduction au CSS                 |
|            | description       | TEXT           | -        | NOT NULL                                         | Description de la formation       | Apprendre les bases du CSS          |
|            | creation_date     | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                        | Date de création de la formation  | 2024-05-24 12:34:56                 |
|            | author_id         | UUID           | -        | NOT NULL, FOREIGN KEY REFERENCES members(id)     | Identifiant du formateur          | `550e8400-e29b-41d4-a716-446655...` |
|            | status_id         | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES status(id)      | Référence au statut de la formation | 1                                   |
| **tags**   |                   |                |          |                                                  |                                   |                                     |
|            | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique du tag         | 1                                   |
|            | name              | VARCHAR        | 50       | UNIQUE, NOT NULL                                 | Nom du tag                        | CSS                                 |
| **status** |                   |                |          |                                                  |                                   |                                     |
|            | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique du statut      | 1                                   |
|            | name              | VARCHAR        | 50       | UNIQUE, NOT NULL                                 | Nom du statut                     | Draft                               |
| **modules** |                  |                |          |                                                  |                                   |                                     |
|             | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique du module      | 1                                   |
|             | number            | VARCHAR        | 10       | NOT NULL                                         | Numéro de version du module       | 1.0                                 |
|             | title             | VARCHAR        | 255      | NOT NULL                                         | Titre du module                   | Module : Les bases du CSS           |
|             | objective         | TEXT           | -        | NOT NULL                                         | Objectif pédagogique du module    | Être à l'aise avec les sélecteurs CSS |
|             | duration          | INT            | -        | NOT NULL                                         | Durée totale du module en heures  | 5                                   |
|             | creation_date     | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                        | Date de création du module        | 2024-05-24 12:34:56                 |
|             | author_id         | UUID           | -        | NOT NULL, FOREIGN KEY REFERENCES members(id)     | Identifiant du formateur          | `550e8400-e29b-41d4-a716-446655...` |
|             | status_id         | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES status(id)      | Référence au statut du module     | 1                                   |
| **lessons**  |                  |                |          |                                                  |                                   |                                     |
|              | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique de la leçon    | 1                                   |
|              | title             | VARCHAR        | 255      | NOT NULL                                         | Titre de la leçon                 | Introduction au CSS                 |
|              | description       | TEXT           | -        | NOT NULL                                         | Description de la leçon           | Cette leçon couvre les bases du CSS |
|              | creation_date     | TIMESTAMP      | -        | DEFAULT CURRENT_TIMESTAMP                        | Date de création de la leçon      | 2024-05-24 12:34:56                 |
|              | author_id         | UUID           | -        | NOT NULL, FOREIGN KEY REFERENCES members(id)     | Identifiant du formateur          | `550e8400-e29b-41d4-a716-446655...` |
|              | status_id         | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES status(id)      | Référence au statut de la leçon   | 1                                   |
| **contents** |                  |                |          |                                                  |                                   |                                     |
|              | id                | SERIAL         | -        | PRIMARY KEY                                      | Identifiant unique du contenu     | 1                                   |
|              | text              | TEXT           | -        | NOT NULL                                         | Contenu texte                     | <p>Ce contenu explique...</p>       |
|              | image_url         | VARCHAR        | 255      | NOT NULL                                         | URL de l'image                    | https://example.com/image.jpg       |
|              | video_url         | VARCHAR        | 255      | NOT NULL                                         | URL de la vidéo                   | https://example.com/video.mp4       |
----------
Table de liaison
| Entité              | Attribut    | Type de donnée | Longueur | Contrainte                                       | Description                       | Exemple                             |
|---------------------|-------------|----------------|----------|--------------------------------------------------|-----------------------------------|-------------------------------------|
| **training_tags**   |             |                |          |                                                  |                                   |                                     |
|                     | training_id | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES trainings(id)   | Référence à la formation          | 1                                   |
|                     | tag_id      | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES tags(id)        | Référence au tag                  | 1                                   |
| **module_lessons**  |             |                |          |                                                  |                                   |                                     |
|                     | module_id   | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES lessons(id)     | Référence au module               | 1                                   |
|                     | lesson_id   | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES modules(id)     | Référence à la leçon              | 1                                   |
| **lesson_contents** |             |                |          |                                                  |                                   |                                     |
|                     | lesson_id   | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES lessons(id)     | Référence à la leçon              | 1                                   |
|                     | content_id  | INT            | -        | NOT NULL, FOREIGN KEY REFERENCES contents(id)    | Référence au contenu              | 1                                   |
