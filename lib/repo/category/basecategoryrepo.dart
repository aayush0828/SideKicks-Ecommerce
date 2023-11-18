import 'package:walmart/config/models/categorymodel.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}