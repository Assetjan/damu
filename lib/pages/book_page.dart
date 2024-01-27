import 'dart:ui';
import 'package:damu/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPage extends StatelessWidget {
  Book? book;
  BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;

    if (settings.arguments != null && settings.arguments is Book) {
      book = settings.arguments as Book;
    }

    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          child: bodyPage(context),
        ),
      ),
    );
  }

  Widget bodyPage(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(this.book!.imageUrl),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          this.book!.imageUrl,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Column(
                      children: [
                        commonText(this.book!.title, FontWeight.bold),
                        commonText(this.book!.author, FontWeight.normal)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: commonText(
            this.book!.description,
            FontWeight.normal,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 60),
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              _launchURL(
                Uri.parse(this.book!.source),
              );
            },
            child: const Text(
              '    Оқу    ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget commonText(data, FontWeight fontWeight,
      {textAlign = TextAlign.center}) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }

  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
