const mysql               = require ('mysql2')
const config_database     = require ('../config/database')
const db                  = config_database.db
const eksekusi            = config_database.eksekusi
const moment          = require('moment')

module.exports = 
{
    cari_email: (form_email) => {
        let sqlSyntax = mysql.format (
            `SELECT * FROM user WHERE email = ? `,
            [form_email]
        )
        return eksekusi (sqlSyntax)
    },

    insert_user: (req,res) => {
        let data = {
            email       : req.body.form_email,
            password    : req.body.form_password,
        }
        return eksekusi(mysql.format(   
            `INSERT INTO user SET ?`,
            [data]
        ));
    },
}