const m_master_produk_kategori = require('../model/m_master_produk_kategori')
const m_prod_kategori = require ('../model/m_master_produk_kategori')

module.exports = 
{

    hal_beranda: async (req,res) => {
        let data = {
            kategoriProduk: await m_master_produk_kategori.getSemua()
        }
        res.render('v_olshop/beranda', data)
    },

    hal_index_produk: async (re,res) => {
        let data = {
            kategoriProduk: await m_master_produk_kategori.getSemua()
        }
        res.render('v_olshop/produk/index', data)
    }

}