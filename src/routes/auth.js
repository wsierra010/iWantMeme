const express = require('express');
const { route } = require('.');

const passport = require('passport');

const router = express.Router();

router.get('/signup', (req, res) => {
    res.render('./auth/signup');
});

router.post('/signup', passport.authenticate('local.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true,
}));

router.get('/signin', (req, res) => {
    res.render('./auth/signin');
})

router.post('/signin', (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/profile',
        failureRedirect: '/signin',
        failureFlash: true,
    })(req, res, next);
})

router.get('/profile', (req, res) => {
    res.send('This is your Profile');
});

module.exports = router;