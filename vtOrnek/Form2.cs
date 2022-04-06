using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace vtOrnek
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        vtEntities1 _db = new vtEntities1();

        public int seciliKategori = -1;

        private void Form2_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Hide();
            Form1 form1 = new Form1();
            form1.ShowDialog();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            doldur();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            doldur();
        }

        private void doldur()
        {
            try
            {
                _db.SaveChanges();
                dataGridView1.DataSource = _db.kategoris.ToList();
                dataGridView2.DataSource = _db.uruns.ToList();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                //throw;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //kategori ekle
            kategori _kategori = new kategori();
            string giris = Interaction.InputBox("Kategori Adı", "Ad Giriniz", "", 500, 300);
            if (giris != "")
            {
                _kategori.kategoriAdi = giris;
                _db.kategoris.Add(_kategori);
                doldur();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //ürün ekle
            urun _urun = new urun();
            string giris = Interaction.InputBox("Ürün Adı", "Ad Giriniz", "", 500, 300);
            if (giris != "")
            {
                _urun.urunAdi = giris;
                _db.uruns.Add(_urun);
                doldur();
            }
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dataGridView1.SelectedRows[0];
                int silinecekID = (int)row.Cells[0].Value;
                var silinecek = _db.kategoris.Where(w => w.Id == silinecekID).FirstOrDefault();

                _db.kategoris.Remove(silinecek);
                doldur();
            }
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            if (dataGridView2.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dataGridView2.SelectedRows[0];
                int silinecekID = (int)row.Cells[0].Value;
                var silinecek = _db.uruns.Where(w => w.Id == silinecekID).FirstOrDefault();

                _db.uruns.Remove(silinecek);
                doldur();
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex != -1)
            {
                DataGridViewRow row = dataGridView1.Rows[rowIndex];
                seciliKategori = (int)row.Cells[0].Value;
                dataGridView2.DataSource = _db.uruns.Where(w => w.kategoriID == seciliKategori).ToList();
            }
            else
            {
                seciliKategori = -1;
            }
        }
    }
}
