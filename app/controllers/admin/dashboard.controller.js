const { Op } = require("sequelize");
const Orders = require("../../models/orders.models");
const Rooms = require("../../models/rooms.models");
const Category = require("../../models/category.models");


class dashboardController {
  //[GET] /admin/
  async index(req, res) {
    try {
        // Lấy ngày hiện tại
        const today = new Date();

        const startOfToday = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        // Lấy tổng số orders có trường createdAt bằng ngày hiện tại
        const ordersCount = await Orders.count({
            where: {
                createdAt: {
                    [Op.gte]: startOfToday, // createdAt >= startOfToday (bắt đầu từ 00:00:00)
                    [Op.lt]: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1) // createdAt < ngày tiếp theo (đến 00:00:00)
                }
            }
        });


        const startOfWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - today.getDay()); // Ngày đầu tiên của tuần (thứ 2)
        const endOfWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() + (6 - today.getDay())); // Ngày cuối cùng của tuần (Chủ nhật)
        // Lấy tổng số orders có trường createdAt trong tuần này
        const ordersWeekCount = await Orders.count({
            where: {
                createdAt: {
                [Op.gte]: startOfWeek, // createdAt >= startOfWeek (bắt đầu từ 00:00:00 thứ 2)
                [Op.lt]: new Date(endOfWeek.getFullYear(), endOfWeek.getMonth(), endOfWeek.getDate() + 1) // createdAt < ngày tiếp theo của Chủ nhật (đến 00:00:00)
                }
            }
        });

        let totalForToday = await Orders.sum('Total', {
            where: {
              createdAt: {
                [Op.gte]: startOfToday, // createdAt >= startOfToday (bắt đầu từ 00:00:00)
                [Op.lt]: new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1) // createdAt < ngày tiếp theo (đến 00:00:00)
              }
            }
        });
        
        // Tính tổng của trường Total trong các đơn hàng có trường createdAt trong tuần này
        let totalForThisWeek = await Orders.sum('Total', {
            where: {
            createdAt: {
                [Op.gte]: startOfWeek, // createdAt >= startOfWeek (bắt đầu từ 00:00:00 thứ 2)
                [Op.lt]: new Date(endOfWeek.getFullYear(), endOfWeek.getMonth(), endOfWeek.getDate() + 1) // createdAt < ngày tiếp theo của Chủ nhật (đến 00:00:00)
            }
            }
        });

        // Lấy tổng số lượng phòng có
        const totalRoomsEmpty = await Rooms.count({
            where: {
                Status: 1
            }
        });

        // Lấy tổng số lượng phòng có
        const totalRooms = await Rooms.count();
        
        // Lấy tổng số lượng phòng có
        const totalCategory = await Category.count({
            where: {
                Type: 2
            }
        });

        totalForToday = !isNaN(parseInt(totalForToday)) ? parseInt(totalForToday).toLocaleString('en-US') : 0;

        totalForThisWeek = parseInt(totalForThisWeek).toLocaleString('en-US');

        return res.render('admin/dashboard/index', {ordersCount, ordersWeekCount, totalForToday, totalForThisWeek, totalRoomsEmpty, totalRooms, totalCategory});
    } catch (err) {
      console.error(err);
      return res.status(500).send("Đã xảy ra lỗi khi tải trang chủ.");
    }
  }

  //[GET] /admin/revenue
  async revenue(req, res) {
    const monthlyRevenue = [];

    // Lấy từng tổng doanh thu của các tháng từ tháng 1 đến tháng 12
    for (let month = 1; month <= 12; month++) {
        const startOfMonth = new Date(new Date().getFullYear(), month - 1, 1);
        const endOfMonth = new Date(new Date().getFullYear(), month, 0);

        const totalRevenue = await Orders.sum('Total', {
            where: {
                createdAt: {
                    [Op.between]: [startOfMonth, endOfMonth]
                }
            }
        });

        monthlyRevenue.push(parseInt(totalRevenue) || 0); // Đưa tổng doanh thu của tháng vào mảng
    }

    return res.json(monthlyRevenue);
  }


}

module.exports = new dashboardController();
