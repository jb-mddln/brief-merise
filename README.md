# 📊 Conception BDD avec MERISE
## 📝 Contexte du Brief

Votre mission est de concevoir la base de données d’une plateforme de formation en ligne nommée pire2pire.com à l'aide de la méthode [**MERISE**](#merise).

<a id="merise"></a>
MERISE : **M**éthode d'**É**tude et de **R**éalisation **I**nformatique pour les **S**ystèmes d'**E**ntreprise

---

<details><summary>Énoncé</summary>
Les formations sont organisés en modules.

Chaque module est caractérisé par un numéro de module sous forme de Semantic Versionning, un intitulé, un objectif pédagogique, un contenu (textes, images et vidéos), une durée en heures, un ou plusieurs tags et un auteur.

Un module peut faire partie d'une ou plusieurs formations, comme par exemple un pire module "Commandes de base Git" pourrait faire partie d'une pire formation "Frontend Javascript" et "DevOps", voir  plus.

Un module peut contenir un texte et/ou une image et/ou une vidéo.

Les apprenants peuvent s'inscrire à une ou plusieurs formations, ils peuvent choisir de ne pas suivre certains des modules s'ils possèdent déjà, par exemple, les compétences. Autrement dit, ils peuvent arbitrairement valider les modules de leur choix en un clic.

Chaque apprenant est évalué pour chaque module et possède un état de fin de module (OK / KO).

Une formation est considérée comme terminée lorsque tous les modules ont été validés.

Chaque apprenant est caractérisé par un numéro d’inscription unique, un nom, un prénom, une adresse et une date de naissance.
​
Un formateurs est auteur d'un module pour une formation donnée, chaque formateur est caractérisé par un code, un nom, un prénom.
</details>

## 📦 Livrable
- [X] Un README explicite et soigné
- [X] Une définition de l'acronyme [MERISE](#merise) dans le README.md
- [X] Un [Dictionnaire de données](dictionnaire_de_donnees.md)
- [X] Des [Règles de gestion](regles_de_gestion.md)
- [X] Un [MCD](mcd.md)
- [X] Un [MLD](mld.md)
- [X] Un [MPD](mpd.md)
- [X] Un [Script SQL](script_sql.sql) de la base de données