import 'package:flutter/material.dart';
import '../bloc/sku/sku_bloc.dart';
import '../bloc/sku/sku_event.dart';
import '../bloc/sku/sku_state.dart';
import '../models/sku.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkusScreen extends StatelessWidget {
  const SkusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Center(child: BlocBuilder<SkuBloc, SkuState>(builder: (context, state) {
      if (state is SkuInitial) {
        return ElevatedButton(
            onPressed: () {
              context.read<SkuBloc>().add(AddSku(Sku(id: '12', name: 'name')));
            },
            child: const Text('Add'));
      } else if (state is SkuLoading) {
        return const CircularProgressIndicator();
      } else if (state is SkuLoaded) {
        return Text('Count: ${state.count}');
      } else if (state is SkuError) {
        return Text('Error: ${state.message}');
      } else {
        return const SizedBox();
      }
    })));
  }
}
