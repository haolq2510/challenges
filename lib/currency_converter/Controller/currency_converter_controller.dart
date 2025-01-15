import 'dart:ffi';

import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/currency.dart';

class Controller {
  Currency? baseCurrency;
  Currency? targetCurrency;
  double? exchangeRate;
  String error='';
  String ResultValue='';
  bool errorHolding=true;

  selectBase(Currency? value) {
    if (value==targetCurrency) targetCurrency=baseCurrency;
    baseCurrency = value;
    updateRate();
  }
  selectTarget(Currency? value) {
    if (value==baseCurrency) baseCurrency=targetCurrency;
    targetCurrency = value;
    updateRate();
  }

  updateRate() async {
    exchangeRate = null;
    errorHolding = true;
    try {
      exchangeRate = await CurrencyConverter.convert(
          from: baseCurrency!,
          to: targetCurrency!,
          amount: 1
      );
    }
    catch (e) {
      if (baseCurrency==null || targetCurrency==null) {
        error = "Have not set currencies for conversion.";
      }
    }
  }
  void convert(String value) async {
    try {
      if (exchangeRate == null) throw Exception("Unable to get exchange rate, try again.");
      if (value=='') {
        ResultValue = '';
        errorHolding = true;
        return;
      }
      double result= double.parse(value)*exchangeRate!;
      ResultValue = result.toString();
      errorHolding = true;
    }
    catch (e) {
      error = e.toString();
      errorHolding = false;
    }
  }

  String displayChoice(Currency currency) {
    String result = currency.name.toUpperCase() + AllCurrency.allCurrencyWithCountries
        .entries.where((subdata)=>subdata.key==currency.name)
        .map<String>((entry)=>entry.value).toString();
    return result;
  }
}