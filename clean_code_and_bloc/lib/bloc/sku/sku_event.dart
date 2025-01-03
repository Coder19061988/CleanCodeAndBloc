import '../../models/sku.dart';

abstract class SkuEvent {}

class AddSku extends SkuEvent {
  final Sku sku;

  AddSku(this.sku);
}
