import 'package:flutter/material.dart';
import 'package:memory_extreme_app/home_page.dart';
import 'package:memory_extreme_app/pages/jogo_figuras.dart';

class Imagens extends StatefulWidget {
  List<String> imagens;
  List<String> imagensSelecionadas;
  int contador, tamanho;

  Imagens(this.imagens, this.contador, this.tamanho);

  @override
  _ImagensState createState() => _ImagensState();
}

class _ImagensState extends State<Imagens> {
  @override
  Widget build(BuildContext context) {
    String clicada;
    List<String> memorizadas = [];
    int i = 0;
    do {
      memorizadas.add(widget.imagens[i]);
      i++;
    } while (widget.tamanho != memorizadas.length);

    List<String> imagensSelecionadas =
        widget.imagens.take(widget.contador).toList();

    widget.contador += 3;

    imagensSelecionadas..shuffle();

    _imagensCorretas(context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Parabéns você acertou todas as figuras!!",
                  textAlign: TextAlign.center),
              actions: <Widget>[
                TextButton(
                  child: Text("Continuar"),
                  onPressed: () {
                    _onClickNavigator(
                        context, Figuras(widget.contador, widget.tamanho));
                  },
                ),
                TextButton(
                  child: Text("Sair do Jogo"),
                  onPressed: () {
                    _onClickNavigator(context, Jogos());
                  },
                )
              ],
            ),
          );
        },
      );
    }

    _imagensErradas(context) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Uma pena você errou! Quer tentar de novo?",
                  textAlign: TextAlign.center),
              actions: <Widget>[
                TextButton(
                  child: Text("Recomeçar"),
                  onPressed: () {
                    _onClickNavigator(context,
                        Figuras(widget.contador -= 3, widget.tamanho -= 1));
                  },
                ),
                TextButton(
                  child: Text("Sair do Jogo"),
                  onPressed: () {
                    _onClickNavigator(context, Jogos());
                  },
                )
              ],
            ),
          );
        },
      );
    }

    List<String> clicadas = [];

    _verificarImagens(BuildContext context) {
      if (memorizadas.contains(clicada)) {
        if (clicadas.contains(clicada)) {
        } else {
          clicadas.add(clicada);
          if (memorizadas.length == clicadas.length) {
            _imagensCorretas(context);
          }
        }
      } else {
        _imagensErradas(context);
      }
    }

    int num = 0;

    _linhas(num) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                clicada = imagensSelecionadas[num];
                _verificarImagens(context);
                enabled:
                true;
              },
              child: Image(
                width: 75,
                height: 75,
                image: AssetImage(imagensSelecionadas[num]),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                clicada = imagensSelecionadas[num + 1];
                _verificarImagens(context);
                enabled:
                true;
              },
              child: Image(
                width: 75,
                height: 75,
                image: AssetImage(imagensSelecionadas[num + 1]),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                clicada = imagensSelecionadas[num + 2];
                _verificarImagens(context);
                enabled:
                true;
              },
              child: Image(
                width: 75,
                height: 75,
                image: AssetImage(imagensSelecionadas[num + 2]),
              )),
        ],
      );
    }

    matriz3x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    matriz4x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    matriz5x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    matriz6x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    matriz7x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    matriz8x3(imagensSelecionadas) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _linhas(num),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
          _linhas(num += 3),
        ],
      );
    }

    _defineMatriz(imagensSelecionadas) {
      if (widget.tamanho == 2) {
        widget.tamanho += 1;
        return matriz3x3(imagensSelecionadas);
      }
      if (widget.tamanho == 3) {
        widget.tamanho += 1;
        return matriz4x3(imagensSelecionadas);
      }
      if (widget.tamanho == 4) {
        widget.tamanho += 1;
        return matriz5x3(imagensSelecionadas);
      }
      if (widget.tamanho == 5) {
        widget.tamanho += 1;
        return matriz6x3(imagensSelecionadas);
      }
      if (widget.tamanho == 6) {
        widget.tamanho += 1;
        return matriz7x3(imagensSelecionadas);
      }
      if (widget.tamanho == 7) {
        widget.tamanho += 1;
        return matriz8x3(imagensSelecionadas);
      }
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(2),
      width: size.width,
      color: Colors.white,
      child: _defineMatriz(imagensSelecionadas),
    );
  }

  void _onClickNavigator(BuildContext context, Widget homePage) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return homePage;
    }));
  }
}
