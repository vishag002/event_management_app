// service_data.dart
import 'package:event_management_app/models/service_model.dart';

List<ServiceModel> getServiceItems() {
  return [
    ServiceModel(
      imageUrl:
          'https://lh5.googleusercontent.com/proxy/U47y8_8HB4T3IGrTq8aLyb7mvbHtMoRG5fgKPx1OnadMmRBGrSUbtLhKQXUE3RondLGoaq13Zn5cFIjWXyDaykiaJe_QbDFpfbEE2hz_itTaOS7alvigY8-WZA',
      title: 'Finibus Bonorum et Malorum ',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature',
      price: 99.99,
      status: 'Active',
    ),
    ServiceModel(
      imageUrl:
          'https://sousys.co.in/wp-content/uploads/2024/02/dj-service-1000x1000-1.jpeg',
      title: 'Finibus Bonorum et Malorum',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature',
      price: 149.99,
      status: 'Pending',
    ),
    ServiceModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRstgDu88i4tfrnMfGsqUCEbqrC49Ye5HRp2g&s',
      title: 'Finibus Bonorum et Malorum',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature',
      price: 120.50,
      status: 'Active',
    ),
    ServiceModel(
      imageUrl:
          'https://s.alicdn.com/@sc04/kf/H198e6af29950427a9f441dc9cc7db788Z.jpg_720x720q50.jpg',
      title: 'Finibus Bonorum et Malorum',
      description:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature',
      price: 120.50,
      status: 'Active',
    ),
    // Add more items as needed
  ];
}
