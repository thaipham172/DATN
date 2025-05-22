const crypto = require('crypto');
const Admin = require("../../models/admin.models");

class adminController {
  //[GET] /admin/profile/
  async view(req, res) {
    const id = req.session.admin.Id;

    try {
        const admin = await Admin.findByPk(id);
        return res.render('admin/admin/index', {admin});
    } catch (err) {
        console.error(err);
        return res.status(500).send("Đã xảy ra lỗi khi cập nhật cá nhân.");
    }    
  }

  //[POST] /admin/profile/
  async update(req, res) {
    const id = req.session.admin.Id;
    const { FullName, Phone, Email, Username, Password } = req.body;

    try {
      const admin = await Admin.findByPk(id);

      let PasswordChange = "";

      if (!FullName || !Phone || !Email || !Username ) return res.render('admin/admin/index', { admin, error: "Vui lòng nhập đủ thông tin quản trị viên!" });
    
      if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(Email)) return res.render('admin/admin/index', {error: "Vui lòng nhập Email hợp lệ!"})

      if(!/^\d{10}$/.test(Phone)) return res.render('admin/admin/index', {error: "Vui lòng nhập số điện thoại hợp lệ!"})

      if(/\s/.test(Username)) return res.render('admin/admin/index', {error: "Vui lòng nhập tài khoản hợp lệ và không có dấu cách!"})

      if(!Password){
        PasswordChange = admin.dataValues.Password;
      }else{
        const hashedPassword = crypto.createHash('md5').update(Password).digest('hex');
        PasswordChange = hashedPassword;
      }

      admin.FullName = FullName;
      admin.Phone = Phone;
      admin.Email = Email;
      admin.Username = Username;
      admin.Password = PasswordChange;
      await admin.save();

      req.session.admin.FullName = FullName;
      
      return res.render('admin/admin/index', { admin, success: "Cập nhật thông tin quản trị thành công!" });
    } catch (err) {
      console.error(err);
      return res.status(500).send("Đã xảy ra lỗi khi cập nhật cá nhân.");
    }
  }

}

module.exports = new adminController();
