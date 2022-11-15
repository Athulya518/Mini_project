import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/materialoption.dart';
import 'package:malabis/screens/measurement.dart';

class SubmitMeasure extends StatefulWidget {
  String? designimageurl;
  String? designcollar;
  String? category;
  var stitching_price;
  String? type;
var uid;
var name;
var phone;
  String?neckdesign;
  String? wristdesign;
   SubmitMeasure({Key? key,this.uid,this.category,this.type,this
   .wristdesign,this.designcollar,this.neckdesign,this.name,this.phone,this.stitching_price,this.designimageurl}) : super(key: key);

  @override
  _SubmitMeasureState createState() => _SubmitMeasureState();
}

class _SubmitMeasureState extends State<SubmitMeasure> {
  final _mKey = GlobalKey<FormState>();

   TextEditingController _mTextcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),
      body: Center(
        child: Form(
          key: _mKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 30),
                  child: Text("Submit your Measurement",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
                ),
                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 10,right: 10),
                  child: TextFormField(
                    controller: _mTextcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return "Enter a Valid measurement";
                      }
                    },
                    minLines: 5,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Enter Custom Measurement",
                      hintStyle: TextStyle(
                        color: Colors.grey,

                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25),),


                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(onPressed: (){
    if(_mKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>MaterialOption(

        uid: widget.uid,
        name:widget.name,
        phone:widget.phone,
        neckdesign:widget.neckdesign,
        wristdesign:widget.wristdesign,
        designcollar:widget.designcollar,
        designimageurl:widget.designimageurl,
        submit_measurement:_mTextcontroller.text,
        category: widget.category,
        stitching_price:widget.stitching_price,
        type: widget.type,
      )));
    }

                  setState(() {
                    _mTextcontroller.notifyListeners();
                  });

                }, child: Text("Submit"),

                ),

SizedBox(height: 50,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
