

class Api {
  static String baseUrl = "https://dog.ceo/api";
  static String allBreeds = "/breeds/list/all";
  static String randomImageByBreed(String breed) => "/breed/$breed/images/random";
  static String imageListByBreed(String breed) => "/breed/$breed/images";
  static String randomImageBySubBreed(String breed, String subBreed) => "/breed/$breed/$subBreed/images/random";
  static String imageListBySubBreed(String breed, String subBreed) => "/breed/$breed/$subBreed/images";
}