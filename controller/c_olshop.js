const m_master_produk_kategori = require('../model/m_master_produk_kategori')
const m_master_produk          = require('../model/m_master_produk')


module.exports = 
{

    hal_beranda: async (req,res) => {
        let data = {
            kategoriProduk: await m_master_produk_kategori.getSemua()
        }
        res.render('v_olshop/beranda', data)
    },

    hal_index_produk: async (req,res) => {
        let data = {
            kategoriProduk  : await m_master_produk_kategori.getSemua(),
            produkJual      : await m_master_produk.getSemua(),
            notifikasi      : req.query.notif
        }
        res.render('v_olshop/produk/index', data)
    },

    hal_form_tambah: async (req,res) => {
        let data = {
            kategoriProduk: await m_master_produk_kategori.getSemua()
        }
        res.render('v_olshop/produk/form-tambah', data)
    },

    proses_insert_produk: async function(req,res) {
        try {
            let insert = await m_master_produk.insert(req)
            if (insert.affectedRows > 0) {
                res.redirect('/olshop/produk?notif=Berhasil input produk baru')
            }
        } catch (error) {
            throw error
        }
    },



}