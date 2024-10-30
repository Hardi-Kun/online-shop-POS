const mysql               = require ('mysql2')
const config_database     = require ('../config/database')
const moment              = require ('moment')
const db                  = config_database.db
const eksekusi            = config_database.eksekusi

module.exports = 
{
    cari_email: (form_email) => {
        let sqlSyntax = mysql.format (
            `SELECT * FROM user WHERE email = ? `,
            [form_email]
        )
        return eksekusi (sqlSyntax)
    },

    getSemua:  () => {
        let sqlSyntax = mysql.format(
            `SELECT * FROM user`
        )
        return eksekusi (sqlSyntax)
    },

    user_register: (user) => {
        let sqlData = {
            email       : user.email,
            password    : user.password,
            role_id     : user.role_id
        }
        return eksekusi(mysql.format(   
            `INSERT INTO user SET ?`,
            [sqlData]
        ))
    },

    update_password: async function(req, user) { 
        let sqlData = {
            email       : user.email,
            password    : user.password     
        }
        let id_user = req.session.user?.[0]?.id

        let sqlSyntax = mysql.format (
            `UPDATE user SET ? WHERE id = ?`,
            [sqlData, id_user]
        )
        return eksekusi (sqlSyntax)
    },

    update_foto: function(req, file_name) {
        let data = {
            foto             : file_name,
            last_update      : moment().format('YYYY-MM-DD HH:mm:ss'),
        }
        let id_user = req.session.user[0].id
        return eksekusi(mysql.format(
            `UPDATE user SET ? WHERE id = ?` , 
            [data, id_user]
        ))  
    },  
    
    update_nama: async function(req, user) { 
        let sqlData = {
            nama_lengkap: user.nama_lengkap     
        }
        let id_user = req.session.user?.[0]?.id

        let sqlSyntax = mysql.format (
            `UPDATE user SET ? WHERE id = ?`,
            [sqlData, id_user]
        )
        return eksekusi (sqlSyntax)
    },

    update_email:  async (req, user) => { 
        let sqlData = {
            email: user.email    
        }
        let id_user = req.session.user?.[0]?.id

        let sqlSyntax = mysql.format (
            `UPDATE user SET ? WHERE id = ?`,
            [sqlData, id_user]
        )
        return eksekusi (sqlSyntax)
    }

}