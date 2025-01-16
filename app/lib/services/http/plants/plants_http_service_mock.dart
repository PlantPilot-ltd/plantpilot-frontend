import 'package:app/services/index.dart';
import 'package:core/core.dart';

class PlantsHttpServiceMock extends PlantsHttpServiceBase {
  const PlantsHttpServiceMock(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<List<PlantHttpModel>>> plants() async {
    return ThrowableResponse.success(const [
      PlantHttpModel(
        id: '0',
        name: 'Decorative banana',
        image:
            'https://static.vecteezy.com/system/resources/previews/046/828/220/large_2x/decorative-banana-plant-isolated-on-transparent-background-png.png',
        type: PlantTypeHttpModel.medium,
      ),
      PlantHttpModel(
        id: '1',
        name: 'Monstera',
        image:
            'https://static.vecteezy.com/system/resources/previews/027/254/678/large_2x/monstera-plant-in-a-pot-on-a-white-background-ai-generated-png.png',
        type: PlantTypeHttpModel.medium,
      ),
      PlantHttpModel(
        id: '2',
        name: 'Potted plant',
        image:
            'https://static.vecteezy.com/system/resources/previews/049/678/791/non_2x/indoor-potted-plant-with-lush-green-leaves-in-a-decorative-pot-cut-out-transparent-png.png',
        type: PlantTypeHttpModel.small,
      ),
      PlantHttpModel(
        id: '3',
        name: 'Potted plant',
        image:
            'https://static.vecteezy.com/system/resources/previews/049/678/791/non_2x/indoor-potted-plant-with-lush-green-leaves-in-a-decorative-pot-cut-out-transparent-png.png',
        type: PlantTypeHttpModel.medium,
      ),
      PlantHttpModel(
        id: '4',
        name: 'Large green-leafed plant',
        image:
            'https://static.vecteezy.com/system/resources/previews/052/658/004/large_2x/large-green-leafed-plant-in-black-pot-png.png',
        type: PlantTypeHttpModel.medium,
      ),
    ]);
  }
}
