var express = require('express');
var router = express.Router();

const employController = require('../controllers').employController;


router.get('/', employController.list);
router.get('/full', employController.listFull);
router.get('/fullEnable', employController.listEnableFull);
router.get('/sql', employController.getSQL);
router.get('/:id', employController.getById);
router.post('/', employController.add);
router.put('/:id', employController.update);
router.delete('/:id', employController.delete);


module.exports = router;