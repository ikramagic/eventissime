# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

Faker::Config.locale = 'fr'

event_durations = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120]
event_titles = ["Le Bal des Boucles Infinies", "La Soirée des Variables Farfelues", "Débugging & Divertissement", "Le Codeur Comique: Stand-up Algorithmique", "La Nuit des Mèmes Programmables", "Le Festival du 'Hello World!'", "Les Perles de Code: Un Spectacle Épique", "La Danse des Bugs et des Caractères Spéciaux", "Le Coding Challenge Fou", "Comédie et Compilation", "Le Débat des Parenthèses et des Crochets", "Stand-up DevOps: Rires & Déploiements", "Le Grand Gala des Fonctions Récursives", "Programmation en Pseudocode: L'Art de la Confusion", "La Soirée des Algorithmes Fous", "L'Invasion des Chatbots Amateurs de Blagues", "Rires & Réfactorisation: La Nuit des Codeurs", "La Grande Parade des Bugs Sympathiques", "Soirée Spaghetti Code: Entre Rires et Torsions", "Les Bloopers du Byte: Un Spectacle Byte-résistant", "L'Open Mic du Terminal", "Le Stand-up de l'Intelligence Artificielle", "Le Festival des Boucles et des Conditions", "La Soirée des Langages Exotiques", "Les Joies du 'Hello World!'", "Le Bal des Virgules Perdues", "Développeurs en Délire: Rires & Refactorisations", "Le Codeur en Comédie: L'Art de la Syntaxe", "La Conférence des Bugs Rares", "Le Débat des Frameworks et des Bibliothèques", "Le Coding Challenge Absurde", "Comédie & Compilation: La Nuit des Programmeurs", "Le Gala des Exceptions", "Programmation en Klingon: Quand le Code Devient un Mystère", "La Soirée des Algorithmes Désordonnés", "Les Chatbots Fous: Un Spectacle Informatique", "Rires & Réfactorisation: La Nuit du Développeur", "La Parade des Bugs Improbables", "Soirée Spaghetti Code: Entre Rires et Erreurs", "Les Énigmes du Byte: Un Spectacle en Bit", "L'Open Mic du Bash", "Le Stand-up des Chatbots", "Le Festival des Interfaces et des Composants", "La Soirée des Langages Insolites", "La Joie du 'Hello World!'", "Le Bal des Parenthèses Égarées", "Développeurs en Délire: Rires & Rétro-ingénierie", "La Nuit des Dessins ASCII"]
event_descriptions = ["Une soirée hilarante avec des boucles infinies de code. Vous ne pourrez pas vous arrêter de rire!", "Rejoignez-nous pour une soirée folle remplie de variables loufoques et de divertissement informatique.", "Préparez-vous pour une soirée de débogage et de divertissement où les bugs deviennent des stars!", "Le comédien codeur le plus drôle vous présente un stand-up algorithmique inoubliable.", "Venez assister à la nuit des mèmes programmables où les mèmes prennent vie sous forme de code.", "Un festival du 'Hello World!' qui vous fera rire à chaque ligne de code.", "Découvrez les perles de code dans ce spectacle épique de développement informatique.", "Une danse endiablée entre les bugs et les caractères spéciaux. Rires garantis!", "Participez au Coding Challenge le plus fou de tous les temps. Oserez-vous accepter le défi?", "Une soirée de comédie et de compilation où le code devient une source de rires.", "Le débat des parenthèses et des crochets est le spectacle idéal pour les amateurs de syntaxe.", "Stand-up DevOps pour une soirée de rires et de déploiements hilarants.", "Le grand gala des fonctions récursives vous fera rire sans fin. Ne manquez pas ça!", "La programmation en pseudocode devient un art de la confusion dans ce spectacle unique.", "Une soirée des algorithmes fous pour les amoureux du code et de l'humour.", "Les chatbots amateurs de blagues envahissent la scène pour une soirée inoubliable.", "Rires et réfactorisation au programme de cette nuit des codeurs. Préparez-vous à rire!", "La grande parade des bugs sympathiques est un spectacle où les bugs deviennent des stars.", "La soirée Spaghetti Code mélange rires et torsions dans un spectacle hilarant.", "Les bloopers du byte vous feront rire aux éclats. Un spectacle byte-résistant!", "Ouvrez le micro du terminal pour une soirée de rires et de commandes informatiques.", "Le stand-up de l'intelligence artificielle vous fera rire avec des algorithmmes hilarants.", "Le festival des boucles et des conditions est un spectacle unique pour les développeurs.", "La soirée des langages exotiques explore le côté drôle des langages de programmation.", "Découvrez les joies du 'Hello World!' dans une soirée remplie de rires et surprises.", "Le bal des virgules perdues vous fera rire avec des erreurs de syntaxe inattendues.", "Développeurs en délire pour une soirée de rires et réfactorisations comiques.", "Le codeur en comédie vous présente l'art de la syntaxe dans un spectacle hilarant.", "La conférence des bugs rares est un spectacle où les bugs rares sont à l'honneur.", "Le débat des frameworks et des bibliothèques vous fera rire avec des discussions animées.", "Le Coding Challenge absurde est une soirée de défis fous pour les codeurs courageux.", "Comédie et compilation dans cette nuit des programmeurs. Préparez-vous à rire!"]


all_users = []
all_events = []

3.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    new_user = User.create(
        first_name: first_name,
        last_name: last_name,
        description: Faker::Hacker.say_something_smart,
        password: Faker::Lorem.word,
        email: "#{first_name.downcase.gsub(/[àâçéèêëîïôûüÿ]/, 'x')}.#{last_name.downcase.gsub(/[àâçéèêëîôûü]/, 'x')}@yopmail.com"
        )
    all_users << new_user
end

10.times do 
        new_event = Event.create(
        start_date: Faker::Date.forward(days: 365),
        duration: event_durations.sample,
        title: event_titles.sample,
        description: event_descriptions.sample,
        price: Faker::Number.between(from: 1, to: 1000),
        location: Faker::Address.city
    )
    all_events << new_event
end