const {requireLogin, requireLogout} = require('../middlewares/adminAuth.middlewares');

const categoryRoute = require("./admin/category.routes");
const newsRoute = require("./admin/news.routes");
const roomRoute = require("./admin/room.routes");
const orderRoute = require("./admin/order.routes");
const contactRoute = require("./admin/contact.routes");
const customerRoute = require("./admin/customer.routes");
const profileRoute = require("./admin/admin.routes");
const dashboardRoute = require("./admin/dashboard.routes");
const loginRoute = require("./admin/login.routes");
const logoutRoute = require("./admin/logout.routes");

const webCustomerRoute = require("./website/customer.routes");
const webRoomRoute = require("./website/room.routes");
const webOrderRoute = require("./website/order.routes");
const webNewsRoute = require("./website/news.routes");
const webContactRoute = require("./website/contact.routes");
const webIndexRoute = require("./website/index.routes");

function route(app){
    app.use("/admin/category", requireLogin, categoryRoute);
    app.use("/admin/news", requireLogin, newsRoute);
    app.use("/admin/room", requireLogin, roomRoute);
    app.use("/admin/order", requireLogin, orderRoute);
    app.use("/admin/contact", requireLogin, contactRoute);
    app.use("/admin/customer", requireLogin, customerRoute);
    app.use("/admin/profile", requireLogin, profileRoute);
    app.use("/admin/login", requireLogout, loginRoute);
    app.use("/admin/logout", requireLogin, logoutRoute);
    app.use("/admin", requireLogin, dashboardRoute);
    app.use("/phong-nghi", webRoomRoute);
    app.use("/khach-hang", webCustomerRoute);
    app.use("/dat-phong", webOrderRoute);
    app.use("/tin-tuc", webNewsRoute);
    app.use("/lien-he", webContactRoute);
    app.use("/", webIndexRoute);
}

module.exports = route