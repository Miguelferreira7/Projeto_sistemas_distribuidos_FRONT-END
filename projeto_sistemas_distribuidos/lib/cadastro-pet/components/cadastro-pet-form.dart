import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/bloc/cadastro-pet-cubit-model.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/bloc/cadastro-pet-cubit.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/models/Pet.dart';

class CadastroPet extends StatefulWidget {
  static String ROUTE = '/cadastroPet';

  @override
  _CadastroPetState createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  CadastroPetCubit? _bloc;
  TextEditingController controladorNomePet = new TextEditingController();
  TextEditingController controladoridadePet = new TextEditingController();
  TextEditingController controladorRacaPet = new TextEditingController();
  TextEditingController controladorLocalizacaoPet = new TextEditingController();
  TextEditingController controladorHistoriaPet = new TextEditingController();
  TextEditingController controladorPortePet = new TextEditingController();

  Pet pet = new Pet();

  @override
  Widget build(BuildContext context) {
    _bloc = ModalRoute.of(context)?.settings.arguments as CadastroPetCubit;

    return BlocProvider.value(
      value: _bloc!,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Color.fromRGBO(96, 80, 136, 1),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: new Text(
              'CADASTRE SEU PET',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(96, 80, 136, 1)),
            ),
            backgroundColor: Colors.white,
          ),
          body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: new Container(
        alignment: Alignment.bottomCenter,
        child: new Column(
          children: [
            new Container(
              padding: const EdgeInsets.only(bottom: 24),

            ),
            _retornaCampoForms("NOME", controladorNomePet, TextInputType.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _retornaCampoIdadePorte(
                    "IDADE", controladoridadePet, TextInputType.number),
                _retornaCampoIdadePorte(
                    "PORTE", controladorPortePet, TextInputType.text),
              ],
            ),
            _retornaCampoForms("RAÇA", controladorRacaPet, TextInputType.text),
            _retornaCampoForms(
                "LOCALIZAÇÃO", controladorLocalizacaoPet, TextInputType.text),
            _retornaCampoForms(
                "HISTÓRIA DO PET", controladorHistoriaPet, TextInputType.text),
            _retornaAnexoFoto(),
            new Container(
              width: MediaQuery.of(context).size.width / 2,
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(96, 80, 136, 1.0)),
                onPressed: () async {
                  pet.nome = controladorNomePet.text;
                  pet.idade = int.parse(controladoridadePet.text);
                  pet.raca = controladorRacaPet.text;
                  pet.localizacao = controladorLocalizacaoPet.text;
                  pet.historia = controladorHistoriaPet.text;
                  pet.porte = controladorPortePet.text;
                  pet.imagem = _bloc!.imagemPetBase64;
                  pet.idDono = _bloc!.idUsuario;

                  _bloc!.cadastrarPet(context, pet);
                  _bloc!.inicializarListaPets();
                  Navigator.of(context).pop();
                },
                child: new Text("CADASTRAR",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _retornaCampoIdadePorte(String nomeCampo,
      TextEditingController controlador, TextInputType tipoTeclado) {
    return new Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width * 0.38,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(nomeCampo,
                style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromRGBO(96, 80, 136, 1),
                    fontWeight: FontWeight.bold)),
          ),
          Flexible(
            flex: 5,
            child: new Container(
              padding: const EdgeInsets.only(left: 8),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(12),
                color: const Color.fromRGBO(228, 226, 222, 1),
              ),
              child: new TextField(
                maxLines: null,
                controller: controlador,
                cursorColor: Colors.transparent,
                decoration: new InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                keyboardType: tipoTeclado,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _retornaCampoForms(String nomeCampo, TextEditingController controlador,
      TextInputType tipoTeclado) {
    return new Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width / 1.2,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(nomeCampo,
                style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromRGBO(96, 80, 136, 1),
                    fontWeight: FontWeight.bold)),
          ),
          Flexible(
            flex: 5,
            child: new Container(
              padding: const EdgeInsets.only(left: 8),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(12),
                color: const Color.fromRGBO(228, 226, 222, 1),
              ),
              child: new TextField(
              
                maxLines: null,
                controller: controlador,
                cursorColor: Colors.transparent,
                decoration: new InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                keyboardType: tipoTeclado,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _retornaAnexoFoto() {
    return new BlocBuilder<CadastroPetCubit, CadastroPetModel>(
        builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 1.4,
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: new OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {
                _bloc!.abrirGaleria();
              },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    "ANEXE UMA FOTO",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromRGBO(96, 80, 136, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: new Icon(
                      Icons.add_a_photo_outlined,
                      size: 48,
                      color: const Color.fromRGBO(96, 80, 136, 1),
                    ),
                  )
                ],
              ),
            ),
          ),
          state.fotoCadastroPet!.path != ''
              ? Image.file(state.fotoCadastroPet!, scale: 10)
              : Container(),
        ],
      );
    });
  }
}
