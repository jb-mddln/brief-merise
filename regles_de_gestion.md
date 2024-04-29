# 📋 Règles de Gestion pour pire2pirecom

## 📚 Formations

### 📝 Caractéristiques des Formations
Une formation est caractérisée par :
- **🏷️ Titre** : Par exemple, "Formation Front-End HTML/CSS"
- **📄 Description** : Détaille les éléments couverts durant la formation, par exemple : "Les bases du HTML/CSS"
- **👤 Auteur(s)/Formateur(s)** : Chaque formation est rattachée à un ou plusieurs formateurs
- **📅 Date de création/publication** : Indique la date à laquelle la formation a été mise à disposition
- **🧩 Modules** : Chaque formation est composée d'un ou plusieurs modules
- **🔵 État** : Peut être active (🟢) ou inactive (🔴)

### 📏 Règles de Gestion des Formations
- **🚫 Accessibilité** : Une formation inactive (🔴) n'est pas accessible aux apprenants
- **🔒 Définition d'Inactivité** : 
  - Une formation est considérée comme inactive par défaut (🔴) si elle ne contient aucun module,
  - si ses modules ne contiennent aucun contenu,
  - ou si un formateur l'a explicitement marquée comme inactive
- **👥 Inscription** : Les apprenants peuvent s'inscrire à une ou plusieurs formations actives (🟢)
- **✅ Achèvement** : Une formation est considérée comme terminée lorsque tous ses modules ont été validés par l'apprenant

## 🧩 Modules

### 📝 Caractéristiques des Modules
Un module est caractérisé par :
- **🔢 Numéro** : Utilise le format de Semantic Versioning, exemple : "100"
- **🏷️ Titre** : Par exemple, "Module : Les bases du CSS"
- **📄 Objectif pédagogique** : Définit les buts d'apprentissage du module, comme "Être à l'aise avec les sélecteurs CSS"
- **📚 Contenu(s)** : Peut inclure des textes, des images, et/ou des vidéos Les contenus sont conçus pour introduire brièvement les concepts clés du module
- **⏱️ Durée** : Exprime la durée totale du module en heures, par exemple, "5 heures"
- **🏷️ Tags** : Identifie rapidement les sujets principaux du module, exemple de tags : HTML, CSS, JS, PHP
- **👤 Auteur(s)/Formateur(s)**
- **📅 Date de création/publication**
- **🧩 Leçons** : Chaque module peut être composé d'une ou plusieurs leçons
- **🔵 État** : Indique si le module est actif (🟢) ou inactif (🔴)

### 📏 Règles de Gestion des Modules
- **🚫 Accessibilité** : Un module inactif (🔴) n'est pas accessible aux apprenants
- **🔒 Définition d'Inactivité** : 
  - Un module est considéré comme inactif (🔴) s'il ne contient aucune leçon,
  - si ses leçons ne contiennent aucun contenu,
  - ou si un formateur l'a explicitement marqué comme inactif
- **✅ Achèvement** : Un module est considéré comme terminé lorsque toutes ses leçons ont été validées par l'apprenant
- **👨‍🎓 Auto-validation** : Un apprenant peut décider de valider un module s'il considère qu'il a déjà acquis les compétences requises, sans suivre les leçons du module

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
Un apprenant est un utilisateur qui a pour rôle celui d'apprenant

### 📏 Règles de Gestion des Apprenants
- **📚 Suivi des Formations** : Un apprenant peut suivre une ou plusieurs formations
- **👨‍🎓 Auto-validation** : Un apprenant peut décider de valider un ou plusieurs modules s'il considère qu'il a déjà acquis les compétences requises, sans nécessité de suivre les leçons du module
- **📈 États de Module** : Un module suivi par un apprenant peut être dans l'un des deux états suivants :
  - **✅ Acquis** : L'apprenant considère qu'il a acquis les compétences et valide le module de manière autonome
  - **❌ Non acquis** : L'apprenant n'a pas validé le module, soit parce qu'il n'a pas encore acquis les compétences, soit parce qu'il n'a pas encore entrepris d'auto-évaluation

## 👨‍🏫 Gestion des Formateurs

### 📝 Caractéristiques des Formateurs
Un formateur est un utilisateur qui a pour rôle celui de formateur

### 📏 Règles de Gestion des Formateurs
- Un formateur, qu'il soit l'auteur ou qu'il soit rattaché à une ou plusieurs formations, modules ou leçons, a la capacité de les gérer et de les modifier Il peut également les activer, les désactiver ou les supprimer

## 🔄 Interactions entre Formations, Modules, et Leçons
- **🔗 Structure** : 
  - Une formation est composée d'un ou plusieurs modules
  - Chaque module comprend une ou plusieurs leçons
- **🔄 Modularité** : 
  - Un module peut appartenir à plusieurs formations, et une formation peut inclure plusieurs modules
  - Une leçon peut appartenir à plusieurs modules issus de différentes formations
