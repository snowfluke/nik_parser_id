A package for parsing NIK (Nomor Induk Kewarganegaraan) a.k.a Indonesian National Identity Number. Inspired by https://github.com/mul14/nik_parser.ts

## Features

Extract only the essential information from an Indonesian National Identity Number (NIK).

## Usage

How to use it

```dart
import 'package:nik_parser_id/nik_parser_id.dart';

final nik = NIK(nik: '3302181007010005');
final result = nik.parse()

print(result)
```

The result object

```dart
{
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
}
```

## Additional information

You can prettify it using https://gist.github.com/kasperpeulen/d61029fc0bc6cd104602
