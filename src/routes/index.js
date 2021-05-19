const express = require('express');
const pool = require('../database');
const cloudinary = require('cloudinary').v2;
const { isLoggedIn } = require('../lib/auth');

const router = express.Router();
cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: 951717554729718,
    api_secret: process.env.CLOUDINARY_API_SECRET,
})
const fs = require('fs-extra');

router.get('/', isLoggedIn, async (req, res, next) => {
    const images = await pool.query('SELECT * FROM memePhoto');
    res.render('images', {images});
});

router.get('/memes/upload', isLoggedIn, async (req, res, next) => {
    const images = await pool.query('SELECT * FROM memePhoto');
    res.render('image-form', {images})
})

router.post('/memes/upload', async (req, res, next) => {
    const { title, description }= req.body;
    try {
        const result = await cloudinary.uploader.upload(req.file.path);
        const { public_id, url }= result;

        const newMeme = {
            title,
            imageURL: url,
            description,
            public_id: public_id,
        };
        await pool.query('INSERT INTO memePhoto SET ?', [newMeme]);
        req.flash('success', 'Meme saved successfully');
        res.redirect('/');

    } catch (error) {
        next(error)
    }
});

router.get('/logout', isLoggedIn, (req, res) => {
    req.logOut();
    res.redirect('/signin');
})

module.exports = router;
