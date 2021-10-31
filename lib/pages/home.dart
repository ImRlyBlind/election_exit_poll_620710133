import 'package:election_exit_poll_620710133/models/polls.dart';
import 'package:election_exit_poll_620710133/services/api.dart';
import 'package:flutter/material.dart';

class ExitPoll extends StatefulWidget {
  const ExitPoll({Key? key}) : super(key: key);

  @override
  _ExitPollState createState() => _ExitPollState();
}

class _ExitPollState extends State<ExitPoll> {
  late Future<List<Polls>> _futureExitPoll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<Polls>>(
          future: _futureExitPoll,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var itemPoll = snapshot.data![index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${itemPoll.number.toString()} ',
                                style: TextStyle(fontSize: 35),
                              ),
                              Text(
                                itemPoll.title.toString(),
                                style: TextStyle(fontSize: 35),
                              ),
                              Text(
                                '${itemPoll.firstName.toString()} ',
                                style: TextStyle(fontSize: 35),
                              ),
                              Text(
                                itemPoll.lastName.toString(),
                                style: TextStyle(fontSize: 35),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<List<Polls>> _loadPoll() async {
    List list = await Api().fetch('exit_poll');
    //print(list);
    var poll = list.map((item) => Polls.fromJson(item)).toList();
    return poll;
  }

  @override
  void initState() {
    super.initState();

    _futureExitPoll = _loadPoll();
  }
}
