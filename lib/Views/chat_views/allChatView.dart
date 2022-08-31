import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllChatView extends StatelessWidget {
  const AllChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 56,
                  decoration: const BoxDecoration(color: Colors.cyan,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                          child: Text(
                            "Discussions",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                          )
                      ),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 16),
                          padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add,color: Colors.blue,size: 20,),
                              SizedBox(width: 2,),
                              Text("Créer nouvelle",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.conversations.length == 0
                    ? Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      "No conversations yet",
                      style: TextStyle(
                        color: Colors.blueGrey[200],
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
                    : ListView.builder(
                  reverse: true,
                  itemCount: controller.conversations.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    //ConversationModel c = serviceConversations[index];
                    ChatMessageModel lastMessage =
                    c.chatMessages[c.chatMessages.length - 1];
                    return ConversationListItem(
                      name: c
                          .description, //the participants of this current conversation
                      messageText: lastMessage.senderName +
                          ": " +
                          lastMessage.message,
                      imageUrl: "https://picsum.photos/200",
                      time: lastMessage.timestamp,
                      onClickFunction: () {
                        //give the selected conversation as argument
                        Get.toNamed("/chatDetail", arguments: {
                          "currentConversation": c,
                          "description": c.description,
                          "index": index
                        }).then((value) {
                          getConversations();
                          print('INSIDE SET STATE of chat_item');
                          setState((){});
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
