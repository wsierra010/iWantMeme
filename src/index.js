const express = require('express');
const morgan = require('morgan');
const expresshbs = require('express-handlebars');
const path = require('path');
const passport = require('passport');
const multer = require('multer');
require('dotenv').config();

const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const { database } = require('./keys')



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

app.use(session({
    secret: 'Eres un máquina',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));
app.use(flash());
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



app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.user = req.user;
    next();
});

app.use(require('./routes/index'));
app.use(require('./routes/auth'));


app.use(express.static(path.join(__dirname, 'public')));

app.listen(app.get("port"), () => {
    console.log("Server is in port", app.get("port"));
});