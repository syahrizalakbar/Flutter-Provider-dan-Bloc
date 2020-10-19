import 'package:flutter/material.dart';
import 'package:flutter_app_provider/provider_example/provider/post_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // var postProver = PostProvider.initPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: MultiProvider(
        // lebih dari satu class ChangeNotifier
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => PostProvider.initPost(),
          ),
        ],
        child: ListView(
          children: [
            Center(
              child: Text(
                'Daftar Posts',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Consumer<PostProvider>(
              builder: (BuildContext context, value, Widget child) {
                if (value.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: value.listPost.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(value.listPost[index].title),
                        subtitle: Text(value.listPost[index].body),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
