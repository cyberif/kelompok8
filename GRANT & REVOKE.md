<h1>GRANT & REVOKE</h1>
<h3>GRANT</h3>
<h5>Langkah-langkahnya :</h5>
<ol>
   <li>Masuk seperti biasa <b>mysql -u root -p</b></li>
   <li>
      <p>Menggunakan <i>db mysql</i></p>
      <p><b>use mysql;</b></p>
   </li>
   <li>
      <p>Membuat user baru misal</p>
      <p><b>CREATE USER 'staff'@'localhost' IDENTIFIED BY 'staffvioletfilm';</b></p>
      <p>staffvioletfilm itu passwordnya yaa</p>
   </li>
   <li>
      <p>Untuk melihatnya kita bisa ketik</p>
      <p><b>SELECT user, host, password FROM user;</b></p>
   </li>
   <li>
      <p>Lalu kita akan memberi hak akses user</p>
   </li>
   <li>
      <p>Misal kita ingin memberi hak akses user di <i>db_bioskop</i></p>
      <p><b>use db_bioskop;</b></p>
      <p><b>GRANT select, insert, update ON ticket TO 'staff'@'localhost' IDENTIFIED BY 'staffvioletfilm';</b></p>
       <p><i>GRANT(perintah memberi hak akses) -> akses yang diberikan -> tabel yang mana -> memberi ke user siapa</i></p>
   </li>
</ol>
<p>Hasilnya user <i><b>staff@localhost</b></i> hanya bisa melakukan perintah <b>SELECT, INSERT, UPDATE</b></p>
<hr>
<h3>REVOKE</h3>
<h5>Langkah-langkahnya :</h5>
<ol>
   <li>Masuk seperti biasa <b>mysql -u root -p</b></li>
   <li>
      <p>Lalu kita akan menghapus hak akses user</p>
   </li>
   <li>
      <p>Misal kita ingin menghapus hak akses user di <i>db_bioskop</i></p>
      <p><b>use db_bioskop;</b></p>
      <p><b>REVOKE select ON ticket FROM staff@localhost;</b></p>
       <p><i>REVOKE(perintah menghapus hak akses) -> akses yang ingin dihapus -> tabel yang mana -> memberi ke user siapa</i></p>
   </li>
</ol>
<b>TERIMA KASIH<br>SEMOGA BERMANFAAT</b>
