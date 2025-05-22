const Sequelize = require('sequelize');
const crypto = require('crypto');
const Admin = require("../../models/admin.models");

class loginController {
    //[GET] /admin/login
    async viewLogin(req, res) {
        return res.render('admin/login/index', {error: ""})
    }

    //[POST] /admin/login
    async login(req, res) {
        console.log(req.body)

        const { Username, Password } = req.body;
        try {

            if(!Username || !Password) return res.render('admin/login/index', {error: "Vui lòng nhập đủ thông tin đăng nhập!"})

            const hashedPassword = crypto.createHash('md5').update(Password).digest('hex');

            const admin = await Admin.findOne({
                where: {
                    Username,
                    Password: hashedPassword
                }
            });

            if (admin) {
                req.session.admin = admin;
                return res.redirect('/admin/'); 
            } else {
                return res.render('admin/login/index', {error: "Sai tên đăng nhập hoặc mật khẩu!"})
            }
        } catch (error) {
            // Xử lý lỗi nếu có
            res.status(500).json({ message: 'Đã xảy ra lỗi khi đăng nhập!' });
        }
    }
}

module.exports = new loginController();
