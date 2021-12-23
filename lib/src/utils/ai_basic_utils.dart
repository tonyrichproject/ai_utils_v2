import '../models/ai_base_model.dart';

bool assigned(dynamic aObject) => (aObject != null) ? true : false;
bool isAvailable(AiBaseItem aObject) => (assigned(aObject) && aObject.isNotEmpty);
