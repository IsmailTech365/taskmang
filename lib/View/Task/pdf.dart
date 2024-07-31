// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_local_variable, await_only_futures

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:nko_flutter/Data/Model/tasks.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import '../../../Core/services/pdf_api.dart';

class Supplier {
  final Tasks t;
  Supplier({required this.t});
}

class PdfInvoiceApi {
  static late Font arfont;
  static late Font arbdfont;
  static init() async {
    arfont = TtfFont(await rootBundle.load('assets/fonts/trado.ttf'));
    arbdfont = TtfFont(await rootBundle.load('assets/fonts/tradbdo.ttf'));
  }

  static Future<File> generate(Supplier supplier) async {
    final pdf = pw.Document();
    final imageJpg =
        (await rootBundle.load('assets/images/1.png')).buffer.asUint8List();
    pdf.addPage(
      pw.MultiPage(
          theme: ThemeData.withFont(base: arfont, bold: arbdfont),
          margin: EdgeInsets.only(top: 15, left: 10, right: 10),
          textDirection: TextDirection.rtl,
          pageFormat: PdfPageFormat.a5,
          crossAxisAlignment: CrossAxisAlignment.center,
          header: (context) => pw.Container(
                width: PdfPageFormat.a5.width,
                alignment: Alignment.center,
                child: pw.Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    pw.Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Container(
                            alignment: Alignment.topLeft,
                            child: Image(MemoryImage(imageJpg), width: 120),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Container(
                            alignment: Alignment.center,
                            child: Text('مهمة عمل',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          pw.SizedBox(width: 25),
                          pw.Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 12),
                              child: pw.Column(
                                children: [
                                  pw.SizedBox(height: 18),
                                  pw.Text('منظمة نسائم خير',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  pw.Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.only(top: 15),
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          pw.Text('NKO-TASK-00${supplier.t.id}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ]),
                                  ),
                                  pw.Container(
                                    alignment: Alignment.centerRight,
                                    child: pw.Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          pw.Text(supplier.t.date.toString(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ]),
                                  ),
                                ],
                              )),
                        ]),
                  ],
                ),
              ),
          build: (context) => [
                SizedBox(height: 2),
                Container(
                    height: 125,
                    width: PdfPageFormat.a5.width,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 10, top: 10, left: 10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('أعضاء الفريق: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('${supplier.t.team} - ${supplier.t.supoort}',
                              style: TextStyle(fontSize: 14)),
                          SizedBox(width: 3),
                        ])),
                Container(
                    alignment: Alignment.topRight,
                    height: 40,
                    width: PdfPageFormat.a5.width,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${supplier.t.destination}',
                              style: TextStyle(fontSize: 14)),
                          SizedBox(width: 3),
                          Text('الوجهة:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                Container(
                    alignment: Alignment.topRight,
                    height: 40,
                    width: PdfPageFormat.a5.width,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(supplier.t.driver.toString(),
                              style: TextStyle(fontSize: 14)),
                          SizedBox(width: 3),
                          Text('السائق:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                Row(children: [
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(right: 8, top: 6),
                    alignment: Alignment.topCenter,
                    width: PdfPageFormat.a5.width / 2 - 15,
                    height: 170,
                    child: Text('موافقة الإدارة:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: PdfPageFormat.a5.width / 2 - 15,
                    //  margin: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 10),
                        Text('عداد السيارة عند المغادرة:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 20),
                        Divider(indent: 25, endIndent: 25),
                        SizedBox(height: 10),
                        Text('عداد السيارة عند الـعودة:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 20),
                        Divider(indent: 25, endIndent: 25),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(right: 30, left: 30),
                          alignment: Alignment.center,
                          height: 25,
                          //    width: PdfPageFormat.a5.width / 2 - 10,
                          child: BarcodeWidget(
                            drawText: false,
                            barcode: Barcode.code93(),
                            data: 'NKO-TASK-${supplier.t.id!}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
              ],
          footer: (context) => Column(children: [
                Divider(endIndent: 20, indent: 20),
                SizedBox(height: 20),
              ])),
    );

    return PdfApi.saveDocument(name: 'Task.pdf', pdf: pdf);
  }
}
