const express = require('express');
const router = express.Router();
const roomController = require('../../controllers/admin/room.controller');
const upload = require('../../middlewares/upload.middlewares'); // Đường dẫn đến file middleware upload

router.get('/add', roomController.viewAdd);
router.post('/add', upload.single('avatar'), roomController.add);
router.get('/update/:id', roomController.viewUpdate);
router.post('/update/:id', upload.single('avatar'), roomController.update);
router.get('/delete/:id', roomController.delete);
router.get('/:id/facility', roomController.facility);
router.post('/:id/facility', roomController.updateFacility);
router.get('/:id/rule', roomController.rule);
router.post('/:id/rule', roomController.updateRule);
router.get('/:id/image', roomController.image);
router.post('/:id/image', upload.fields([
    { name: 'image1', maxCount: 1 },
    { name: 'image2', maxCount: 1 },
    { name: 'image3', maxCount: 1 },
    { name: 'image4', maxCount: 1 }
]), roomController.updateImage);
router.get('/', roomController.index);

module.exports = router;