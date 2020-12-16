import 'package:flutter/material.dart';

List<Map> listDescription = [
  {
    "icon":
        "https://i1.wp.com/refactory.id/wp-content/uploads/2020/01/material_approval.png?fit=50%2C48&ssl=1",
    "title": "Memperkuat Tim Engineer Anda",
    "description":
        "Bisnis di jaman modern membutuhkan keterampilan pengembangan terbaik untuk meningkatkan skala produk. Kami dapat mempersiapkan course dan juga dapat menyediakan tim yang menangani kebutuhan digital Anda.",
  },
  {
    "icon":
        "https://i2.wp.com/refactory.id/wp-content/uploads/2020/01/material_bolt.png?fit=28%2C48&ssl=1",
    "title": "Wujudkan Software Impian Anda",
    "description":
        "Kami adalah perusahaan One-Stop IT Solution untuk proyek Anda, membantu di setiap tahap mulai dari menyusun ide, melalui desain dan pengembangan aplikasi seluler, situs web dan aplikasi desktop, hingga peluncuran produk.",
  },
];

class Description extends StatelessWidget {
  const Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Apa Yang Refactory Dapat Bantu?',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listDescription.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = listDescription[index];
              return Column(
                children: [
                  SizedBox(height: 30),
                  Image.network(data['icon']),
                  SizedBox(
                    height: width * 0.09,
                  ),
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['description'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: width * 0.04,
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
