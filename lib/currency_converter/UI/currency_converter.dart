import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:currency_converter/currency.dart';

import '../Controller/currency_converter_controller.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final Controller _controller=Controller();

  @override
  void initState() {
    // TODO: implement initState
    selectBase(Currency.usd);
    selectTarget(Currency.vnd);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("CURRENCY EXCHANGE",style: TextStyle(fontWeight: FontWeight.w900,letterSpacing: 2,color: Colors.amber),)),
          const SizedBox(height: 8,),
          Platform.isAndroid||Platform.isIOS?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: DropdownButton(
                        items: Currency.values.map<DropdownMenuItem<Currency>>((Currency unit)
                        => DropdownMenuItem<Currency>(
                            value: unit,
                            child: unit.name.length<7? Text(_controller.displayChoice(unit)):Text(unit.name)))
                            .toList(),
                        value: _controller.baseCurrency,
                        onChanged: selectBase,
                      ),
                    ),
                    const Icon(Icons.currency_exchange_rounded),
                    Container(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: DropdownButton(
                        items: Currency.values.map<DropdownMenuItem<Currency>>((Currency unit)
                        => DropdownMenuItem<Currency>(
                            value: unit,
                            child: unit.name.length<7? Text(_controller.displayChoice(unit),softWrap: true,)
                                :Text(unit.name)))
                            .toList(),
                        value: _controller.targetCurrency,
                        onChanged: selectTarget,
                      ),
                    ),

                  ],
                ),
              )
          :kIsWeb?Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                items: Currency.values.map<DropdownMenuItem<Currency>>((Currency unit)
                => DropdownMenuItem<Currency>(
                    value: unit,
                    child: unit.name.length<7? Text(_controller.displayChoice(unit)):Text(unit.name)))
                .toList(),
                value: _controller.baseCurrency,
                onChanged: selectBase,
              ),
              const Icon(Icons.swap_horiz),
              DropdownButton(
                items: Currency.values.map<DropdownMenuItem<Currency>>((Currency unit)
                => DropdownMenuItem<Currency>(
                    value: unit,
                    child: unit.name.length<7? Text(_controller.displayChoice(unit)):Text(unit.name)))
                    .toList(),
                value: _controller.targetCurrency,
                onChanged: selectTarget,
              ),
            ],
          ):const Text("Implementation error, your devices may not be supported.", style: TextStyle(color: Colors.red)),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: convert,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(_controller.baseCurrency!.name.toUpperCase())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    _controller.ResultValue
                  ),
                ),
                const SizedBox(width: 10,),
                Text(_controller.targetCurrency!.name.toUpperCase())
              ],
            ),
          ),
          _controller.errorHolding?const SizedBox(width: 8):Text(_controller.error,style: TextStyle(color: Colors.red),)
        ],
      ),
    );
  }

  void selectBase(Currency? value) {
    setState(() {
      _controller.selectBase(value);
    });
  }

  void selectTarget(Currency? value) {
    setState(() {
      _controller.selectTarget(value);
    });
  }

  void convert(String value) {
    setState(() {
      _controller.convert(value);
    });
  }

  // void convert(String value) {
  //
  // }
}
