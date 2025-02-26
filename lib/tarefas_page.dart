import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
List<String> tarefas = [
  "Pagar contas",
  "Comprar roupas",
];

String novaTarefa = "";

void addTarefa(){
  if (novaTarefa != ""){
  setState(() {
    tarefas.add(novaTarefa);
  });
}
}

void removeTarefa(String tarefa){
  
 setState(() {
  tarefas.remove(tarefa);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tarefas"),
        centerTitle: true,
      ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
      children: [
       ...tarefas.map((tarefa)=>  
       GestureDetector(
        onTap: (){
          removeTarefa(tarefa);
        },
         child: Card(
           child: Container(
            padding: EdgeInsets.all(10),
            child: Text(tarefa))),
       ))
      
        ],
      ),
    ),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  onChanged: (valor) {
                    novaTarefa = valor;
                    },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(), focusedBorder: OutlineInputBorder()
                  ),
                )),
              GestureDetector(
                onTap: () {
                  addTarefa();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: const Color.fromARGB(255, 253, 251, 251),
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}