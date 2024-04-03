const employ = require('../models').employ_model;
const project = require('../models').project_model;
const activity = require('../models').activity_model;
const db = require('../models');



module.exports = {
    list(req, res) {
        return employ
            .findAll({})
            .then((p) => res.status(200).send(p))
            .catch((error) => { res.status(400).send(error); });
    },

    getById(req, res) {
        console.log(req.params.id);
        return employ
            .findByPk(req.params.id)
            .then((p) => {
                console.log(p);
                if (!p) {
                    return res.status(404).send({
                        message: 'Project Not Found',
                    });
                }
                return res.status(200).send(p);
            })
            .catch((error) =>
                res.status(400).send(error));
    },

    add(req, res) {
        console.log("**************************");
        console.log(req.body);
        console.log("**************************");
        return employ
            .create({
                title: req.body.title,
                description: req.body.description,
                state: req.body.state
            })
            .then((p) => res.status(201).send(p))
            .catch((error) => res.status(400).send(error));
    },

    update(req, res) {
        return employ
            .findByPk(req.params.id)
            .then(employ => {
                if (!employ) {
                    return res.status(404).send({
                        message: 'employ Not Found',
                    });
                }
                return employ
                    .update({
                        title: req.body.title || employ.title,
                        description: req.body.description || employ.description,
                        state: req.body.state || employ.state
                    })
                    .then(() => res.status(200).send(employ))
                    .catch((error) => res.status(400).send(error));
            })
            .catch((error) => res.status(400).send(error));
    },

    delete(req, res) {
        return employ
            .findByPk(req.params.id)
            .then(employ => {
                if (!employ) {
                    return res.status(400).send({
                        message: 'employ Not Found',
                    });
                }
                return employ
                    .destroy()
                    .then(() => res.status(204).send())
                    .catch((error) => res.status(400).send(error));
            })
            .catch((error) => res.status(400).send(error));
    },

    listFull(req, res) {
        return employ
            .findAll({
                attributes: ['id', 'name', 'lastname', 'email'],
                include: [{
                    attributes: ['id', 'description'],
                    model: project,
                    include:
                        [{
                            attributes: ['id', 'name', 'description'],
                            model: activity
                        }

                        ]
                },
                ]
            })
            .then((project) => res.status(200).send(project))
            .catch((error) => { res.status(400).send(error); });
    },

    listEnableFull(req, res) {
        return employ
            .findAll({
                attributes: ['id', 'name', 'lastname'],
                include: [{
                    attributes: ['id', 'title', 'description', 'state'],
                    model: project,

                    include: [{
                        attributes: ['id', 'name', 'lastname', 'email'],
                        model: employ
                    }]
                },
                ],
                order: [
                    ['name', 'ASC']
                ]
            })
            .then((employ) => res.status(200).send(employ))
            .catch((error) => { res.status(400).send(error); });
    },

    getSQL(req, res) {

        return db.sequelize.query("SELECT * FROM employ")
            .then((result) => {
                console.log(result);
                if (!result) {
                    return res.status(404).send({
                        message: 'result Not Found',
                    });
                }
                return res.status(200).send(result[0]);
            })
            .catch((error) =>
                res.status(400).send(error));
    },

};