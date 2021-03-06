
import 'package:flutter/material.dart';
import 'package:itk_teacher_students_app/Widgets/Constants.dart';
import 'package:itk_teacher_students_app/Widgets/CustomPostsWidgets.dart';
import 'package:itk_teacher_students_app/Widgets/CustomTags.dart';
import 'package:itk_teacher_students_app/Widgets/CustomUserBanner.dart';

class MyAnnouncementsScreen extends StatefulWidget {
  // MyAnnouncementsScreen({Key? key}) : super(key: key);
  final List? myContent;
  const MyAnnouncementsScreen ({
    this.myContent,
  });

  @override
  _MyAnnouncementsScreenState createState() => _MyAnnouncementsScreenState();
}


class _MyAnnouncementsScreenState extends State<MyAnnouncementsScreen> {
  String img = "https://weneedfun.com/wp-content/uploads/2016/07/Cute-Girl-Profile-pictures-For-Facebook-7.jpg";

  List MyTagsList=[
    MyTagsWidget(
      JsonImage: "https://www.alliantrx.com/wp-content/uploads/2019/03/ARX-Blog_5-Proven-Business-Skills-Hero.png",
    ),
    MyTagsWidget(
      JsonImage: "https://4.bp.blogspot.com/-oL-_anyheGU/WtTtE8XZglI/AAAAAAAAuM4/XDCv-aJfrFwBVaHMNWJVcOkwk_IbN8VRwCLcBGAs/s1600/habilidades-blandas-psicologia.jpg",
    ),
    MyTagsWidget(
    ),
    MyTagsWidget(
      JsonImage: "https://study.com/cimages/course-image/nmta-english-language-arts-practice-study-guide_186382_large.jpg",
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    List? mycontenList = widget.myContent;
   
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height *0.25,
                decoration: BoxDecoration(
                  color: MyPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,2),
                      blurRadius: 15,
                      color: My3ndColor,
                    )
                  ]
                ),
              ),
              Positioned(
                bottom: 55,
                left: 20,
                right: 20,
                child: MyCustomUserBanner(img: img),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Container(
              height: 70,
              // color: Colors.pink,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: mycontenList?.length,
                itemCount: MyTagsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: MyTagsList[index],
                    // child: MyTagsWidget(
                    //   JsonImage:  "${mycontenList?[index]["yoast_head_json"]["og_image"][0]["url"]}",
                    // ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:20),
              child: ListView.builder(
                itemCount: mycontenList?.length,
                itemBuilder: (BuildContext context, int index) {
                  // return myPostsList[index];
                  return MyPostsWidget(
                    JsonImg: "${mycontenList?[index]["yoast_head_json"]["og_image"][0]["url"]}",
                    JsonBody: "${mycontenList![index]["yoast_head_json"]["og_description"]}",
                  );
                },
              ),
            ), 
          ),

          

          
        ],
      ),
    );
  }
}
