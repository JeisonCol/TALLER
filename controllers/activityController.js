const activity = require('../models').activity_model;
module.exports = {
    list(req, res) {
        return activity
            .findAll({})
            .then((a) => res.status(200).send(a))
            .catch((error) => { res.status(400).send(error); });
    },

    getById(req, res) {
        console.log(req.params.id);
        return activity
            .findByPk(req.params.id)
            .then((a) => {
                console.log(a);
                if (!a) {
                    return res.status(404).send({
                        message: 'activity Not Found',
                    });
                }
                return res.status(200).send(a);
            })
            .catch((error) =>
                res.status(400).send(error));
    },

    add(req, res) {
        return activity
            .create({
                name: req.body.name,
                description: req.body.description,
                id_project: req.body.id_project
            })
            .then((a) => res.status(201).send(a))
            .catch((error) => res.status(400).send(error));
    },

    update(req, res) {
        return activity
            .findByPk(req.params.id)
            .then(activity => {
                if (!activity) {
                    return res.status(404).send({
                        message: 'activity Not Found',
                    });
                }
                return activity
                    .update({
                        name: req.body.name || activity.name,
                        description: req.body.description || activity.description,
                        id_project: req.body.id_project || activity.id_project
                    })
                    .then(() => res.status(200).send(activity))
                    .catch((error) => res.status(400).send(error));
            })
            .catch((error) => res.status(400).send(error));
    },

    delete(req, res) {
        return activity
            .findByPk(req.params.id)
            .then(activity => {
                if (!activity) {
                    return res.status(400).send({
                        message: 'activity Not Found',
                    });
                }
                return activity
                    .destroy()
                    .then(() => res.status(204).send())
                    .catch((error) => res.status(400).send(error));
            })
            .catch((error) => res.status(400).send(error));
    },


};
