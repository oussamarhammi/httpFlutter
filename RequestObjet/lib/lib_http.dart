
import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:requestobjet/transfer.dart';

final dio = Dio();

Future <Truc> httpComplex(String nom) async {
  try{
    var response = await dio.get('https://exercices-web.herokuapp.com/exos/truc/complexe?name='+nom);
    print(response);
    return  Truc.fromJson(response.data); // transform la reponse data en objet truc;
  }
  catch(e){
    print(e);
    throw(e);
  }
}



Future <List<Truc>> httpList() async {
  try{
    var response = await dio.get('https://exercices-web.herokuapp.com/exos/truc/list');
    print(response);
    var listJson = response.data as List;// recupere une liste de json
    var listTruc= listJson.map(
            (elementJSon) {
          return Truc.fromJson(elementJSon);
        }
    ).toList(); // fonction qui prend l element json et le transforme en truc
    return listTruc ; // transform la reponse data en objet truc;

  }
  catch(e){
    print(e);
    throw(e);
  }
}

Future httpSimple() async {
  try{
    var response = await dio.get('https://exercices-web.herokuapp.com/exos/long/double/');
    print(response);
    return response.data;

  }
  catch(e){
    print(e);
    throw(e);
  }
}