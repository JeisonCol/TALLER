var express = require('express');
var router = express.Router();

const activityController = require('../controllers').activityController;


router.get('/', activityController.list);
router.get('/full', activityController.listFull);
router.get('/fullEnable', activityController.listEnableFull);
router.get('/sql', activityController.getSQL);
router.get('/:id', activityController.getById);
router.post('/', activityController.add);
router.put('/:id', activityController.update);
router.delete('/:id', activityController.delete);


module.exports = router;