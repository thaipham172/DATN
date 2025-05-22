const Customer = require("../../models/customer.models");

class customerController {
  //[GET] /admin/customer
  async index(req, res) {
    try {
      const perPage = 10;
      const page = parseInt(req.query.page) || 1;

      const { count, rows: customerList } = await Customer.findAndCountAll({
        limit: perPage,
        offset: (page - 1) * perPage,
        order: [['Id', 'DESC']], // Thêm điều kiện ORDER BY Id DESC
      });

      const totalPages = Math.ceil(count / perPage);

      for (const customer of customerList) {
        const createdAtDate = new Date(customer.createdAt);
    
        const d = createdAtDate.getDate() < 10 ? "0" + createdAtDate.getDate() : createdAtDate.getDate();
        const m = (createdAtDate.getMonth() + 1) < 10 ? "0" + (createdAtDate.getMonth() + 1) : (createdAtDate.getMonth() + 1);
        const y = createdAtDate.getFullYear();
        
        const h = createdAtDate.getHours() < 10 ? "0" + createdAtDate.getHours() : createdAtDate.getHours();
        const min = createdAtDate.getMinutes() < 10 ? "0" + createdAtDate.getMinutes() : createdAtDate.getMinutes();
        const sec = createdAtDate.getSeconds() < 10 ? "0" + createdAtDate.getSeconds() : createdAtDate.getSeconds();

        customer.created = `${d}-${m}-${y} ${h}:${min}:${sec}`;
      }

      return res.render('admin/customer/index', { customerList, totalPages, currentPage: page });
    } catch (err) {
      console.error(err);
      return res.status(500).send("Đã xảy ra lỗi khi tải khách hàng.");
    }
  }

}

module.exports = new customerController();
