import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:part_9/models/User.dart';
import 'package:part_9/screens/UserDetailScreen.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

// объявление переменной списка с типом данных User
List<User> userList = [
  User(
      age: 19,
      firstName: 'Григорий',
      lastName: 'Смирнов',
      phone: '83456994597',
      email: 'example@mail.ru',
      avatar:
          'https://i5.stat01.com/2/1818/118176103/075a3e/plakat-jojo-no-kimyou-na-bouken.jpg'),
  User(
      age: 22,
      firstName: 'Коля',
      lastName: 'Бессонов',
      phone: '89641251697',
      email: 'example@mail.ru',
      avatar: 'https://i.ytimg.com/vi/WE147urFuRs/maxresdefault.jpg'),
  User(
      age: 20,
      firstName: 'Ашот',
      lastName: 'Гаспарян',
      phone: '237623595',
      email: 'example@mail.ru',
      avatar:
          'https://www.meme-arsenal.com/memes/90a339dd0bbcafac7c4f42de1ed4a6ae.jpg'),
];

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    user: userList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: userList[index].avatar == ''
                            ? Image.network(
                                'https://www.pngmart.com/image/193237/png/193236')
                            : Image.network(userList[index].avatar,
                                fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Имя: ' + userList[index].firstName,
                                textAlign: TextAlign.left,
                              ),
                              Text('Фамилия: ' + userList[index].lastName),
                              Text(
                                  'Возраст: ' + userList[index].age.toString()),
                              Text('Телефон: ' + userList[index].phone),
                              Text('Email: ' + userList[index].email),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
