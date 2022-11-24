class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  static const myUser = User(
    imagePath:
        'https://scontent.fcpq3-1.fna.fbcdn.net/v/t39.30808-6/269746944_659583615213051_7202690804359900855_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEQhn8uVObTALnGvQCM8GxikNhnZ1StlDmQ2GdnVK2UOTBt9y8VH1CPTecWO6zV31ULHOxmTog22GsdbmSYKF46&_nc_ohc=0gLmPWL5LqMAX9M25Wl&_nc_ht=scontent.fcpq3-1.fna&oh=00_AfDBDYEEuqlIuoIkNbh8H_UeHlq890Yv-3VEWn6bVIVSXw&oe=6382D613',
    name: 'Fabricio Onofre',
    email: 'fabricio.falcoon@gmail.com',
    about:
        'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    isDarkMode: false,
  );
}
