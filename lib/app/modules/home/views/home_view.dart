import 'package:cashier_pallubasa_andalanga/config/config.dart';
import 'package:cashier_pallubasa_andalanga/constants/constants.dart';
import 'package:cashier_pallubasa_andalanga/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getPropertionateScreenWidht(24),
                ),
                Text(
                  'Selamat datang di kasir',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: getPropertionateScreenWidht(20),
                  ),
                ),
                Text(
                  'Pallubasa Andalanga',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: getPropertionateScreenWidht(20),
                  ),
                ),
                SizedBox(
                  height: getPropertionateScreenWidht(24),
                ),
                Obx(
                  () => Wrap(
                    spacing: getPropertionateScreenWidht(16),
                    runSpacing: getPropertionateScreenWidht(16),
                    children: [
                      MenuCard(
                        title: 'Pallubasa',
                        price: '12.000',
                        color: ColorCollections.pallubasa,
                        icon: 'icon-pallubasa',
                        count: controller.pallubasa.value.count,
                        addFunction: () => controller.addPallubasa(),
                        removeFunction: () => controller.removePallubasa(),
                      ),
                      MenuCard(
                        title: 'Nasi',
                        price: '4000',
                        color: ColorCollections.nasi,
                        icon: 'icon-nasi',
                        count: controller.nasi.value.count,
                        addFunction: () => controller.addNasi(),
                        removeFunction: () => controller.removeNasi(),
                      ),
                      MenuCard(
                        title: 'Bungkus',
                        price: '14.000',
                        color: ColorCollections.bungkus,
                        icon: 'icon-bungkus',
                        count: controller.bungkus.value.count,
                        addFunction: () => controller.addBungkus(),
                        removeFunction: () => controller.removeBungkus(),
                      ),
                      MenuCard(
                        title: 'Telur',
                        price: '5000',
                        color: ColorCollections.telur,
                        icon: 'icon-telur',
                        count: controller.telur.value.count,
                        addFunction: () => controller.addTelur(),
                        removeFunction: () => controller.removeTelur(),
                      ),
                      MenuCard(
                        title: 'Air Mineral',
                        price: '5000',
                        color: ColorCollections.airMineral,
                        icon: 'icon-air-mineral',
                        count: controller.airMineral.value.count,
                        addFunction: () => controller.addAirMineral(),
                        removeFunction: () => controller.removeAirMineral(),
                      ),
                      MenuCard(
                        title: 'Perkedel',
                        price: '3000',
                        color: ColorCollections.perkedel,
                        icon: 'icon-perkedel',
                        count: controller.perkedel.value.count,
                        addFunction: () => controller.addPerkedel(),
                        removeFunction: () => controller.removePerkedel(),
                      ),
                      MenuCard(
                        title: 'Teh Botol',
                        price: '5000',
                        color: ColorCollections.tehBotol,
                        icon: 'icon-teh-botol',
                        count: controller.tehBotol.value.count,
                        addFunction: () => controller.addTehBotol(),
                        removeFunction: () => controller.removeTehBotol(),
                      ),
                      MenuCard(
                        title: 'Kacang',
                        price: '1000',
                        color: ColorCollections.kacang,
                        icon: 'icon-kacang',
                        count: controller.kacang.value.count,
                        addFunction: () => controller.addKacang(),
                        removeFunction: () => controller.removeKacang(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: getPropertionateScreenWidht(150),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: kBackgroundColor2,
          boxShadow: softShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total bayar',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: getPropertionateScreenWidht(16),
                      ),
                    ),
                    Obx(
                      () => Text(
                        'Rp.${controller.formatter.format(controller.totalBayar.value)}',
                        style: primaryTextStyle.copyWith(
                          fontSize: getPropertionateScreenWidht(14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPropertionateScreenWidht(40),
                  child: ElevatedButton(
                    onPressed: () => controller.resetAll(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Text(
                      'Hapus semua',
                      style: whiteTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              height: getPropertionateScreenWidht(6),
            ),
            SizedBox(
              width: double.infinity,
              height: getPropertionateScreenWidht(40),
              child: ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Masukkan Jumlah Uang',
                    onConfirm: () {
                      if (controller.uangC.text == '') {
                        return;
                      }
                      Get.back();
                      controller.bayar();
                    },
                    content: TextFormField(
                      controller: controller.uangC,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        UangRupiahInputFormatter()
                      ],
                      decoration: InputDecoration(
                        hintText: 'Masukkan uang',
                        prefixText: 'Rp ',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Text(
                  'Bayar',
                  style: whiteTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UangRupiahInputFormatter extends TextInputFormatter {
  @override
  set newText(String newText) {}

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat("#,###");

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.title,
    required this.price,
    required this.icon,
    required this.color,
    required this.addFunction,
    required this.count,
    required this.removeFunction,
  });

  final String title, price, icon;
  final Color color;
  final int count;

  final Function() addFunction;
  final Function() removeFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: addFunction,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: getPropertionateScreenWidht(188),
            width: getPropertionateScreenWidht(156),
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: removeFunction,
                    child: Container(
                      width: getPropertionateScreenWidht(43),
                      height: getPropertionateScreenHeight(43),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '-',
                          style: whiteTextStyle.copyWith(
                            fontSize: getPropertionateScreenWidht(18),
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: getPropertionateScreenWidht(16),
                            ),
                          ),
                          Text(
                            'Rp.$price',
                            style: primaryTextStyle.copyWith(
                              fontSize: getPropertionateScreenWidht(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: getPropertionateScreenWidht(43),
                      height: getPropertionateScreenHeight(43),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: whiteTextStyle.copyWith(
                            fontSize: getPropertionateScreenWidht(18),
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset('assets/$icon.svg'),
        ],
      ),
    );
  }
}
