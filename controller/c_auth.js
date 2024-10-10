

module.exports = 
{
    hal_login: (req,res) => {
        res.render('v_auth/login')
    },

    proses_login: (req,res) => {
        // ambil inputan dari form login
        let data = {
            form_email       : req.body.form_email,
            form_password    : req.body.form_password
        }

        // cek email yg dinput, ada gak di db
    }
}