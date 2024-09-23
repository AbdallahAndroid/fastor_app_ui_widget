class DataPickerEntity {

  int? index;
  String? id;
  String? title;
  String? arTitle;
  String? enTitle;
  String? image;
  bool? isSelected   ;

  DataPickerEntity({
    this.index,
    this.id,
    this.title,
    this.arTitle,
    this.enTitle,
    this.image,
     this.isSelected,
  }) {
    isSelected ??= false;
  }


  @override
  String toString() {
    return 'DataPickerEntity{index: $index, id: $id, title: $title, imageUrl: $image, isSelected: $isSelected}';
  }

}