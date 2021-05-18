const express = require('express');
const morgan = require('morgan');
const expresshbs = require('express-handlebars');
const path = require('path');
const passport = require('passport');
const multer = require('multer');
require('dotenv').config();


const app = express();
require('./lib/passport');

app.set('port', 4000);
app.set("views", path.join(__dirname, "views"));
app.engine(
    ".hbs",
    expresshbs({
        defaultLayout: "main",
        layoutsDir: path.join(app.get("views"), "layouts"),
        partialsDir: path.join(app.get("views"), "partials"),
        extname: ".hbs",
        helpers: require("./lib/handlebars"),
    })
);
app.set('view engine', 'hbs');

app.use(morgan('dev'));
app.use(express.urlencoded({extended: true}));
app.use(express.json());
const storage = multer.diskStorage({
    destination: path.join(__dirname, 'public/uploads'),
    filename: (req, file, cb) => {
        cb(null, new Date().getTime() + path.extname(file.originalname));
    }
})
app.use(multer({storage}).single('image'));
app.use(passport.initialize());
app.use(passport.session());

// Global variables
app.use((req, res, next) => {

    next();
});
// Routes
app.use(require('./routes/index'));
app.use(require('./routes/auth'));

// Public
app.use(express.static(path.join(__dirname, 'public')));
// Starting the server
app.listen(app.get("port"), () => {
    console.log("Server is in port", app.get("port"));
});