# Introduction

Ce projet a pour but de concevoir et d'implémenter une base de données moderne pour une grande franchise de salle de sport, en intégrant toutes les notions apprises dans le cours de base de données. Le projet se divise en deux parties principales : la conception et l'implémentation d'une base de données relationnelle, suivie par une migration vers une solution NoSQL pour gérer efficacement la croissance des données.

# Outils et Technologies Utilisés

    Système de gestion de base de données relationnelle (SGDBR) : MySQL
    Système de gestion de base de données NoSQL :  MongoDB
    Langages : SQL pour la partie relationnelle, JavaScript pour les interactions avec la base de données NoSQL.

# Partie I : Base de Données Relationnelle

    Conception

    Modèle Entité-Association : Développement d'un modèle E/A pour représenter les entités clés comme les abonnés, les cours, les machines, et leurs relations.
    Schéma Relationnel et Normalisation : Transformation du modèle E/A en schéma relationnel, en veillant à respecter les dépendances fonctionnelles et à atteindre la troisième forme normale (3NF) pour chaque relation.

    Implémentation

    Requêtes SQL : Écriture des requêtes pour la création des tables, l'insertion des données, et la réalisation de diverses opérations de requête pour extraire des informations spécifiques.

# Partie II : Migration vers NoSQL

  Conception pour NoSQL

    Modification du MCD : Adaptation du modèle conceptuel de données pour optimiser la structure des données dans un contexte NoSQL, en se concentrant sur la réduction des temps de calcul pour les jointures.

  Implémentation avec MongoDB

    Collections et Documents : Création de collections et insertion de documents en utilisant JavaScript, pour refléter la structure et les données de la base relationnelle précédente.
    Requêtes NoSQL : Développement de requêtes en JavaScript pour répondre aux mêmes questions analytiques posées dans la partie relationnelle, adaptées aux spécificités de MongoDB.

# Conclusion

Ce projet a permis à notre équipe de mettre en pratique les compétences acquises en conception et gestion de bases de données, en naviguant entre les paradigmes relationnels et NoSQL pour répondre aux besoins d'une entreprise en croissance rapide. L'expérience a souligné l'importance de la flexibilité et de l'adaptabilité dans la conception de systèmes d'information modernes.
