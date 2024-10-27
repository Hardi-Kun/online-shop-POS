const user                     = require ('../model//m_user')
const path                     = require('path')
const moment                   = require('moment')
const m_master_produk_kategori = require('../model/m_master_produk_kategori')
const m_trans_keranjang        = require('../model/m_trans_keranjang')


module.exports = 
{
    index: async (req,res)  => {
        let dataview = {
            moment: moment,
            notifikasi: req.query.notif,
            kategoriProduk: await m_master_produk_kategori.getSemua(),
            Produk_diKeranjang: await m_trans_keranjang.getJumlahProduk_diKeranjang(req),
        }
        res.render('v_profil/index', dataview)

    }

}