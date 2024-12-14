class Category {
  final String name; // Main category name
  final List<SubCategory> subCategories; // List of subcategories

  Category({
    required this.name,
    required this.subCategories,
  });
}

class SubCategory {
  final String name; // Subcategory name
  final String imageUrl; // Network image URL

  SubCategory({
    required this.name,
    required this.imageUrl,
  });
}

////
const String weddingImage =
    "https://img.freepik.com/premium-vector/event-management-wedding-planner-manager-planning-event-conference-party_501813-2157.jpg";
const String corporateImage =
    "https://www.static-contents.youth4work.com/ed/vDocuments/Education/PreviewPic/54a93b84-d468-4d49-89b0-370d580f5b3e.png";
const String privateImage =
    "https://images.unsplash.com/photo-1653821355736-0c2598d0a63e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZXZlbnQlMjBwbGFubmluZ3xlbnwwfHwwfHx8MA%3D%3D";

///
final List<Category> categories = [
  Category(
    name: 'Wedding Event',
    subCategories: [
      SubCategory(
        name: 'Venue and Accommodation',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Catering and Food',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Decoration and Design',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Entertainment',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Photography and Videography',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Fashion and Beauty',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Logistics and Transportation',
        imageUrl: weddingImage,
      ),
      SubCategory(
        name: 'Stationery and Printing',
        imageUrl: weddingImage,
      ),
    ],
  ),
  Category(
    name: 'Corporate Event',
    subCategories: [
      SubCategory(
        name: 'Venue and Logistics',
        imageUrl: corporateImage,
      ),
      SubCategory(
        name: 'Audio-visual and Technology',
        imageUrl: corporateImage,
      ),
      SubCategory(
        name: 'Catering and Hospitality',
        imageUrl: corporateImage,
      ),
      SubCategory(
        name: 'Entertainment and Engagement',
        imageUrl: corporateImage,
      ),
      SubCategory(
        name: 'Marketing and Branding',
        imageUrl: corporateImage,
      ),
      SubCategory(
        name: 'Photography and Videography',
        imageUrl: corporateImage,
      ),
    ],
  ),
  Category(
    name: 'Private Event',
    subCategories: [
      SubCategory(
        name: 'Venue and Logistics',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Audio and Logistics',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Artist and Entertainment',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Catering and Hospitality',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Marketing and Branding',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Ticketing and Crowd Management',
        imageUrl: privateImage,
      ),
      SubCategory(
        name: 'Photography and Videography',
        imageUrl: privateImage,
      ),
    ],
  ),
];
