abstract class PageSelectionState {}

class PageSelectionInitState extends PageSelectionState {}

class UpdatePageSelectionState extends PageSelectionInitState {
  int pageIndex;
  UpdatePageSelectionState( this.pageIndex);
}