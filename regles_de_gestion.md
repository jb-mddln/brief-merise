# 📋 Règles de Gestion pour pire2pire.com

## 🚶 Gestion des Visiteurs
- Un visiteur peut être un membre non connecté ou une personne désirant s'inscrire pour devenir membre
- 🌐 Un visiteur peut naviguer sur le site et consulter les informations relatives aux services et formations proposés
- 📝 Un visiteur peut s'inscrire gratuitement en utilisant son adresse email et doit remplir un formulaire avec ses données personnelles (nom, prénom, date de naissance, etc ...)
- 🚫 Un visiteur ne peut pas suivre de formation

## 👥 Gestion des Membres

### 📝 Caractéristiques des Membres
- **🆔 Numéro d'inscription** : Chaque membre possède un numéro d'inscription unique
- **🏷️ Nom et Prénom** : Informations personnelles permettant d'identifier chaque membre
- **🏠 Adresse**
- **🎂 Date de naissance**
- **🎓 Rôle** : Définit le rôle de l'utilisateur au sein de la plateforme :
    - **👨‍🎓 Apprenant**
    - **👨‍🏫 Formateur**
    - **👨‍💼 Administrateur**

## 👨‍🎓 Gestion des Apprenants
### 📝 Caractéristiques des Apprenants
- Un apprenant est un membre qui occupe le rôle **d'apprenant**

### 📏 Règles de Gestion des Apprenants
- **📚 Suivi des Formations** : Un apprenant peut suivre une ou plusieurs formations
- **👨‍🎓 Auto-validation** : Un apprenant peut choisir de valider un ou plusieurs modules s'il estime avoir déjà acquis les compétences requises, sans nécessité de suivre les leçons du module
- **📈 États de Module** : Un module suivi par un apprenant peut être dans l'un des deux états suivants :
  - **✅ Acquis** : L'apprenant considère qu'il a acquis les compétences et valide le module de manière autonome
  - **❌ Non acquis** : L'apprenant n'a pas validé le module, soit parce qu'il n'a pas encore acquis les compétences, soit parce qu'il n'a pas encore entrepris d'auto-évaluation

## 👨‍🏫 Gestion des Formateurs

### 📝 Caractéristiques des Formateurs
- Un formateur est un membre qui occupe le rôle de **formateur**

### 📏 Règles de Gestion des Formateurs
- Un formateur, qu'il soit l'auteur ou qu'il soit rattaché à une ou plusieurs formations, modules ou leçons, a la capacité de les gérer, de les modifier et il peut également changer leurs status (brouillon, publiée, archivée)

## 📚 Formations

### 📝 Caractéristiques des Formations
Une formation est caractérisée par :
- **🏷️ Titre** : Par exemple, "Formation Front-End HTML/CSS"
- **📄 Description** : Détaille les éléments couverts durant la formation, par exemple : "Les bases du HTML/CSS"
- **🏷️ Tags** : Identifie rapidement les sujets principaux d'une formation, exemple de tags : HTML, CSS, JS, PHP
- **👤 Auteur(s)/Formateur(s)** : Chaque formation est rattachée à un ou plusieurs formateurs
- **📅 Date de création/publication** : Indique la date à laquelle la formation a été mise à disposition
- **🧩 Modules** : Chaque formation est obligatoirement associé à au moins un module et peut inclure plusieurs modules
- **🔵 État** : Indique le statut actuel de la formation, pouvant être en **Brouillon**, **Publiée**, ou **Archivée**

### 📏 Règles de Gestion des Formations
- **🚫 Accessibilité de la Formation** :
    - **📝 Brouillon** : Inaccessible aux apprenants, la formation est en cours de rédaction ou de mise à jour
    - **🌐 Publiée** : Accessible, les apprenants peuvent s'inscrire et suivre la formation
    - **🗃️ Archivée** : Fermée aux nouvelles inscriptions, mais les apprenants déjà inscrits avant l'archivage peuvent continuer d'accéder et de suivre les modules/leçons
- **👥 Inscription** : Les apprenants peuvent s'inscrire à une ou plusieurs formations qui ont l'état **🌐 Publiée**
- **✅ Achèvement** : Une formation est considérée comme terminée lorsque tous ses modules ont été validés par l'apprenant

## 🧩 Modules

### 📝 Caractéristiques des Modules

Un module est caractérisé par :
- **🔢 Numéro** : Utilise le format de Semantic Versioning, exemple : "1.0"
- **🏷️ Titre** : Par exemple, "Module : Les bases du CSS"
- **📄 Objectif pédagogique** : Définit les buts d'apprentissage du module, comme "Être à l'aise avec les sélecteurs CSS"
- **⏱️ Durée** : Exprime la durée totale du module en heures, par exemple, "5 heures"
- **👤 Auteur(s)/Formateur(s)**
- **📅 Date de création/publication**
- **🧩 Leçons** : Chaque module est obligatoirement associé à au moins une leçon et peut inclure plusieurs leçons
- **🔵 État** : Indique le statut actuel du module, pouvant être en **Brouillon**, **Publié**, ou **Archivé**

### 📏 Règles de Gestion des Modules
- **🔗 Rattachement du Module** : Un module peut être indépendant (associé à aucune formation, ce qui le rend par défaut inaccessible) ou rattaché à une ou plusieurs formations, mais il ne peut pas être inclus deux fois dans la même formation
- **🚫 Accessibilité du Module** :
  - **📝 Brouillon** : Inaccessible aux apprenants, le module est en cours de rédaction ou de mise à jour
  - **🌐 Publié** : Accessible, les apprenants peuvent consulter et suivre les leçons présentes dans le module
  - **🗃️ Archivé** : Fermé et plus visible de la liste des modules d'une formation, cependant, les apprenants ayant déjà commencé le module et ses leçons avant l'archivage peuvent continuer d'y accéder et de suivre les leçons
- **✅ Achèvement** : Un module est considéré comme terminé lorsque toutes ses leçons ont été validées par l'apprenant
- **👨‍🎓 Auto-validation** : Un apprenant peut décider de valider un module s'il considère qu'il a déjà acquis les compétences requises, sans suivre les leçons du module

## 📘 Leçons

### 📝 Caractéristiques des Leçons
Une leçon est caractérisée par :
- **🏷️ Titre**
- **📄 Description**
- **📚 Contenu(s)** : Peut inclure des textes, des images, et/ou des vidéos
- **👤 Auteur(s)/Formateur(s)**
- **📅 Date de création/publication**
- **🔵 État** : Indique le statut actuel de la leçon, pouvant être en **Brouillon**, **Publiée**, ou **Archivée**

### 📏 Règles de Gestion des Leçons
- **📚 Contenu Obligatoire** : Une leçon contient obligatoirement un contenu
- **🔗 Rattachement de la Leçon** : Une leçon peut être rattachée à aucun module (ce qui la rend inaccessible par défaut), ou rattachée à un ou plusieurs modules, mais jamais deux fois dans le même module
- **🚫 Accessibilité de la Leçon** :
    - **📝 Brouillon** : Inaccessible aux apprenants, la leçon est en cours de rédaction ou de mise à jour
    - **🌐 Publiée** : Accessible, les apprenants peuvent suivre la leçon
    - **🗃️ Archivée** : Fermée et non visible dans la liste des leçons d'un module, cependant, les apprenants ayant déjà commencé la leçon avant l'archivage peuvent continuer d'y accéder et de la suivre

## 📚 Contenu(s)
### 📝 Caractéristiques des Contenus
Un contenu est caractérisé par :
- **📄 Texte**
- **🖼️ Image**
- **🎥 Vidéo**

### 📏 Règles de Gestion des Contenus
- Un contenu doit obligatoirement inclure du texte, une image, et une vidéo