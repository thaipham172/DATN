const express = require('express');
const router = express.Router();
const roomController = require('../../controllers/website/room.controller');

router.get('/:id', roomController.viewDetail);
router.get('/', roomController.viewAll);


module.exports = router;