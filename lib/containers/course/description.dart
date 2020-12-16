import 'package:flutter/material.dart';

class DescriptionCourse extends StatelessWidget {
  const DescriptionCourse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            'https://i1.wp.com/refactory.id/wp-content/uploads/2020/01/IMG_1152-1.jpg?fit=690%2C800&ssl=1',
          ),
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            'Kursus pemrograman untuk semua orang tanpa terkecuali',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Refactory Course dirancang untuk memudahkan setiap orang mampu meningkatkan keahlian dalam software engineering tanpa dibatasi oleh kesulitan akses, kesulitan waktu, batasan keahlian, ataupun usia. Dengan pembelajaran berdasarkan pengalaman nyata pengerjaan project, bagi pelajar/mahasiswa, Refactory Course akan melengkapi keahlian yang sudah diperoleh dalam studi sehingga dapat membuka kesempatan tak terbatas pada karir software engineering. Bagi karyawan atau tenaga profesional, Refactory Course dapat meningkatkan keahlian software engineer dalam menunjang menyelesaikan tugas pekerjaannya tanpa khawatir dengan keterbatasan waktu. Masyarakat secara luas juga dapat memanfaatkan pembelajaran untuk meningkatkan keahlian sehingga mampu berkarya dan mendapat keuntungan karir tanpa',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}
