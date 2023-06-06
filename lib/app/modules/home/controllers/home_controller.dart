import 'package:cashier_pallubasa_andalanga/app/data/product_model/product_model.dart';
import 'package:cashier_pallubasa_andalanga/app/modules/payment_receipt/views/payment_receipt_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  final pallubasa = const ProductModel(harga: 12000, nama: 'Pallubasa').obs;
  final nasi = const ProductModel(harga: 4000, nama: 'Nasi').obs;
  final bungkus = const ProductModel(harga: 14000, nama: 'Bungkus').obs;
  final telur = const ProductModel(harga: 5000, nama: 'Telur').obs;
  final airMineral = const ProductModel(harga: 5000, nama: 'Air Mineral').obs;
  final perkedel = const ProductModel(harga: 3000, nama: 'Perkedel').obs;
  final tehBotol = const ProductModel(harga: 5000, nama: 'Teh Botol').obs;
  final kacang = const ProductModel(harga: 1000, nama: 'Kacang').obs;

  final totalBayar = 0.obs;

  final formatter = NumberFormat("#,###");

  TextEditingController uangC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getTotalBayar();
  }

  void bayar() {
    String uang = uangC.text;
    List ar = uang.split(',');

    int bayar = int.parse(ar.join());

    int kembalian = bayar - totalBayar.value;

    if (kembalian.isNegative) {
      Get.snackbar('Kesalahan', 'uang yang di input tidak cukup');
      return;
    }

    Get.defaultDialog(
      onConfirm: () => Get.back(),
      title: 'Nota',
      content: Column(children: generateMenu(kembalian)),
    );
  }

  List<Widget> generateMenu(int kembalian) {
    List<ProductModel> listAllData = [
      pallubasa.value,
      nasi.value,
      bungkus.value,
      telur.value,
      airMineral.value,
      perkedel.value,
      tehBotol.value,
      kacang.value,
    ];
    List<Widget> listData = [];
    for (var data in listAllData) {
      if (data.count != 0) {
        listData.add(buildMenuItemRow(data.nama, data.count, data.harga));
      }
    }

    listData.add(SizedBox(height: 16));
    listData.add(Divider());
    listData.add(SizedBox(height: 16));

    String totalBayarF = formatter.format(totalBayar.value);
    String kembalianF = formatter.format(kembalian);

    listData.add(buildTotalRow('Total Bayar:', totalBayarF));
    listData.add(buildTotalRow('Jumlah Uang:', uangC.text));
    listData.add(buildTotalRow('Kembali:', kembalianF));

    return listData;
  }

  Widget buildTotalRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Rp $amount',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildMenuItemRow(String name, int quantity, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$name ($quantity)',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Rp ${quantity * price}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void resetAll() {
    pallubasa.value = const ProductModel(harga: 12000, nama: 'Pallubasa');
    nasi.value = const ProductModel(harga: 4000, nama: 'Nasi');
    bungkus.value = const ProductModel(harga: 14000, nama: 'Bungkus');
    telur.value = const ProductModel(harga: 5000, nama: 'Telur');
    airMineral.value = const ProductModel(harga: 5000, nama: 'Air Mineral');
    perkedel.value = const ProductModel(harga: 3000, nama: 'Perkedel');
    tehBotol.value = const ProductModel(harga: 5000, nama: 'Teh Botol');
    kacang.value = const ProductModel(harga: 1000, nama: 'Kacang');
    getTotalBayar();
  }

  void getTotalBayar() {
    totalBayar.value = (pallubasa.value.harga * pallubasa.value.count) +
        (nasi.value.harga * nasi.value.count) +
        (bungkus.value.harga * bungkus.value.count) +
        (telur.value.harga * telur.value.count) +
        (airMineral.value.harga * airMineral.value.count) +
        (perkedel.value.harga * perkedel.value.count) +
        (tehBotol.value.harga * tehBotol.value.count) +
        (kacang.value.harga * kacang.value.count);
  }

  void addPallubasa({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 12000, nama: 'Pallubasa');
    if (count == 0) {
      int count = pallubasa.value.count + 1;
      pallubasa.value = productModel.copyWith(count: count);
    } else {
      pallubasa.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removePallubasa({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 12000, nama: 'Pallubasa');
    if (pallubasa.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = pallubasa.value.count - 1;
      pallubasa.value = productModel.copyWith(count: count);
    } else {
      pallubasa.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addNasi({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 4000, nama: 'Nasi');
    if (count == 0) {
      int count = nasi.value.count + 1;
      nasi.value = productModel.copyWith(count: count);
    } else {
      nasi.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeNasi({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 4000, nama: 'Nasi');
    if (nasi.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = nasi.value.count - 1;
      nasi.value = productModel.copyWith(count: count);
    } else {
      nasi.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addBungkus({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 14000, nama: 'Bungkus');
    if (count == 0) {
      int count = bungkus.value.count + 1;
      bungkus.value = productModel.copyWith(count: count);
    } else {
      bungkus.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeBungkus({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 14000, nama: 'Bungkus');
    if (bungkus.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = bungkus.value.count - 1;
      bungkus.value = productModel.copyWith(count: count);
    } else {
      bungkus.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addTelur({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 5000, nama: 'Telur');
    if (count == 0) {
      int count = telur.value.count + 1;
      telur.value = productModel.copyWith(count: count);
    } else {
      telur.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeTelur({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 5000, nama: 'Telur');
    if (telur.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = telur.value.count - 1;
      telur.value = productModel.copyWith(count: count);
    } else {
      telur.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addAirMineral({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 5000, nama: 'Air Mineral');
    if (count == 0) {
      int count = airMineral.value.count + 1;
      airMineral.value = productModel.copyWith(count: count);
    } else {
      airMineral.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeAirMineral({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 5000, nama: 'Air Mineral');
    if (airMineral.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = airMineral.value.count - 1;
      airMineral.value = productModel.copyWith(count: count);
    } else {
      airMineral.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addPerkedel({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 3000, nama: 'Perkedel');
    if (count == 0) {
      int count = perkedel.value.count + 1;
      perkedel.value = productModel.copyWith(count: count);
    } else {
      perkedel.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removePerkedel({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 3000, nama: 'Perkedel');
    if (perkedel.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = perkedel.value.count - 1;
      perkedel.value = productModel.copyWith(count: count);
    } else {
      perkedel.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addTehBotol({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 5000, nama: 'Teh Botol');
    if (count == 0) {
      int count = tehBotol.value.count + 1;
      tehBotol.value = productModel.copyWith(count: count);
    } else {
      tehBotol.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeTehBotol({int count = 0}) {
    ProductModel productModel =
        const ProductModel(harga: 5000, nama: 'Teh Botol');
    if (tehBotol.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = tehBotol.value.count - 1;
      tehBotol.value = productModel.copyWith(count: count);
    } else {
      tehBotol.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void addKacang({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 1000, nama: 'Kacang');
    if (count == 0) {
      int count = kacang.value.count + 1;
      kacang.value = productModel.copyWith(count: count);
    } else {
      kacang.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }

  void removeKacang({int count = 0}) {
    ProductModel productModel = const ProductModel(harga: 1000, nama: 'Kacang');
    if (kacang.value.count - 1 < 0) {
      return;
    }
    if (count == 0) {
      int count = kacang.value.count - 1;
      kacang.value = productModel.copyWith(count: count);
    } else {
      kacang.value = productModel.copyWith(count: count);
    }
    getTotalBayar();
  }
}
