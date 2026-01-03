namespace WinFormsApp1
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            CarsDataGrid = new DataGridView();
            label1 = new Label();
            Next = new Button();
            Previous = new Button();
            ((System.ComponentModel.ISupportInitialize)CarsDataGrid).BeginInit();
            SuspendLayout();
            // 
            // CarsDataGrid
            // 
            CarsDataGrid.BackgroundColor = Color.FromArgb(21, 20, 20);
            CarsDataGrid.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            CarsDataGrid.Location = new Point(64, 70);
            CarsDataGrid.Name = "CarsDataGrid";
            CarsDataGrid.Size = new Size(813, 425);
            CarsDataGrid.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Times New Roman", 24F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.ForeColor = Color.White;
            label1.Location = new Point(364, 9);
            label1.Name = "label1";
            label1.Size = new Size(217, 36);
            label1.TabIndex = 1;
            label1.Text = "Database table";
            // 
            // Next
            // 
            Next.Font = new Font("Times New Roman", 12F);
            Next.Location = new Point(802, 501);
            Next.Name = "Next";
            Next.Size = new Size(75, 23);
            Next.TabIndex = 2;
            Next.Text = "Next";
            Next.UseVisualStyleBackColor = true;
            Next.Click += Next_Click;
            // 
            // Previous
            // 
            Previous.Font = new Font("Times New Roman", 12F);
            Previous.Location = new Point(721, 501);
            Previous.Name = "Previous";
            Previous.Size = new Size(75, 23);
            Previous.TabIndex = 3;
            Previous.Text = "Previous";
            Previous.UseVisualStyleBackColor = true;
            Previous.Click += Previous_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.FromArgb(21, 20, 20);
            ClientSize = new Size(937, 554);
            Controls.Add(Previous);
            Controls.Add(Next);
            Controls.Add(label1);
            Controls.Add(CarsDataGrid);
            Name = "Form1";
            Text = "Data Fetcher";
            ((System.ComponentModel.ISupportInitialize)CarsDataGrid).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView CarsDataGrid;
        private Label label1;
        private Button Next;
        private Button Previous;
    }
}
