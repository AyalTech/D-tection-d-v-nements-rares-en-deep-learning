# Détection d’évènements rares en deep learning

La problématique est de pouvoir réaliser une classification sur des jeux de données déséquilibrés en utilisant différentes techniques de rééchantillonnage.

Dans cet exercice, étant face à des problématique de détection d’évènement rare, les modèles seront particulièrement évalués dans leur taux de bonne classification de ces évènements. En effet, il est plus dommageable de prédire un non-évènement (faux négatifs) que son inverse, exemple dans le cadre d’une détection de fraude, de maladie ou autre phénomène de même nature, une fausse prédiction aurait un impact déterminant pour l’utilisateur/client final.

Les 3 jeux de donnéess à travailler sont :

- Credit fraud
- Bank Marketing
- Employee Attrition

Les méthodes de rééquilibrage utilisées sont :

- Pondération des classes
- Oversampling
	- Random oversampling
	- Synthetic Minority Oversampling Tecnique (SMOTE)
	- Adaptive Syyntetic (ADASYN)
- Undersampling
	- Random undersampling
	- Tomek links

Des modèles simples et élaborées de deep learning ont été utilisées sur ces jeux de données rééquilibrés.