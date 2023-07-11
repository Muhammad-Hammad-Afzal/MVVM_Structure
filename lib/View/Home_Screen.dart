import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Routs/routes_name.dart';
import 'package:mvvmproject/Utils/Utils.dart';
import 'package:mvvmproject/View/newscreen.dart';
import 'package:mvvmproject/ViewModel/GetApi_View_Model.dart';
import 'package:mvvmproject/ViewModel/Token_View_Model.dart';
import 'package:mvvmproject/data/responce/status.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getapiviewmodel = GetApiViewModel();

  @override
  void initState() {
    // TODO: implement initState
    getapiviewmodel.getApiResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text('HomeScreen'),
        actions: [
          IconButton(onPressed: (){
            UserViewModel().RemoveUser().then((value){
              Navigator.pushNamed(context, RoutesName.Login_Screen);
            }).onError((error, stackTrace){
              Utils().ShowSnackbar(context, error.toString());
            });

          }, icon:const Icon(Icons.logout_outlined))
        ],
      ),
      body: ChangeNotifierProvider<GetApiViewModel>(
          create: (BuildContext context) => getapiviewmodel,
          child: Consumer<GetApiViewModel>(
              builder: (context, value, _){
                switch(value.apiResponse.status){
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator(color: Colors.purple));
                  case Status.ERROR:
                    return const Center(child: Text("An Error Occurred", style: TextStyle(fontSize: 30)));
                  case Status.COMPLETED:
                    return Column(
                      children: [
                        Expanded(
                          child: FutureBuilder(
                            future: getapiviewmodel.getApiResults(),
                            builder: (context, snapshot){
                              if(!snapshot.hasData){
                                return const Center(child: CircularProgressIndicator(color: Colors.purple));
                              }
                              else{
                                return ListView.builder(
                                    itemCount: snapshot.data!.userId,
                                    itemBuilder: (context, index){
                                  return Card(
                                    child: ListTile(
                                      leading: Text(snapshot.data!.id.toString(),style:const TextStyle(fontSize: 28)),
                                      subtitle : Text(snapshot.data!.title.toString()),
                                    ),
                                  );
                                });
                              }
                              
                      }),
                        ),
                       ElevatedButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()));
                       }, child: Text('dsfsdf'))
                      ]
                    );
                  default:
                    return const Center(child: Text('Go As Default'));
                }

          }),
      )
    );
  }
}
