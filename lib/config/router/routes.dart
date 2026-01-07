enum AppRoutes {
  home('/'),
  contact('/contact'),
  photos('/photos'),
  videos('/videos'),
  mediaGallery('/media-gallery'),
  singleMediaGallery('/single-media-gallery');

  final String path;

  const AppRoutes(this.path);
}
