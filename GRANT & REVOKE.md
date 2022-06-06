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
      <p>Lalu kita akan memberi akses user</p>
   </li>
   <li>
      <p>Misal kita ingin memberi akses ke user di <i>db_ikanhias_azzah</i></p>
      <p><b>use db_ikanhias_azzah;</b></p>
      <p><b>GRANT select, insert, update ON product TO 'staff'@'localhost' IDENTIFIED BY 'staffvioletfilm';</b></p>
       <p><i>GRANT(perintah memberi akses) -> akses yang diberikan -> tabel yang mana -> memberi ke user siapa</i></p>
   </li>
</ol>

__TERIMA KASIH<br>SEMOGA BERMANFAAT__
