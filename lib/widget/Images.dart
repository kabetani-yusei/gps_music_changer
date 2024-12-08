import 'package:flutter/material.dart';

class MyImages {
  // Google Driveの共有リンクを直接リンク形式に変更する
  final List<String> _imageLinks = [
    'https://drive.google.com/uc?export=view&id=1OU8EUhP3IyOZyhMIOeNLc4ugOmM74RAE',
    'https://drive.google.com/uc?export=view&id=1QEixqjgfXiJPIijVF6ezVIJlVFpu9SuR',
    'https://drive.google.com/uc?export=view&id=1H_1dHpIRZ7ayT8Z2NDiP_V7ZzihHsNIR',
    'https://drive.google.com/uc?export=view&id=1_KAEmNncDiMaf59iwLF9E-sJ49TzBcET',
    'https://drive.google.com/uc?export=view&id=1w_FmdjuRiCdDFR9ld9Jdz7NZHUi5cHdU',
    'https://drive.google.com/uc?export=view&id=17Jvr4XCxEroMof1bhDm7mXRXOjLDVaaw',
    'https://drive.google.com/uc?export=view&id=1m5D9S-DCRpp6jfi7vYR3PheUd1TCj1nY',
    'https://drive.google.com/uc?export=view&id=1geFCBj4DVVBn76s75mXMnLyh_pOcykjv',
    'https://drive.google.com/uc?export=view&id=17I4p2AzGN5mM1mOB-3iec2VYDUANse_T',
    'https://drive.google.com/uc?export=view&id=1mN5l9j-RkF4b3LM7XchwSIPlKAyZ-7zr',
    'https://drive.google.com/uc?export=view&id=1icJCKf1lf7G6mntFTXnknhcZgeQnJELl',
    'https://drive.google.com/uc?export=view&id=1KIs6siw6eOZjVCZFTOc1d4wm65G5CTxJ',
  ];

  // 画像取得メソッド
  Image getImage(int index) {
    if (index >= 0 && index < _imageLinks.length) {
      return Image.network(_imageLinks[index]);
    } else {
      return Image.asset('assets/images/placeholder.png'); // エラー時のプレースホルダーらしい
    }
  }
}