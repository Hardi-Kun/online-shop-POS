const user                     = require ('../model//m_user')
const path                     = require('path')
const moment                   = require('moment')
const bcrypt                   = require('bcryptjs')
const m_master_produk_kategori = require('../model/m_master_produk_kategori')
const m_trans_keranjang        = require('../model/m_trans_keranjang')
const m_trans_pembelian        = require('../model/m_trans_pembelian')
const m_user                   = require('../model/m_user')


module.exports = 
{
    index: async (req,res)  => {
        let dataview = {
            req                     : req,
            moment                  : moment,
            notifikasi              : req.query.notif,
            currentUser             : req.session.user ? req.session.user[0] : null,
            kategoriProduk          : await m_master_produk_kategori.getSemua(),
            Produk_diKeranjang      : await m_trans_keranjang.getJumlahProduk_diKeranjang(req),
            dataUser                : await m_user.getSemua(),
            orderanMasuk            : await m_trans_pembelian.getJumlahOrderanMasuk(),
            produk_diProses         : await m_trans_pembelian.getJumlahProduk_diProses(req),
            detailProduk_diProses   : await m_trans_pembelian.getDetailProduk_diProses(req),
            produk_diKirim          : await m_trans_pembelian.getJumlahProduk_diKirim(req),
            detailProduk_diKirim    : await m_trans_pembelian.getDetailProduk_diKirim(req),
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

    form_edit_nama: (req,res) => {
        let dataview = {
            req: req,
        }
        res.render('v_profil/form-edit-nama', dataview)
    },

    proses_update_nama: async (req,res) => {
        console.log(req.body);

        let { form_namalengkap } = req.body;

        // Check if any field is undefined or null
        if (!form_namalengkap) {
            res.redirect('/profil/form-edit-nama?notif=Harus diisi!!');
            return;
        }
        
        let user = {
            nama_lengkap:  form_namalengkap
        }

        try {
            let update = await m_user.update_nama(req, user)
            if (update && update.affectedRows > 0) {
                // ubah data session yg lama
                // req.session.user[0].password = hashedPassword
                console.log('Nama update successful');
                res.redirect('/profil?notif=Berhasil update nama')
            } else {
                console.log('Nama update failed: No rows affected');
                res.redirect('/profil/form-edit-nama?notif=Gagal update nama')
            }
        } catch (error) {
            console.error('Caught Error:', error);
            res.redirect('/profil/form-edit-nama?notif=Ada yang eror!!')
        }
    },

    form_edit_email: (req,res) => {
        let dataview = {
            req: req,
        }
        res.render('v_profil/form-edit-email', dataview)
    },

    proses_update_email: async (req,res) => {
        console.log(req.body);

        let { form_email } = req.body;

        // Check if any field is undefined or null
        if (!form_email) {
            res.redirect('/profil/form-edit-email?notif=Harus diisi!!');
            return;
        }
        
        let user = {
            email: form_email
        }

        try {
            let update = await m_user.update_email(req, user)
            if (update && update.affectedRows > 0) {
                console.log('Email update successful');
                res.redirect('/profil?notif=Berhasil update email')
            } else {
                console.log('Nama update failed: No rows affected');
                res.redirect('/profil/form-edit-email?notif=Gagal update email')
            }
        } catch (error) {
            console.error('Caught Error:', error);
            res.redirect('/profil/form-edit-email?notif=Ada yang eror!!')
        }
    },

}