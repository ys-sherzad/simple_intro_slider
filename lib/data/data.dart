class SliderModel {
  String imageAssetPath;

  SliderModel({this.imageAssetPath});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();

  SliderModel sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/interior1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/interior2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/interior3.jpg");
  slides.add(sliderModel);

  return slides;
}
