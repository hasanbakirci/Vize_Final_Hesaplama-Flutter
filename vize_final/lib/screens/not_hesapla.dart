import 'package:flutter/material.dart';

class NotHesapla extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotHesaplaState();
  }
}

class _NotHesaplaState extends State {
  @override
  double sonuc = 0;

  TextEditingController vizeNotu = TextEditingController();
  TextEditingController finalNotu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      child: Container(
        color: Colors.orange[100],
        padding: EdgeInsets.all(60),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: vizeNotu,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //hintText: 'Vize Notu',
                  labelText: 'Vize',
                  border: OutlineInputBorder(),
                ),
                buildCounter:
                    (BuildContext context, // Altta 1/3 diye göstermesin
                            {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                        null,
                maxLength: 3,
                textAlign: TextAlign.center,
                validator: (String value) {
                  if (!notKontrol(value)) {
                    return 'Geçersiz değer';
                  } else
                    return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                controller: finalNotu,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //hintText: 'Final Notu',
                  labelText: 'Final',
                  border: OutlineInputBorder(),
                ),
                buildCounter: (BuildContext context,
                        {int currentLength, int maxLength, bool isFocused}) =>
                    null,
                maxLength: 3,
                textAlign: TextAlign.center,
                validator: (String value) {
                  if (!notKontrol(value)) {
                    return 'Geçersiz değer';
                  } else
                    return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                sonuc.toString(),
                style: TextStyle(
                    fontSize: 25,
                    color: sonuc < 50 ? Colors.redAccent : Colors.green),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: MaterialButton(
                height: 50,
                minWidth: 340,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12)),
                onPressed: () {
                  setState(() {
                    notHesapla();
                  });
                },
                child: Text(
                  "HESAPLA",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int notHesapla() {
    int vizeNot = int.parse(vizeNotu.text);
    int finalNot = int.parse(finalNotu.text);
    sonuc = (vizeNot * 0.40) + (finalNot * 0.60);
    if (sonuc > 100) {
      sonuc = 0;
      return sonuc.round();
    } else
      return sonuc.round();
  }

  bool notKontrol(String value) {
    if (value.isEmpty || int.parse(value) > 100) {
      return false;
    } else {
      return true;
    }
  }
}
