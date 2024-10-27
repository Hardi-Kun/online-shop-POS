const user                     = require ('../model//m_user')
const path                     = require('path')
const moment                   = require('moment')
const bcrypt                   = require('bcryptjs')
const m_master_produk_kategori = require('../model/m_master_produk_kategori')
const m_trans_keranjang        = require('../model/m_trans_keranjang')
const m_user                   = require('../model/m_user')


module.exports = 
{
    index: async (req,res)  => {
        let dataview = {
            moment              : moment,
            notifikasi          : req.query.notif,
            currentUser         : req.session.user ? req.session.user[0] : null,
            kategoriProduk      : await m_master_produk_kategori.getSemua(),
            Produk_diKeranjang  : await m_trans_keranjang.getJumlahProduk_diKeranjang(req),
            dataUser            : await m_user.getSemua(),
            currentUser         : req.session.user ? req.session.user[0] : null,
        }
        res.render('v_profil/index', dataview)

    },

    form_edit_foto: function(req,res) {
        let dataview = {
            req: req
        }
        res.render('v_profil/form-edit-foto', dataview)
    },

    proses_update_foto: function(req, res) {
        let foto = req.files.form_uploadfoto

        // ganti nama file asli
        let email           = req.session.user[0].email.replaceAll('-', '-')
        let datetime        = moment().format('YYYYMMDD, HHmmss')
        let file_name       = email + '_' + datetime + '_' + foto.name
        let folder_simpan   = path.join(__dirname, '../public/upload/produk-foto', file_name)

        // pakai fuunction mv() untuk meletakkan file di suatu folder/direktori
        foto.mv(folder_simpan, async function(err) {
            if (err) {
                return res.status(500).send(err)
            }
            // jika fotonya berhasil terupload ke folder_simpen
            try {
                let update = await m_user.update_foto(req, file_name)
                if (update.affectedRows > 0) {
                    // ubah data session yg lama
                    req.session.user[0].foto = file_name
                    // kembalikan ke halaman profil 
                    res.redirect(`/profil?notif=berhasil ganti foto profil`)
                }
            } catch (error) {
                throw error
            }
        })
    },


    form_edit_password: (req,res) => {
        let dataview = {
            req: req,
            notifikasi: req.query.notif,
        }
        res.render('v_profil/form-edit-password', dataview)
    },

    proses_update_password: async function(req, res) {
        console.log(req.body);

        let { form_email, form_password } = req.body;

        // Check if any field is undefined or null
        if (!form_email || !form_password) {
            res.redirect('/profil/form-edit-password?notif=Semua harus diisi!!');
            return;
        }
        
        let hashedPassword = bcrypt.hashSync(form_password, 10);
        console.log('Hashed Password:', hashedPassword);

        let user = {
            email       : form_email,
            password    : hashedPassword
        }

        try {
            let update = await m_user.update_password(req, user)
            console.log('Update Result:', update)
            if (update && update.affectedRows > 0) {
                // ubah data session yg lama
                req.session.user[0].password = hashedPassword
                console.log('Password update successful');
                res.redirect('/profil?notif=Berhasil update password')
            } else {
                console.log('Password update failed: No rows affected');
                res.redirect('/profil/form-edit-password?notif=Gagal Perbarui update password')
            }
        } catch (error) {
            console.error('Caught Error:', error);
            res.redirect('/profil/form-edit-password?notif=Ada yang eror!!')
        }
    
    },

}