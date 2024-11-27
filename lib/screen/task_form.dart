import 'package:flutter/material.dart';
import 'package:task_app/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({required this.taskContext, super.key});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool validateValue(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool validateDifficultyValue(String? value){
    if(value != null && value.isEmpty){
      if(int.parse(value) < 1 || int.parse(value) > 5){
        true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },

          ),
          title: const Text("Task", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.blue[100],
          child: Center(
            child: Container(
              width: 400,
              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Cadastrar Tarefa: ",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value){
                          if(validateValue(value)){
                            return "Preencha o campo de Tarefa";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: taskNameController,
                        decoration: const InputDecoration(
                          hintText: "Nome da tarefa...",
                          hintStyle: TextStyle(color: Colors.black38),
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value){
                          if(validateDifficultyValue(value)){
                            return "A dificuldade da tarefa deve ser entre 1 e 5.";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        decoration: const InputDecoration(
                          hintText: "Dificuldade [1 - 5]...",
                          hintStyle: TextStyle(color: Colors.black38),
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value){
                          if(validateValue(value)){
                            return "Preencha o campo de URL da imagem";
                          }
                          return null;
                        },
                        onChanged: (text) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.url,
                        controller: imageUrlController,
                        decoration: const InputDecoration(
                          hintText: "URL da imagem...",
                          hintStyle: TextStyle(color: Colors.black38),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrlController.text,
                          fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                            return Image.asset("assets/images/no_image.png", fit: BoxFit.cover,);
                        },),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          TaskInherited.of(widget.taskContext).newTask(taskNameController.text, imageUrlController.text, int.parse(difficultyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Tarefa salvar."))
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue)),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
