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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (new vtEntities1().kullanicis.Where(w => w.kullaniciAdi == textBox1.Text && w.parola == textBox2.Text).ToList().Count == 1)
            {
                this.Hide();
                Form2 frm = new Form2();
                frm.ShowDialog();
            }
            else
            {
                MessageBox.Show("Kullanıcı adınız veya Parolanız hatalıdır!");
            }

        }
    }
}
