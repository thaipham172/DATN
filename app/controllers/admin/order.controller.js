const Order = require("../../models/orders.models");
const Rooms = require("../../models/rooms.models");

class orderController {
  //[GET] /admin/order
  async index(req, res) {
    try {
      const perPage = 5;
      const page = parseInt(req.query.page) || 1;

      const { count, rows: orderList } = await Order.findAndCountAll({
        limit: perPage,
        offset: (page - 1) * perPage,
        order: [['Id', 'DESC']],
        include: [
            {
              model: Rooms,
              as: 'room',
            }
        ]
      });

      const totalPages = Math.ceil(count / perPage);

      return res.render('admin/order/index', { orderList, totalPages, currentPage: page });
    } catch (err) {
      console.error(err);
      return res.status(500).send("Đã xảy ra lỗi khi tải đơn đặt phòng.");
    }
  }

  //[GET] /admin/order/:id/action/:action
  async action(req, res) {
    const { id, action } = req.params;

    try {
      await Order.update(
        { StatusOrder: action },
        { where: { Id: id } }
      );

      if(action == 3){
        const idRoom = await Order.findByPk(id);

        await Rooms.update(
          { Status: 0 },
          { where: { Id: idRoom.dataValues.RoomId } }
        );
      }

      return res.redirect('back');
    } catch (err) {
      return res.redirect('back');
    }
  }

  //[GET] /admin/order/:id/paid/:action
  async paid(req, res) {
    const { id, action } = req.params;
    try {
      await Order.update(
        { StatusPay: action },
        { where: { Id: id } }
      );

      return res.redirect('back');
    } catch (err) {
      return res.redirect('back');
    }
  }

  //[GET] /admin/order/:id
  async view(req, res) {
    const { id } = req.params;
    try {
      const order = await Order.findByPk(id);

      if(!order){
        return res.redirect('back');
      }

      const ds = new Date(order.dataValues.Start).getDate() < 10 ? "0" + new Date(order.dataValues.Start).getDate() : new Date(order.dataValues.Start).getDate()
      const ms = (new Date(order.dataValues.Start).getMonth() + 1) < 10 ? "0" + (new Date(order.dataValues.Start).getMonth() + 1) : (new Date(order.dataValues.Start).getMonth() + 1)
      order.dataValues.Start = `${ds}/${ms}/${new Date(order.dataValues.Start).getFullYear()}`;

      const de = new Date(order.dataValues.End).getDate() < 10 ? "0" + new Date(order.dataValues.End).getDate() : new Date(order.dataValues.End).getDate()
      const me = (new Date(order.dataValues.End).getMonth() + 1) < 10 ? "0" + (new Date(order.dataValues.End).getMonth() + 1) : (new Date(order.dataValues.End).getMonth() + 1)
      order.dataValues.End = `${de}/${me}/${new Date(order.dataValues.End).getFullYear()}`;

      return res.render('admin/order/view', {order});
    } catch (err) {
      console.error(err);
      return res.status(500).send("Đã xảy ra lỗi khi tải đơn đặt phòng.");
    }
  }
}

module.exports = new orderController();
