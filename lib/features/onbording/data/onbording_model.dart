import 'package:kian_sheeps_projects/helper/assets.dart';

class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({required this.image, required this.title, required this.body});
}

List<BordingModel> onbordingItems = [
  BordingModel(
      image: AssetsData.onBording1,
      title: 'اجود أنواع المنتجات الطازجة',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا'),
  BordingModel(
      image: AssetsData.onBording2,
      title: 'اجود أنواع المنتجات الطازجة',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا'),
  BordingModel(
      image: AssetsData.onBording3,
      title: 'اجود أنواع المنتجات الطازجة',
      body:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا'),
];
