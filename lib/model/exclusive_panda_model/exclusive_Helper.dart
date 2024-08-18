
import 'package:foodpanda_app/model/exclusive_panda_model/exclusive_item_model.dart';

class ExclusiveHelper {
  static var exclusiveListModel = [
    ExclusiveItemModel(name: 'Brownies', remainingTime: '15 min', deliveryPrice: 'Free Delivery', image: 'assets/cake.jpg', totalRating: '300', rating: '4.3', subTitle: 'Backery'),
    ExclusiveItemModel(name: 'OPTP G11', remainingTime: '35 min', deliveryPrice: '50', image: 'assets/chicken.jpg', totalRating: '400', rating: '4.7', subTitle: 'Burgers'),
    ExclusiveItemModel(name: 'China Town', remainingTime: '20 min', deliveryPrice: '600', image: 'assets/chinese.jpg', totalRating: '560', rating: '2.3', subTitle: 'Chinese'),

  ];

  static ExclusiveItemModel getStatusItem( int position) {
    return exclusiveListModel[position];
  }

  static var itemCount = exclusiveListModel.length;
}
