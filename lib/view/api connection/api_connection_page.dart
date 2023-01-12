import 'package:flutter/material.dart';
import 'package:login_demo_mt/controller/api_serviece.dart';
import 'package:login_demo_mt/view/api%20connection/widget/drawer.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => ApiPageState();
}

class ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<ProviderItem>(builder: (context, apiProvider, _) {
        return FutureBuilder(
            future: ApiServiece()
                .getFilmDetails("movies", "kannada", "all", "voting"),
            builder: (context, snapshot) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  drawer: NavDrawer(),
                  appBar: AppBar(),
                  body: snapshot.hasData
                      ? ListView.separated(
                          itemBuilder: (context, index) => Center(
                            child: Container(
                              width: widths * 0.9,
                              height: heights * 0.3,
                              color: const Color.fromARGB(185, 255, 255, 255),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: heights * 0.008,
                                                left: widths * 0.01),
                                            child: Icon(
                                              Icons.arrow_drop_up_outlined,
                                              size: heights * 0.1,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: heights * 0.008,
                                                left: widths * 0.01),
                                            child: Text(
                                              snapshot.data!.result![index]!.voting.toString(),
                                              style: TextStyle(fontSize: 22),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: heights * 0.08,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: heights * 0.18,
                                          width: widths * 0.28,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    snapshot.data!.result![index]!
                                                        .poster
                                                        .toString(),
                                                  ))),
                                          // child:Image(image: ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: widths * 0.03,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Container(
                                            width: widths * 0.35,
                                            height: heights * 0.18,
                                            // color: Colors.blue,
                                            child: ListView(
                                              children: [
                                                Text(
                                                    snapshot.data!
                                                        .result![index]!.title
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize:
                                                            heights * 0.03,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                SizedBox(
                                                  height: heights * 0.008,
                                                ),
                                                Text(
                                                  'Genre: ' +
                                                      snapshot.data!
                                                          .result![index]!.genre
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: heights * 0.02),
                                                ),
                                                SizedBox(
                                                  height: heights * 0.008,
                                                ),
                                                Text(
                                                  'Director: ' +
                                                      snapshot.data!
                                                          .result![index]!.director![0]
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: heights * 0.02),
                                                ),
                                                SizedBox(
                                                  height: heights * 0.008,
                                                ),
                                                Text(
                                                  'Starring: ' +
                                                      snapshot.data!
                                                          .result![index]!.stars![0].toString()
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: heights * 0.02),
                                                ),
                                              ],
                                            )
                                            // SizedBox(child: ,)),

                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: widths * 0.07),
                                        child: Text(
                                          'votes',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: widths*0.3,
                                      ),
                                      Text(
                                          '${snapshot.data!.result![index]!.pageViews.toString()} views | voted by ${snapshot.data!.result![index]!.totalVoted.toString()} people',style: TextStyle(color: Colors.blue),)
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: widths * 0.025),
                                    child: SizedBox(
                                      width: widths * 0.85,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Watch trailer')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemCount: snapshot.data!.result!.length,
                        )
                      : SizedBox());
            });
      }),
    );
  }
}
