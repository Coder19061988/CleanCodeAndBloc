import '../../services/data_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sku_event.dart';
import 'sku_state.dart';

class SkuBloc extends Bloc<SkuEvent, SkuState> {
  final MyDataBase _myDataBase = MyDataBase();

  SkuBloc() : super(SkuInitial()) {
    on<AddSku>((event, emit) async {
      emit(SkuLoading());
      try {
        await _myDataBase.addMonoExceptions(event.sku.toMap());
        final count = await _myDataBase.getCount();
        emit(SkuLoaded(count: 1));
      } catch (e) {
        emit(SkuError(message: e.toString()));
      }
    });
  }
}
