import 'package:flutter_test/flutter_test.dart';

import 'package:nik_parser_id/nik_parser_id.dart';

void main() {
  test('adds one to input values', () {
    final nik = NIK(nik: '3302181007010005');

    final res = {
      "status": true,
      "msg": {
        "nik": "3202281101020007",
        "provinsi": "JAWA BARAT",
        "kotakab": "KAB. SUKABUMI",
        "tambahan": {"kodepos": "43155"},
        "lahir": {
          "tanggal": "11",
          "bulan": "01",
          "tahun": "2002",
          "string": "11/01/2002"
        },
        "kecamatan": "CICANTAYAN",
        "kelamin": "LAKI-LAKI",
        "uniqcode": "0007"
      }
    };

    expect(nik.parseNik(), res);
  });
}
