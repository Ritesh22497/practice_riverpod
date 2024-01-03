// import 'package:material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/provider/providers.dart';


class ChangeNotifierProviderScreen extends StatelessWidget {
  const ChangeNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }
}

Widget _buildButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const UserScreen()));
    },
    child: const Text("ChangeNotifier Provider"),
  );
}

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

   @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Widget'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            var data= ref.watch(userProvider);
            return  Text(data.userName);
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userProvider.notifier).changeUserName();
        },
        child: const Icon(Icons.refresh ),
      ),
    );
  }
}
