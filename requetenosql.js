#-- Question : 1
#-- quelle est la salle la plus fréquentée

db.batiment.aggregate([
    {
        $lookup: {
            from: "cours",
            localField: "_id",
            foreignField: "Batiment._id",
            as: "coursAssocies"
        }
    },
    {
        $lookup: {
            from: "seances",
            localField: "_id",
            foreignField: "Batiment._id",
            as: "seancesAssociees"
        }
    },
    {
        $project: {
            nomBatiment: 1,
            totalFrequentation: {
                $add: [
                    { $sum: { $map: { input: "$coursAssocies", as: "cours", in: { $size: "$$cours.Participants" } } } },
                    { $size: "$seancesAssociees" }
                ]
            }
        }
    },
    { $sort: { totalFrequentation: -1 } },
    { $limit: 1 }
])

# --Question : 2
#-- les personnes qui ont utilisés chaque machine d' un batiment donnée

var batimentId = db.batiment.find().limit(1).skip(1).next()._id;
print("ID du bâtiment:", batimentId);

// Remplacer le idBatiment dans la requête

db.seances.aggregate([
    {
        $match: { "Batiment._id": ObjectId("65b9605f9a0450aa3f7eefd4") } 
    },
    {
        $unwind: "$Machine"
    },
    {
        $group: {
            _id: "$personne._id",
            machinesUtilisees: { $addToSet: "$Machine.info._id" }
        }
    },
    {
        $lookup: {
            from: "batiment",
            let: { batimentId: ObjectId("65b9605f9a0450aa3f7eefd4") }, 
            pipeline: [
                { $match: { $expr: { $eq: ["$_id", "$$batimentId"] } } },
                { $unwind: "$machine" },
                { $group: { _id: null, machinesDuBatiment: { $addToSet: "$machine._id" } } }
            ],
            as: "batimentInfo"
        }
    },
    { $unwind: "$batimentInfo" },
    {
        $project: {
            machinesUtilisees: 1,
            toutesMachinesDuBatiment: "$batimentInfo.machinesDuBatiment",
            aUtiliseToutesLesMachines: { $setEquals: ["$machinesUtilisees", "$toutesMachinesDuBatiment"] }
        }
    },
    { $match: { aUtiliseToutesLesMachines: true } },
    { $lookup: { from: "personnes", localField: "_id", foreignField: "_id", as: "detailsPersonne" } },
    { $unwind: "$detailsPersonne" },
    { $project: { nom: "$detailsPersonne.nom", prenom: "$detailsPersonne.prenom" } }
]).pretty();

#-- Question 3
#-- Trouver le client ayant passé le plus de temps à la salle

db.seances.aggregate([
    {
        $project: {
            personneId: "$personne._id",
            duree: {
                $subtract: ["$depart", "$arrivee"]
            }
        }
    },
    {
        $group: {
            _id: "$personneId",
            tempsTotal: { $sum: { $divide: ["$duree", 1000 * 60] } } 
        }
    },
    {
        $sort: { tempsTotal: -1 }
    },
    {
        $limit: 1
    },
    {
        $lookup: {
            from: "personnes",
            localField: "_id",
            foreignField: "_id",
            as: "detailsPersonne"
        }
    },
    {
        $unwind: "$detailsPersonne"
    },
    {
        $project: {
            nom: "$detailsPersonne.nom",
            prenom: "$detailsPersonne.prenom",
            tempsTotal: 1
        }
    }
]);

