library nik_parser_id;

part 'wilayah.dart';

class NIK {
  final String nik;
  final Map data = {"status": false, "msg": ""};

  NIK({required this.nik});

  String? getArea({required area, required endCode}) =>
      wilayah[area][nik.substring(0, endCode)];

  dynamic getData(key) {
    return data[key];
  }

  dynamic setData(key, value) {
    data[key] = value;
  }

  dynamic setMsg(value) {
    data["msg"] = value;
  }

  String capitalize(string) {
    return string
        .toLowerCase()
        .split(" ")
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(" ");
  }

  parseNik() {
    if (nik.length != 16) return setMsg("NIK length must be 16 characters!");

    var provincee = getArea(area: "provinsi", endCode: 2) ?? "";
    var city = getArea(area: "kabkot", endCode: 4) ?? "";
    dynamic districts = getArea(area: "kecamatan", endCode: 6) ?? "";

    if (provincee.isEmpty) return setMsg("Invalid Provincee code");
    if (city.isEmpty) return setMsg("Invalid city code");
    if (districts.isEmpty) return setMsg("Invalid district code");

    data["nik"] = nik;
    data["provinsi"] = provincee;
    data["kotakab"] = city;
    data["tambahan"] = {};
    data["lahir"] = {};

    var yearNow = DateTime.now().year.toString().substring(2, 4);
    var birthYear = "20${nik.substring(10, 12)}";
    var birthMonth = nik.substring(8, 10);
    var birthDate = nik.substring(6, 8);
    districts = districts.split(" -- ");
    data["kecamatan"] = districts[0];
    data["tambahan"]["kodepos"] = districts[1];

    var gender = int.parse(birthDate) > 40 ? "Perempuan" : "Laki-Laki";

    if (gender == "Perempuan") {
      birthDate = (int.parse(birthDate) - 40).toString();
      birthDate = birthDate.length > 1 ? birthDate : "0$birthDate";
    }
    data["kelamin"] = gender;

    if (int.parse(birthYear.substring(2, 4)) > int.parse(yearNow)) {
      birthYear = "19${birthYear.substring(2, 4)}";
    }

    data["lahir"]["tanggal"] = birthDate;
    data["lahir"]["bulan"] = birthMonth;
    data["lahir"]["tahun"] = birthYear;
    data["lahir"]["string"] = "$birthDate/$birthMonth/$birthYear";
    data["uniqcode"] = nik.substring(12, 16);

    setData("status", true);
    setMsg("Success");
  }
}
