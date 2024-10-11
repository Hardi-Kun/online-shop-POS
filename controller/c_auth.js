const m_user       = require ('../model//m_user')

module.exports = 
{
    hal_login: (req,res) => {
        res.render('v_auth/login')
    },

    proses_login: async (req,res) => {
        // ambil inputan dari form login
        let form_email       = req.body.form_email
        let form_password    = req.body.form_password

        // cek email yg dinput, ada gak di db
        let email_exist = await m_user.cari_email (form_email)
        if (email_exist.length > 0) {
            // cek password
            res.send('email ada')
        } else {
            // tendang ke halaman register
            let pesan = `Email belum terdaftar, silakan registrasi dahulu`
            res.redirect(`/auth/login?notif=${pesan}`)
        }

    }
}