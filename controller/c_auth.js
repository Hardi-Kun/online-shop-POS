const bcrypt        = require ('bcryptjs')
const m_user        = require ('../model//m_user')

module.exports = 
{
    hal_login: (req,res) => {
        if (req.session.user) {
            res.redirect('/toko')
        } else {
            let data = {
                notifikasi: req.query.notif,
            }
            res.render('v_auth/login', data)
        }
    },

    proses_login: async (req,res) => {
        // ambil inputan dari form login
        let form_email       = req.body.form_email
        let form_password    = req.body.form_password

        // cek email yg dinput, ada gak di db
        let email_exist = await m_user.cari_email (form_email)
        if (email_exist.length > 0) {
            // cek password
            let password_cocok = bcrypt.compareSync(form_password, email_exist[0].password)
            if (password_cocok) {
                req.session.user = email_exist
                res.redirect('/toko')
            } else {
                let pesan = 'Password Salah!'
                res.redirect(`/auth/login?notif=${pesan}`)
            }
        } else {
            // tendang ke halaman register
            let pesan = `Email belum terdaftar, silakan registrasi dahulu`
            res.redirect(`/auth/login?notif=${pesan}`)
        }

    },

    cek_login: function(req,res,next) {
        if (req.session.user) {
            next()
        } else {
            // lempar ke halaman login
            let pesan = `Sesi anda habis! silakan login dulu`
            res.redirect(`/auth/login?notif=${pesan}`)
        }
    },

    proses_logout: function(req,res) {
        req.session.destroy( (err) => {
            res.redirect('/') // will always fire after session is destroyed
        })
    },

    form_daftar: (req,res) => {
        let dataview = {
            message: req.query.msg
        }
        res.render('v_auth/form-daftar', dataview)
    },

    proses_register: async function(req, res) {
        // Log the request body
        console.log(req.body); // Make sure the data is coming through

        // Get the form data
        let { form_email, form_password } = req.body;

        // Check if any field is undefined or null
        if (!form_email || !form_password) {
            res.redirect('/auth/register?notif=Semua harus diisi!!');
            return;
        }

        // Hash the password
        let hashedPassword = bcrypt.hashSync(form_password, 10);

        // Create a user object
        let user = {
            email       : form_email,
            password    : hashedPassword
        }

        try {
            // Use insert_user method from m_user model
            let insert = await m_user.user_register(user);
            if (insert.affectedRows > 0) {
                res.redirect('/auth/login');
            } else {
                res.redirect('/auth/login?notif=Tidak bisa menambahkan akun, coba lagi.');
            }
        } catch (error) {
            console.error(error);
            res.redirect('/auth/login?notif=Error, coba lagi.');
        }
    }

}