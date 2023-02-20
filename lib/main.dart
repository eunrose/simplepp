import 'package:flutter/material.dart';
import 'package:simpleapp/page.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Basic Data",
    theme: ThemeData.light(),
    home:  const PageOne () ,
  )
  );
}

