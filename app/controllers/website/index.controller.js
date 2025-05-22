const Sequelize = require('sequelize');
const News = require("../../models/news.models");
const Category = require("../../models/category.models");
const Room = require("../../models/rooms.models");
const Facility = require("../../models/facility.models");


class indexController {
    //[GET] /
    async index(req, res) {
        try {
            const newRooms = await Room.findAll({
                order: [['id', 'DESC']],
                limit: 3,
                where: {
                    Status: 1
                }
            });

            const rooms = await Room.findAll({
                order: [['id', 'DESC']],
                limit: 4,
                order: Sequelize.literal('RAND()'),
                where: {
                    Status: 1
                }
            });

            const { count, rows: newsList } = await News.findAndCountAll({
                limit: 3,
                order: [['Id', 'DESC']], // Thêm điều kiện ORDER BY Id DESC
                include: [{ model: Category, as: 'category' }]
            });

            for (const news of newsList) {
                const d = new Date(news.createdAt).getDate() < 10 ? "0" + new Date(news.createdAt).getDate() : new Date(news.createdAt).getDate()
                const m = (new Date(news.createdAt).getMonth() + 1) < 10 ? "0" + (new Date(news.createdAt).getMonth() + 1) : (new Date(news.createdAt).getMonth() + 1)
                news.created = `${d}-${m}-${new Date(news.createdAt).getFullYear()}`;
                news.Content = news.Content.substring(0, 124) + " ...";
            }

            for (const room of newRooms) {
                const facilityInfo = await Facility.findOne({ where: { RoomId: room.Id } });
                room.Bed = facilityInfo ? facilityInfo.dataValues.Bed : null;
            }

            return res.render('website/index', {newRooms, rooms, newsList, title: "Hosteller - Phòng nghỉ chất lượng" });
        } catch (err) {
            console.error(err);
            return res.status(500).send("Đã xảy ra lỗi khi tải trang chủ.");
        }
    }

}

module.exports = new indexController();
