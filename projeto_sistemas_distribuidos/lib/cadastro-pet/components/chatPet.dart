import 'package:flutter/material.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/bloc/cadastro-pet-cubit.dart';
import 'package:projeto_sistemas_distribuidos/cadastro-pet/components/cadastro-pet-form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPet extends StatefulWidget {
  const ChatPet({Key? key}) : super(key: key);
  static String ROUTE = "/chatPet";

  @override
  State<ChatPet> createState() => _ChatPetState();
}

class _ChatPetState extends State<ChatPet> {
  TextEditingController _messageController = TextEditingController();
  CadastroPetCubit? _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = ModalRoute.of(context)?.settings.arguments as CadastroPetCubit;
    return BlocProvider.value(
      value: _bloc!,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        padding: EdgeInsets.only(top: 4, bottom: 8),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Theme.of(context).primaryColor,
                size: 25,
              )),
          title: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TESTE',
                style: TextStyle(color: Colors.black),
              ),
              Text('São Paulo - SP', style: TextStyle(color: Colors.grey))
            ],
          ),
          centerTitle: true,
          actions: [
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage('assets/cachorro.jpg'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.only(top: 4, bottom: 4, left: 16, right: 16),
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      child: Row(
                        //alinhar as mensagens por aqui
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
                  _bottomMessage()
        ],
      ),
    );
  }

  Widget _bottomMessage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),

      //color: Colors.blue,
      child: Row(
        children: [
          // Expanded(child: Container()),
          Flexible(
              flex: 5,
              child: new Container(
                padding: EdgeInsets.only(left: 16),
                margin: EdgeInsets.only(right: 8, left: 16),
                //height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  border: new Border.all(
                    color: Colors.grey[700]!,
                    width: 1.0,
                  ),
                ),
                child: new TextField(
                  maxLines: null,
                  controller: _messageController,
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    hintText: 'Digite sua mensagem...',
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                ),
              )),
          Expanded(
            child: Container(
              height: 40,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
