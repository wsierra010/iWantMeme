const bcrypt = require('bcryptjs');

const helpers = {};


helpers.encryptPassword = async (passwd) => {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(passwd, salt);
    return hash;
}

helpers.matchPassword = async (passwd, savePasswd) => {
    try {
        return await bcrypt.compare(passwd, savePasswd)
    } catch (error) {
        console.log(error);
    }
}

module.exports = helpers;